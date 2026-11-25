# Kerr stability, Lean run log

Date: 2026-11-25. All commands run from `~/workspace/kerr-stability-lean/kerr-mathlib`
unless noted. Disk at start: 28 GB free on a 150 GB volume.

## Versions (exact)

- Lean (version 4.23.0, x86_64-unknown-linux-gnu, commit
  50aaf682e9b74ab92880292a25c68baa1cc81c87, Release)
- Lake version 5.0.0-src+50aaf68 (Lean version 4.23.0)
- Toolchain file: `leanprover/lean4:v4.23.0`
- Mathlib: tag `v4.23.0`, commit `37df177aaa770670452312393d4e84aaad56e7b6`
  (from `lake-manifest.json`; other pinned deps: batteries
  `d117e2c28cba42e974bc22568ac999492a34e812`, aesop
  `247ff80701c76760523b5d7c180b27b7708faf38`, Qq
  `9b703a545097978aef0e7e243ab8b71c32a9ff65`, proofwidgets
  `6e47cc88cfbf1601ab364e9a4de5f33f13401ff8`)

## Project setup

- `lake new kerr-mathlib mathlib` FAILED: Lake 5.0 has no `mathlib`
  template. The correct template is `math`:
  `lake new kerr-mathlib math`.
- That template pulled the newest Mathlib (rev `6cf8de98`), which needs
  Lean `v4.37.0-rc1` and failed to elaborate under Lean 4.23.0.
  Fix: pinned Mathlib to `rev = "v4.23.0"` in `lakefile.toml` and reset
  `lean-toolchain` to `leanprover/lean4:v4.23.0`. `lake update mathlib`
  then checked out `37df177a` and its matching dependency revisions.

## Mathlib cache

- `lake exe cache get` (full) did NOT complete. The Azure per-file
  download ran at roughly 30 s per small file through the sandbox
  egress proxy, reached about 6,048 of ~6,858 Mathlib modules, and was
  interrupted by a runtime restart before extraction.
- Two cache-tooling fixes were needed before any download worked:
  1. `leantar` install failed in `tar` (`Cannot change ownership to
     uid 1001, gid 118: Operation not permitted`). The cache tool looks
     for `~/.cache/mathlib/leantar-0.1.15`; copying the already-present
     `~/.cache/mathlib/leantar` (which already reported 0.1.15) to that
     name let the tool skip the reinstall.
  2. An early `cache get` run failed fetching the ProofWidgets cloud
     release; the later targeted run did not hit that failure.
- Targeted fetch instead (this is what the build actually uses):
  `lake exe cache get Mathlib.Data.Real.Sqrt
  Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
  Mathlib.Tactic.Ring Mathlib.Tactic.Linarith`
  Output: `Attempting to download 263 file(s) ... Downloaded: 263 file(s)
  [attempted 263/263 = 100%]`, `Decompressing 1800 file(s)`,
  `Unpacked in 34500 ms`, `Completed successfully!`, exit 0.
  Result: 1,555 `.olean` files, 1.2 GB, under
  `.lake/packages/mathlib/.lake/build`.
- Consequence: only the import closure of `KerrMathlib/Basic.lean` has
  prebuilt oleans. A file importing other Mathlib modules would need
  another targeted `cache get` for those modules (or a full cache
  download, or a from-source build).

## The Lean file

- Source: `KerrMathlib/Basic.lean` (110 lines, module `KerrMathlib.Basic`,
  lib root `KerrMathlib.lean` already imported it).
- Copy: `~/workspace/kerr-stability-lean/KerrStability.lean`
  (identical after its 23-line header; verified with `diff`).
- Definitions are under `namespace Kerr` (`Kerr.Delta`, `Kerr.Sigma`):
  bare `Sigma` would clash with Lean core's `Sigma` type.
- Theorems proved (8 total): `delta_factor`, `discriminant_pos`,
  `delta_at_add_sqrt`, `delta_at_sub_sqrt`, `horizon_roots`,
  `sigma_pos`, `sigma_pos_at_horizon`, `delta_div_sigma_at_horizon`.
  (The two `delta_at_*_sqrt` lemmas and `sigma_pos_at_horizon` are
  the split-out steps behind the combined `horizon_roots` and
  `delta_div_sigma_at_horizon` statements.)
  `grep -c theorem` on the file returns 9 because the word also
  appears once in a doc comment ("PDE theorems").
- Fixes made during checking, all in the file itself:
  1. The `/-! -/` module doc comment had to move after the `import`
     lines (Lean requires imports first).
  2. `sq_pos_of_ne_zero` takes only the `≠ 0` hypothesis (first
     argument is implicit), so `sq_pos_of_ne_zero r hr` became
     `sq_pos_of_ne_zero hr`.
  3. `discriminant_pos` does not use its `0 < M` hypothesis
     (`|a| < M` alone forces `M > 0`); the binder is named `_hM` to
     silence the unused-variable linter warning while keeping the
     stated interface.

## Verification (final clean runs, 2026-11-25)

```
$ lake env lean KerrMathlib/Basic.lean
FINAL_LEAN_EXIT:0
(no output at all: no errors, no warnings)

$ grep -rn "sorry" KerrMathlib/Basic.lean
SORRY_GREP_EXIT:1   (1 = no match; also grep for admit/axiom found nothing)

$ lake build
✔ [1816/1818] Built KerrMathlib.Basic (10s)
✔ [1817/1818] Built KerrMathlib (5.8s)
Build completed successfully (1818 jobs).
FINAL_BUILD_EXIT:0
```

Axiom check (`lake env lean /tmp/AxiomCheck.lean`, `#print axioms` for
each of the 8 theorems), exit 0, every theorem reports:

```
'Kerr.<name>' depends on axioms: [propext, Classical.choice, Quot.sound]
```

No `sorryAx` anywhere. Those three are Lean's standard axioms.

Note: `lake env lean --noSorry` does NOT exist in Lean 4.23.0
(`lean: unrecognized option '--noSorry'`). The no-sorry evidence is
the grep above plus the `#print axioms` output (a `sorry` would show
as `sorryAx`).

## What this does NOT prove

- The nonlinear stability of Kerr black holes (the full PDE theorem).
- Linear / mode stability, Teukolsky estimates, or any decay estimate.
- Anything about the Einstein equations, the event horizon as a global
  causal concept (only `Δ / Σ = 0` at `r+` given `Σ ≠ 0`, plus
  `Σ > 0` at `r+`), extremal Kerr (`|a| = M`), Kerr-AdS, Kerr-Newman,
  or large perturbations.
- Hintz arXiv:2606.28253 and Szeftel arXiv:2609.40068 are preprints as
  of 2026-11-25; no peer-review status is claimed for either here.

## Sizes

- Project dir: 2.1 GB total (mostly `.lake`, including the Mathlib
  sources and the 1.2 GB extracted build cache).
- Disk after the run: 27 GB free.
