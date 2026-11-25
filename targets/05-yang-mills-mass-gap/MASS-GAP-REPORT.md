# Mass gap report

Run: stage2-massgap-2026-11-25-01
Predicate: pred-massgap-v01
Date: Nov 25, 2026

## Words

- gap: work that remains
- cost: money the run spent

## Open steps, hardest first

- Step 1: build the interacting continuum limit.
- Step 1 plain words: remove the lattice cutoff and keep control at every length scale.
- Step 1 status: open.
- Step 1 unblock: uniform bounds across all scales that survive the cutoff removal.
- Step 1 owner: a continuum limit run.
- Step 1 next step: prove scale-uniform estimates for Wilson lattice gauge theory.

- Step 2: prove a positive physical gap.
- Step 2 plain words: show correlations decay exponentially in Euclidean time.
- Step 2 status: open.
- Step 2 unblock: uniform exponential decay for observables that generate all nonvacuum states.
- Step 2 owner: a spectral gap run.
- Step 2 next step: prove decay rates that do not collapse as the volume grows.

- Step 3: prove a unique large volume limit.
- Step 3 plain words: show the answer does not depend on where the boundary sits.
- Step 3 status: open.
- Step 3 unblock: bounds on boundary effects that hold uniformly as the boundary recedes.
- Step 3 owner: a large volume run.
- Step 3 next step: control boundary terms in the lattice limit.

- Step 4: control the limiting gauge-invariant correlations.
- Step 4 plain words: show the limit is strong enough for rigorous reconstruction.
- Step 4 status: open.
- Step 4 unblock: axiom-level control of the limiting correlations.
- Step 4 owner: a reconstruction run.
- Step 4 next step: verify the Osterwalder-Schrader axioms hold in the limit.

- Step 5: formalize P(phi)2 in Lean as the training case.
- Step 5 plain words: prove the solved 2d case in Lean before the 4d case.
- Step 5 status: open.
- Step 5 unblock: a Lean formalization of the Glimm and Jaffe construction.
- Step 5 owner: a P(phi)2 Lean run.
- Step 5 next step: formalize the 2d construction in Lean, no Mathlib, no placeholder proofs.

- Step 6: formalize the Feldman and Osterwalder phi4_3 gap in Lean.
- Step 6 plain words: prove the solved 3d gap in Lean as the nearest model.
- Step 6 status: open.
- Step 6 unblock: a Lean formalization of the 1976 cluster expansion argument.
- Step 6 owner: a phi4_3 Lean run.
- Step 6 next step: formalize the cluster expansion and the gap bound in Lean.

## Falsification checks

- Check 1: OpenAI proved a mass gap.
- Check 1 test: the Nov 10, 2026 assessment states no mass gap was claimed.
- Check 1 result: the claim fails, the plan stands.
- Check 2: the toy gap proves the real gap by the same argument.
- Check 2 test: the toy uses a finite model, the real case needs a continuum limit.
- Check 2 result: the claim fails, the toy stays a toy.
- Check 3: the vacuum uniqueness in QFT.lean gives a gap.
- Check 3 test: uniqueness says one vacuum exists, it says nothing about the next energy level.
- Check 3 result: the claim fails, the gap stays open.

## What this run proved

- The toy model has a gap of m.
- The toy vacuum is unique.
- No toy state sits between 0 and m.
- Lean checked each proof with exit 0.
- No proof in this run uses a placeholder.

## What this run did not prove

- No 4d Yang-Mills mass gap.
- No interacting 4d theory.
- No Clay prize claim.
