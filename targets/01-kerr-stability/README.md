# 01 Kerr stability

Status: in progress, 25 Nov 2026.

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
- A Mathlib project is being built to prove the elementary algebra: Delta factors through $(r-M)^2$, subextremality gives a positive discriminant, roots $r_{\pm} = M \pm \sqrt{M^2-a^2}$, and Delta over Sigma is 0 at $r_+$.
- The full nonlinear PDE theorem is not formalised in Lean, here or anywhere we can establish.
- Lean 4.23.0, Lake 5.0.0. Core Lean alone has no `ring` tactic and no Real arithmetic, so Mathlib is required.
