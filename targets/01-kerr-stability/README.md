# 01 Kerr stability

Status: in progress, 25 Nov 2026. Elementary algebra proved in Lean, full stability not proved.

## Question

Can a rotating black hole remain stable after a disturbance, and does it settle back to a nearby Kerr black hole?

## Answer so far

- Yes, for slow rotation and a small disturbance, it settles to a nearby Kerr black hole.
- The final mass and spin can differ from the starting values.
- The slow rotation proof is Klainerman, Szeftel, Giorgi, and Shen, 2021 to 2022.
- That proof covers $|a|/M$ much less than 1, with no axisymmetry imposed.

## 2026 preprints, not yet peer reviewed

- Hintz claims full subextremal nonlinear stability, arXiv:2606.28253, 26 Jun 2026, v2 3 Aug 2026.
- Szeftel claims the same, by extending Klainerman and Szeftel, arXiv:2609.40068, 30 Sep 2026, v2 5 Nov 2026.
- Both are preprints as of 25 Nov 2026. GPT-6.2 Astra could not verify either from its own knowledge, the arXiv pages were checked directly.

## Still not proved

- Extremal Kerr, $|a| = M$, needs a different statement.
- Kerr-AdS can be unstable by superradiance.
- Large perturbations have no general return to Kerr guarantee.
- Kerr-Newman needs the coupled Einstein-Maxwell equations.

## Lean work

- `SCOPE.md` in this folder states what Lean can and cannot check here.
- `KerrStability.lean` proves the elementary algebra, 8 theorems, no `sorry`.
- Lean 4.23.0, Mathlib v4.23.0, commit 37df177a.
- Checked 25 Nov 2026: `lake env lean KerrMathlib/Basic.lean` exit 0, no output, `lake build` exit 0, 1818 jobs.
- Axioms: only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`.
- `RUN-LOG.md` in this folder gives the exact versions, the cache workaround, and the full output.
- The full nonlinear PDE theorem is not formalised in Lean, here or anywhere we can establish.

## Theorems in KerrStability.lean

- `delta_factor`: Delta factors through $(r-M)^2$ and the discriminant.
- `discriminant_pos`: subextremality makes $M^2-a^2$ positive.
- `delta_at_add_sqrt` and `delta_at_sub_sqrt`: both roots vanish Delta.
- `horizon_roots`: both roots, $r_- < r_+$, and $0 < r_+$.
- `sigma_pos` and `sigma_pos_at_horizon`: Sigma is positive at $r_+$.
- `delta_div_sigma_at_horizon`: Delta over Sigma is 0 at $r_+$.
