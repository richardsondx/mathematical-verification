# Claim sheet, target 05

- Date: Nov 25, 2026
- Repo: https://github.com/richardsondx/mathematical-verification
- Proof commit: https://github.com/richardsondx/mathematical-verification/commit/ae053e7b3d09e378031ccc237d3ee854c5c26662
- Target folder: targets/05-yang-mills-mass-gap/
- Lean: 4.23.0, core only, no Mathlib.

## Short claim, post ready

- Lean verified one reconstruction step on a one-site toy model.
- The toy model meets the OS axioms.
- Its reflected pairing gives a true inner product.
- Clustering plus invariance forces an invariant vector to be a vacuum multiple.
- The 4d mass gap stays open.
- Proof: https://github.com/richardsondx/mathematical-verification/commit/ae053e7b3d09e378031ccc237d3ee854c5c26662

## Longer honest version

- Lean checked two files in target 05.
- QFT.lean states the Wightman axioms and the OS axioms as structures.
- QFT.lean proves the null space quotient carries a true inner product.
- QFT.lean proves clustering plus invariance forces one vacuum, up to a scale factor.
- QFT_Toy.lean builds a Nat one-site model that meets the OS structure.
- QFT_Toy.lean proves the reconstruction step on that one example only.
- Lean ran both files with exit 0 and no errors.
- Neither file holds a sorry.
- No theorem in either file depends on sorryAx.
- Five QFT theorems depend on no axioms.
- One QFT theorem depends only on Quot.sound.
- Five toy theorems depend only on propext.
- One toy theorem depends on propext and Quot.sound.
- Reflection positivity, symmetry, and clustering are inputs, not proved facts.
- The toy model is one site, not a field theory.
- No interacting 4d theory is built here.
- No mass gap is proved here.
- The 4d Yang-Mills mass gap stays open.
- The full 4d construction stays open.

## What not to post

- Do not post that the mass gap is proved.
- Do not post that Yang-Mills existence is proved.
- Do not post that the full construction is done.
- Do not post that the toy model is a field theory.
