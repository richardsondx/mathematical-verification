# Einstein-Vlasov gap report v01

Run: stage2-einstein-vlasov-2026-11-25-01
Date: Nov 25, 2026
Predicate: pred-einstein-vlasov-v01
Status: gap report, full question open

## Words

- pass: a check meets its bar
- fail: a check does not meet its bar
- done: a unit has a commit and its checks pass
- gap: work that remains
- check: the act of verification on the real artifact
- cost: money the run spent

## 1. What Lean proved

- Lean proved total particle count is conserved by one transport step.
- Lean proved the total of a sum is the sum of the totals.
- Lean proved a single deposit carries its full count to the total.
- Lean proved scattering preserves the total count.
- Lean ran EinsteinVlasov.lean with exit 0.
- Lean ran the axiom check with exit 0.
- No theorem depends on sorryAx.
- The theorems depend only on propext and Quot.sound.

## 2. Open steps, hardest first

- Step 1: formalize the continuum Einstein-Vlasov system in Lean.
- Step 1 unblock: build Lorentzian geometry in Lean first.
- Step 1 unblock: build the PDE theory for the Einstein equations in Lean first.
- Step 2: prove Minkowski stability in Lean.
- Step 2 unblock: formalize the vector field method in Lean first.
- Step 2 unblock: formalize energy estimates for the Vlasov field in Lean first.
- Step 3: prove small data global existence without symmetry in Lean.
- Step 3 unblock: finish Step 2 first.
- Step 3 unblock: formalize decay estimates for the metric in Lean first.
- Step 4: prove long time asymptotics in Lean.
- Step 4 unblock: finish Step 3 first.
- Step 4 unblock: formalize decay rates for the energy momentum tensor in Lean first.
- Step 5: prove future stability of FLRW solutions in Lean.
- Step 5 unblock: adapt Step 2 to an expanding background first.
- Step 6: prove stability of static steady states.
- Step 6 unblock: turn numerical evidence into a proof first.
- Step 6 unblock: settle the binding energy hypothesis first.
- Step 7: prove global existence for general large data.
- Step 7 unblock: find new ideas first, this is open in mathematics.
- Step 8: describe black hole formation from large data.
- Step 8 unblock: finish Step 7 first.

## 3. Falsification

- Counter 1: the finite toy proves continuum stability by the same argument.
- Counter 1 test: the toy keeps finite cells, the continuum needs a limit.
- Counter 1 result: the counter fails, the toy stays finite.
- Counter 2: the transport step creates or destroys particles.
- Counter 2 test: Lean proved step_conserves with exit 0.
- Counter 2 result: the counter fails, the total is conserved.
- Counter 3: the map claims a proved case without a source.
- Counter 3 test: each map piece holds a source, a date, and a status.
- Counter 3 result: the counter fails, the sources check out.

## 4. What stays open

- The full Einstein-Vlasov question stays open.
- Global existence for small data without symmetry stays open in Lean.
- Long time behaviour of the full system stays open in Lean.
- Stability of static steady states stays open in mathematics.
- Global existence for general large data stays open in mathematics.
