# Mass gap map v02

Run: stage2-massgap-2026-11-25-01
Predicate: pred-massgap-v01
Date: Nov 25, 2026
Version: v02, fix cycle 1, section 7 now holds source, date, status per item
Lean: 4.23.0

## Words

- pass: a check meets its bar
- fail: a check does not meet its bar
- gap: work that remains
- cost: money the run spent

## 1. The problem

- Source: Jaffe and Witten, Quantum Yang-Mills Theory, Clay problem statement, 2000.
- Date: 2000.
- Status: open.
- Claim: for every compact simple gauge group, build a quantum Yang-Mills theory on 4d Euclidean space.
- Claim: the theory must satisfy axioms at least as strong as Jaffe and Witten require.
- Claim: the theory must have a mass gap above zero.
- Plain words: the lightest particle has positive mass, and no particle sits between zero mass and that mass.
- Plain words: vacuum energy is zero, and the next energy level sits at or above a positive number.

## 2. The gap, in plain words

- Source: Jaffe and Witten, Clay problem statement, 2000.
- Date: 2000.
- Status: definition, not a result.
- Definition: the Hamiltonian has no spectrum strictly between zero and some positive number.
- Definition: that positive number is the mass gap.
- Plain words: nothing weighs between zero and the lightest particle.
- This run formalizes that definition in Lean as HasGap.

## 3. The OpenAI construction

- Source: OpenAI Yang-Mills Lean submission, Oct 28, 2026.
- Date: Oct 28, 2026.
- Status: preprint, assessed, not a Clay proof.
- Claim: a Wightman theory exists as a scaling limit of 4d Wilson lattice gauge theory.
- Claim: the construction covers any simple compact gauge group.
- Assessment: panel led by David Gross, Nov 10, 2026.
- Assessment date: Nov 10, 2026.
- Assessment status: reviewed, not a Clay prize ruling.
- What it proved: existence of a Wightman theory as a lattice scaling limit.
- What it did not prove: no mass gap.
- What it did not prove: no uniqueness of the large volume limit.
- What it did not prove: no Clay prize claim follows from it.

## 4. The solved analogue

- Source: Feldman and Osterwalder, Ann. Physics 97, 1976, 80-135.
- Date: 1976.
- Status: proved.
- Claim: weakly coupled phi4 in 3 dimensions satisfies the Wightman axioms.
- Claim: that theory has a nonzero mass gap.
- Title: The Wightman axioms and the mass gap for weakly coupled (phi4)3 quantum field theories.
- Plain words: the same kind of gap, proved in a simpler theory.
- Plain words: the 3d scalar case works, the 4d gauge case stays open.
- This is the model the 4d proof must imitate.

## 5. Earlier proved steps in this repo

- Source: QFT.lean, 05-yang-mills-mass-gap/ in this repo.
- Date: Nov 25, 2026.
- Status: proved in Lean, exit 0, no sorry.
- Claim: reflection positivity gives a nonneg pairing.
- Claim: the reflected pairing descends to the quotient by its null space.
- Claim: the quotient carries a true inner product.
- Claim: clustering plus invariance forces an invariant vector to be a vacuum multiple.
- Source: QFT_Toy.lean, same folder.
- Date: Nov 25, 2026.
- Status: proved in Lean, exit 0, no sorry.
- Claim: a Nat one-site model checks the reconstruction step.
- What neither file proves: no mass gap.
- What neither file proves: no interacting 4d theory.

## 6. The toy gap in this run

- Source: MassGap.lean, this run folder.
- Date: Nov 25, 2026.
- Status: proved in Lean, exit 0, no sorry.
- Claim: a two-state model with energies 0 and m has a gap of m.
- Claim: only the vacuum state has energy zero.
- Claim: no state sits between 0 and m.
- Plain words: the toy has a lightest particle, and nothing lighter except the vacuum.
- What the toy does not prove: nothing about real Yang-Mills.
- Energies in the toy are whole numbers, not real energies.

## 7. What stays open

- Open: continuum limit with uniform bounds across all length scales.
- Source: MASS-GAP-REPORT.md Step 1, this run.
- Date: Nov 25, 2026.
- Status: open.
- Open: uniform exponential decay in Euclidean time.
- Source: MASS-GAP-REPORT.md Step 2, this run.
- Date: Nov 25, 2026.
- Status: open.
- Open: unique large volume limit.
- Source: MASS-GAP-REPORT.md Step 3, this run.
- Date: Nov 25, 2026.
- Status: open.
- Open: axiom control in the limiting gauge-invariant correlations.
- Source: MASS-GAP-REPORT.md Step 4, this run.
- Date: Nov 25, 2026.
- Status: open.
- Open: Lean formalization of P(phi)2.
- Source: MASS-GAP-REPORT.md Step 5, this run.
- Date: Nov 25, 2026.
- Status: open.
- Open: Lean formalization of the Feldman and Osterwalder phi4_3 gap.
- Source: MASS-GAP-REPORT.md Step 6, this run.
- Date: Nov 25, 2026.
- Status: open.
- Each open step lists its unblock step in MASS-GAP-REPORT.md.
