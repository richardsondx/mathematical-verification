# 05 Yang-Mills mass gap

Status: axioms only, 25 Nov 2026. No mass gap proved.

## Question

Does quantum Yang-Mills theory in four dimensions exist, with a positive mass gap?

## What is in this folder

- `QFT.lean`, 196 lines, Lean 4.23.0, core Lean only, no Mathlib.
- `QFT_axiom_check.lean`, the same file plus axiom prints, for verification only.
- Checked 25 Nov 2026: `lean QFT.lean` exit 0, no errors, no `sorry`.
- Axiom check: 5 theorems depend on no axioms, 1 depends only on `Quot.sound`, none depend on `sorryAx`.

## What Lean proves here

- Reflection positivity gives a nonneg pairing.
- Schwinger functions are symmetric under permutation.
- The reflected pairing descends to the quotient by its null space.
- That quotient carries a true inner product.
- Clustering plus invariance forces an invariant vector to be a multiple of the vacuum.

## What is assumed, not proved

- Reflection positivity, symmetry, invariance, clustering, and regularity are inputs in the Osterwalder-Schrader structure.
- Spectrum, completeness, field laws, and cyclicity are slots in the Wightman structure, not proved facts.
- No analytic continuation from Euclidean to Minkowski space is proved.
- No interacting 4d theory is built here.
- No mass gap is proved. Vacuum uniqueness alone does not give a gap.

## Update, Nov 25, 2026

- Toy model added: `QFT_Toy.lean`, 283 lines, a Nat one-site check of the reconstruction step only.
- Toy axiom check added: `QFT_Toy_axiom_check.lean`, with axiom prints for the six toy theorems.
- Map added: `ENTIRE-MAP.md`, the full program map for the rigorous construction work.
- Gap report added: `GAP-REPORT.md`, which names the open gaps in the program.
- Toy check log added: `QFT_Toy_check.log`, the U2 run record for the toy model.
- Checked Nov 25, 2026 in this folder: `lean QFT_Toy.lean` exit 0, no errors, no `sorry`.
- Checked Nov 25, 2026 in this folder: `lean QFT_Toy_axiom_check.lean` exit 0, no `sorryAx`.
- Toy axiom result: five theorems depend only on `propext`, one also depends on `Quot.sound`.
- Status stays honest: axioms only, toy model added, no mass gap proved.

## Why this scope

- Full construction needs distributions, renormalization, uniform estimates, and limits.
- The P(phi)2 case in 2d is the classic proved example, Glimm and Jaffe, Nelson, Simon.
- The OpenAI Yang-Mills Lean submission of Oct 28, 2026 builds a Wightman theory as a lattice scaling limit, with no mass gap claimed.
- This file isolates the part Lean can check cleanly today, the axioms plus the null space step plus vacuum uniqueness, and labels the rest as open.
