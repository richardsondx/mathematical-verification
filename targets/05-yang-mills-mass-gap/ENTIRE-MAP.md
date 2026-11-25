# Entire map of the rigorous QFT construction program

- Run: stage2-qft-entire-2026-11-25-01
- Predicate: pred-qft-entire-v02
- Date: Nov 25, 2026
- Scope: This map lists the pieces of the full program.
- Scope: Each piece has a source, a date, and a status.
- Scope: Status words are proved, partial, open, or axioms only.
- Scope: No claim here lacks a source.
- Note: The full 4d interacting construction is not proved in full.
- Note: The mass gap is not proved.
- Note: A 2026 preprint is labelled as a preprint with its date.

## 1. Wightman axioms

- Source: https://en.wikipedia.org/wiki/Wightman_axioms
- Date: 1956, first published 1964
- Status: axioms only
- Settles: A built theory must meet these axioms to count as Wightman theory.

## 2. Osterwalder-Schrader axioms and reconstruction

- Source: https://en.wikipedia.org/wiki/Osterwalder%E2%80%93Schrader_axioms
- Source: https://liznbs.github.io/images/QCD/Oster1.pdf
- Date: 1973 and 1975
- Status: proved
- Settles: The reconstruction theorem is proved, with a growth condition added in 1975.

## 3. Free field

- Source: http://www.scholarpedia.org/w/index.php?title=Wightman_quantum_field_theory&oldid=59653
- Date: 1956
- Status: proved
- Settles: The free field already meets the axioms, so it needs no new step.

## 4. P(phi)2 in two dimensions

- Source: https://raw.githubusercontent.com/mrdouglasny/pphi2/main/docs/construction-overview.md
- Source: https://arxiv.org/pdf/1203.3991.pdf
- Date: 1968 to 1973
- Status: proved
- Settles: The math theorem is proved, while its Lean formalization stays partial.
- Note: The overview says its uniform gap step is still an open target.

## 5. Renormalization

- Source: https://www.numdam.org/item/AIHPA_1976__24_2_95_0.pdf
- Source: https://raw.githubusercontent.com/mrdouglasny/pphi2/main/docs/construction-overview.md
- Date: 1976
- Status: partial
- Settles: Wick ordering works in 2d, and phi4 in 3d is proved.
- Blocks: No full 4d Yang-Mills renormalization proof existed before Oct 2026.

## 6. Phi4 in three dimensions

- Source: https://www.numdam.org/item/AIHPA_1976__24_2_95_0.pdf
- Date: 1976
- Status: proved
- Settles: Magnen and Seneor proved the infinite volume limit with a mass gap.

## 7. Yang-Mills lattice construction

- Source: https://www.kitp.ucsb.edu/sites/default/files/YM_working_group.pdf
- Source: https://www.slac.stanford.edu/pubs/slacpubs/15750/slac-pub-15966.pdf
- Date: 1974, with Balaban work in the 1980s
- Status: partial
- Settles: Wilson gave the lattice in 1974, and Balaban gave UV stability bounds.
- Blocks: The lattice alone does not give the continuum limit or the gap.

## 8. Mass gap

- Source: https://en.wikipedia.org/wiki/Yang%E2%80%93Mills_existence_and_mass_gap
- Source: https://raw.githubusercontent.com/yang-mills-group/YM/main/docs/assessment-1.pdf
- Date: 2000
- Status: open
- Settles: A proof needs a positive lower bound on nonzero energies in 4d.

## 9. Clustering and spectrum

- Source: http://www.scholarpedia.org/w/index.php?title=Wightman_quantum_field_theory&oldid=59653
- Date: 1961
- Status: partial
- Settles: Clustering gives vacuum uniqueness in a general Wightman theory.
- Blocks: Clustering alone does not give a positive gap in Yang-Mills theory.

## 10. OpenAI Oct 2026 submission

- Source: https://raw.githubusercontent.com/yang-mills-group/YM/main/docs/assessment-1.pdf
- Date: Submitted Oct 28, 2026, assessed Nov 10, 2026
- Status: partial
- Settles: The assessment says existence is proved as a lattice scaling limit.
- Blocks: The assessment says no mass gap is claimed and no uniqueness is proved.
- Note: This is a 2026 assessment, not a peer reviewed journal paper.

## 11. Continuum limit and infinite volume uniqueness

- Source: https://raw.githubusercontent.com/yang-mills-group/YM/main/docs/assessment-1.pdf
- Date: Nov 10, 2026
- Status: open
- Settles: A proof needs one unique infinite volume limit for all subsequences.

## 12. Lean toy model in this run

- Source: ~/workspace/qft-rigorous-construction-2026-11-25/README.md
- Source: ~/workspace/math-verification-repo/targets/05-yang-mills-mass-gap/README.md
- Date: Nov 25, 2026
- Status: axioms only
- Settles: Lean checks the axioms plus the null space quotient plus vacuum uniqueness.
- Blocks: Lean here proves no interacting 4d theory and no mass gap.

## Count check

- Pieces: 12
- Pieces with a source: 12
- Pieces with a date: 12
- Pieces with a status: 12
- Status counts: proved 4, partial 4, open 2, axioms only 2
- Proved pieces: 2, 3, 4, 6
- Partial pieces: 5, 7, 9, 10
- Open pieces: 8, 11
- Axioms only pieces: 1, 12
