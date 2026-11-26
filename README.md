# Mathematical verification

Lean 4 checks of hard math and physics claims, with GPT-6.2 Astra as the research partner.

We do not claim a proof until Lean checks it. A preprint is a preprint. A peer reviewed paper is a peer reviewed paper. An axiom is an axiom.

Each target lives in its own folder at the root of this repo, for example `01-kerr-stability`, not under a `targets/` folder.

## Method

- Research model: GPT-6.2 Astra, via OpenRouter as `openai/gpt-6.2-astra`
- Proof checker: Lean 4.23.0, with Mathlib where Real arithmetic is needed
- Rule: no `sorry` in a file we call verified
- Rule: every file says what it proves and what it assumes
- Rule: a claim about a 2026 preprint says preprint, with its arXiv number and date

## Status of each target

Full targets proved: **0 of 7.**

| Target | Status | What Lean has checked | What stays open | Independent check | Last update |
|---|---|---|---|---|---|
| [01 Kerr stability](01-kerr-stability/) | Background algebra only | 8 algebra theorems about Delta and the horizons. No `sorry`, standard axioms only. These are not steps toward the stability proof. | The full nonlinear PDE stability theorem. It is not formalised anywhere we can find. No checklist to the full proof exists. | None run | 25 Nov 2026 |
| [02 Einstein-Vlasov](02-einstein-vlasov/) | Toy only, rated Tier 0 | Total particle count is conserved in a finite toy. | The real continuum problem. The continuum definitions in the repo are empty and not connected to the toy. | Hostile check: Tier 0, textbook exercise | 25 Nov 2026 |
| [03 Penrose inequality](03-penrose-inequality/) | Map only, by design | Nothing. | All of it. The [gap report](03-penrose-inequality/PENROSE-REPORT.md) lists 7 open steps. | None, map only | 25 Nov 2026 |
| [04 Cosmic censorship](04-cosmic-censorship/) | Not started | Nothing. | All of it. | None | None |
| [05 Yang-Mills mass gap](05-yang-mills-mass-gap/) | Checklist: 0 of 6 hard steps proved | Reconstruction steps that assume the Osterwalder-Schrader axioms. Small toy models. | All 6 hard steps. See the checklist below. | P(phi)2 file: Tier 0. QFT and MassGap files: none yet | 25 Nov 2026 |
| [06 Cosmological stability](06-cosmological-stability/) | Not started | Nothing. | All of it. | None | None |
| [07 Relativistic fluid regularity](07-relativistic-fluid-regularity/) | Not started | Nothing. | All of it. | None | None |

### Target 05 checklist

This list comes from the [program map](05-yang-mills-mass-gap/ENTIRE-MAP-v02.md) and [gap report](05-yang-mills-mass-gap/GAP-REPORT.md). It is the closest thing to a checklist in the repo.

**Hard steps proved: 0 of 6.**

| # | Hard step | Status |
|---|---|---|
| 1 | Distributions | Open |
| 2 | Renormalization | Open |
| 3 | Uniform estimates | Open |
| 4 | Limits | Open |
| 5 | Build an interacting 4d theory | Open |
| 6 | Prove the mass gap | Open |

The Lean files in this folder do not complete any of these steps.

## What Lean has checked so far

Nothing here is a proof of a target. Each entry says what the Lean code actually checks, and what stays open.

### 01 Kerr stability: background algebra

- **What Lean checks:** 8 elementary algebra theorems about the function Delta and the horizons of the Kerr solution. No `sorry`. Standard axioms only. See [the Lean file](01-kerr-stability/KerrStability.lean).
- **What this is:** background algebra. These results are verified in Lean, but they are not steps toward the stability proof. No checklist links them to the full theorem.
- **What stays open:** the full nonlinear PDE stability theorem. We know of no formal version of it anywhere.
- **Independent check:** none has run.

### 02 Einstein-Vlasov: toy only, Tier 0

- **What Lean checks:** in a finite toy, the total particle count stays the same over time. See [the Lean file](02-einstein-vlasov/EinsteinVlasov.lean).
- **Independent check:** a hostile reviewer rated it **Tier 0, a textbook exercise.** The proof pushes a finite array of whole numbers along a map and adds them up. It does not even use the fact that the transport map is a bijection. Stronger results already exist in the published literature.
- **Axiom check:** the [axiom check log](02-einstein-vlasov/EinsteinVlasov_check.log) is empty (0 bytes). The evidence of no `sorryAx` is the [check file](02-einstein-vlasov/EinsteinVlasov_axiom_check.lean) and the folder README, not a readable log.
- **What stays open:** the real continuum problem. The continuum definitions in the repo are empty shells and are not connected to the toy proofs.

### 03 Penrose inequality: map only

- **What Lean checks:** nothing. This folder is a map by design.
- **What exists:** a [map](03-penrose-inequality/PENROSE-MAP.md) of 7 special cases settled in the published literature and 5 cases still open, with sources and dates. A [gap report](03-penrose-inequality/PENROSE-REPORT.md) lists 7 open steps, hardest first, and names the main bottleneck.
- **What stays open:** all of it. Nothing is proved in this repo.

### 05 Yang-Mills mass gap: assumed axioms and toys

- **What Lean checks:**
  - Reconstruction steps from the Osterwalder-Schrader axioms. The axioms are taken as assumed structures, not built. See [the QFT file](05-yang-mills-mass-gap/QFT.lean).
  - A one-site toy model that meets the axioms.
  - A two-state toy with a gap.
  - A finite 2-site version of P(phi)2. See [the P(phi)2 file](05-yang-mills-mass-gap/PPhi2.lean) and [the MassGap file](05-yang-mills-mass-gap/MassGap.lean).
- **Independent check of the P(phi)2 file: Tier 0.** The gap comes from using integer fields. Over the real numbers, the double well vanishes. A bound on a classical action is not a quantum spectral gap. The main construction statement is an empty conjunction that is never filled in.
- **Independent check of the QFT and MassGap files:** none yet.
- **What stays open:** all 6 hard steps on the checklist above. No interacting 4d theory is built. No mass gap is proved.

### 04, 06, 07: not started

[04 Cosmic censorship](04-cosmic-censorship/), [06 Cosmological stability](06-cosmological-stability/), and [07 Relativistic fluid regularity](07-relativistic-fluid-regularity/) have a README only. No Lean code. No map.

## Shortlist

Full targets proved: 0 of 7.

- [01 Kerr stability](01-kerr-stability/): background algebra only. 8 algebra theorems verified in Lean. Not steps toward the proof.
- [02 Einstein-Vlasov](02-einstein-vlasov/): toy only. Rated Tier 0 by a hostile check.
- [03 Penrose inequality](03-penrose-inequality/): map only. See the [map](03-penrose-inequality/PENROSE-MAP.md) and [gap report](03-penrose-inequality/PENROSE-REPORT.md).
- [04 Cosmic censorship](04-cosmic-censorship/): not started.
- [05 Yang-Mills mass gap](05-yang-mills-mass-gap/): checklist, 0 of 6 hard steps proved. Toy files rated Tier 0 where checked.
- [06 Cosmological stability](06-cosmological-stability/): not started.
- [07 Relativistic fluid regularity](07-relativistic-fluid-regularity/): not started.

## Small targets

Small bounded cases, separate from the 7 full targets above. A win here is a bounded finite fact, not the open problem. The table says "bounded finite case" with the date, never the name of the open problem.

Bounded finite cases proved: **1 of 10.**

| Target | Status | What Lean has checked | What stays open | Independent check | Last update |
|---|---|---|---|---|---|
| [06 Distance graph, S = {1, 3, 8}](small-targets/06-distance-graph/) | bounded finite case | Lower bound 4/11 on the independence ratio, pattern {1, 3, 8, 10} in ZMod 11, period 11. Lean exits 0, no sorry, axioms propext, Classical.choice, Quot.sound only. | The exact independence ratio, the fractional chromatic number, Carraher conjecture 38. | Gemini hostile review, uncapped: confirms the 4/11 lower bound, rates it not a breakthrough, a routine formal verification of a small elementary periodic witness. | 26 Nov 2026 |

## How to check a target

- Read its README first, it states the exact claim and the status
- Run `lean <file>.lean` in its folder, expect exit 0 and no errors
- Run the axiom check file where one is given, expect no `sorryAx`
- Mathlib targets need a Lake project, see that target's README

## What counts as done

- The exact statement is written in Lean
- Lean accepts it with no `sorry`
- The status line in the target README says proved, with the date and the Lean version
- Anything less is labelled in progress, partial, or axioms only

This README uses the word "proved" next to a target only when the full target is proved in Lean, with no `sorry`, and an axiom check shows no `sorryAx`. No target meets that bar today. Smaller results get their own labels. A finite toy is labelled "toy". A literature survey is labelled "map". Algebra that does not form a step of the proof is labelled "background". A target shows a checklist only when the repo has a clear list of steps to the full proof. Each step is then marked verified or open, with a count. A target without such a list shows its status only.

## How to cite

Please cite this repository and the original sources you use. Credit the scholars listed in each target folder for their work.

```bibtex
@misc{dackam_mathematical_verification,
  author       = {Dackam, Richardson},
  title        = {Mathematical verification: Lean 4 checks of hard math and physics claims},
  howpublished = {GitHub repository},
  note         = {Add the date you accessed it}
}
```

## Author

Richardson Dackam is an independent researcher in Toronto, Canada.

- LinkedIn: https://linkedin.com/in/richardsondx
- X: https://x.com/RichardsonDx

## License

MIT, see `LICENSE`.
