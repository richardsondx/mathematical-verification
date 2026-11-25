# PPHI2 Report

- Run: stage2-pphi2-lean-2026-11-25-01
- Date: Nov 25, 2026
- Scope: full P(phi)2 construction in Lean
- Map source: PPHI2-MAP.md
- Lean source: the PPhi2 Lean file

## What this run proved

- This run proved a finite two-site lattice model only.
- Fields were Int values on Bool sites.
- The action stayed nonnegative for every field.
- The vacuum was unique when m was positive.
- A nonzero field had action at least m squared.
- A model draft is not proof.
- Lean decides if code checks.

## What this run did not prove

- This run did not prove the full construction.
- This run did not prove a continuum gap.
- This run did not prove a 4d mass gap.
- The main construction statement stayed a definition only.
- No Lean proof removed the cutoff.
- No Lean proof built the continuum field.
- No Lean proof checked the full OS axioms.

## Open steps, hardest first

### 1 Continuum limit and cutoff removal

- Hardest open step: remove cutoffs and take the continuum limit in Lean.
- Owner: continuum limit lead.
- Next step: formalize lattice spacing and volume as Lean parameters.
- Source: Glimm and Jaffe proved cutoff removal in 1968.
- Lean status: open.

### 2 OS axioms check for the continuum theory

- Owner: OS axioms lead.
- Next step: formalize reflection positivity for the continuum Schwinger functions.
- Source: Osterwalder and Schrader published the axioms in 1973.
- Lean status: partial axiom steps exist only.

### 3 Continuum mass gap

- Owner: spectral gap lead.
- Next step: link the continuum Hamiltonian spectrum to a positive lower bound.
- Source: Glimm, Jaffe, and Spencer proved the gap in 1974.
- Lean status: only a two-site toy gap exists.

### 4 Free Gaussian field and Wick ordering

- Owner: free field lead.
- Next step: build the Gaussian measure on two-dimensional Euclidean space in Lean.
- Source: Nelson built the free field in 1973.
- Lean status: open.

### 5 Distributions and renormalization

- Owner: analysis lead.
- Next step: formalize distributions and Wick powers as Lean objects.
- Source: Nelson treated Wick ordering in 1966.
- Lean status: open.

## Falsification handoff

### Check 1: the finite version proves the full construction

- Explanation: Claim: the finite version proves the full construction.
- Prediction: Prediction: the finite proof should extend without a limit step.
- World A: World A: the finite model already proves the full construction.
- World B: World B: the finite model proves a finite analogue only.
- Separating observation: Separating observation: the finite model keeps a cutoff.
- Test named before the result: Test: read the Lean file and check for a limit step.
- Test run with source: Test run: the Lean file defines two Bool sites and Int fields.
- Test run with source: Test run: the file states the main construction as a definition only.
- Verdict: Verdict: the claim fails.
- What would change the verdict: What would change the verdict: a Lean proof that removes the cutoff.

### Check 2: the toy gap proves the continuum gap

- Explanation: Claim: the toy gap proves the continuum gap.
- Prediction: Prediction: the toy gap should imply a continuum spectral gap.
- World A: World A: the toy gap transfers directly to the continuum.
- World B: World B: the toy gap stays a finite lattice analogue.
- Separating observation: Separating observation: the toy uses Int fields on two sites.
- Test named before the result: Test: read the action gap theorem and its field type.
- Test run with source: Test run: the action gap theorem uses phi from Bool to Int.
- Test run with source: Test run: the file contains no continuum limit.
- Verdict: Verdict: the claim fails.
- What would change the verdict: What would change the verdict: a Lean limit proof for the gap.

### Check 3: vacuum uniqueness in the finite model gives a continuum gap

- Explanation: Claim: finite vacuum uniqueness gives a continuum gap.
- Prediction: Prediction: one vacuum should imply a positive next energy level.
- World A: World A: uniqueness alone yields a continuum gap.
- World B: World B: uniqueness says nothing about the next level.
- Separating observation: Separating observation: uniqueness fixes the zero level only.
- Test named before the result: Test: read the vacuum unique theorem and check its conclusion.
- Test run with source: Test run: the vacuum unique theorem concludes phi equals the zero field.
- Test run with source: Test run: the theorem states no bound on excited states.
- Verdict: Verdict: the claim fails.
- What would change the verdict: What would change the verdict: a Lean spectral bound above the vacuum.

## Bottom line

- The finite lattice result stands.
- The full construction stays open.
- The hardest step is cutoff removal and the continuum limit.
