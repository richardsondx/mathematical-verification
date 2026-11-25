# P Phi 2 Research Map

- This map covers P Phi 2 in two dimensions only.
- Each piece lists a step, a source, a date, and a status.
- Each date below comes from a source checked by web search.
- The full construction stays open in Lean.
- This map never claims that Lean proves the full construction.

## 1 Free field

- Step: Build the free Gaussian field on two dimensional Euclidean space.
- Source: Edward Nelson wrote Construction of Quantum Fields from Markoff Fields.
- Date: The journal published the paper in 1973.
- Journal: The paper appeared in Journal of Functional Analysis volume 12.
- Pages: Pages 97 to 112 hold the construction.
- Status: The literature proves this step, but Lean does not prove it yet.
- Note: Nelson showed that the free field meets the Markov field test.

## 2 Interaction

- Step: Add a polynomial interaction to the free field with Wick ordering.
- Source: Edward Nelson wrote A Quartic Interaction in Two Dimensions.
- Date: The publisher issued the volume in 1966.
- Book: Mathematical Theory of Elementary Particles holds pages 69 to 73.
- Status: The literature proves stability for the quartic case, but Lean does not prove it yet.

## 3 Cutoff removal

- Step: Remove the volume cutoff and the ultraviolet cutoff from the interacting field.
- Source: James Glimm and Arthur Jaffe wrote A Lambda Phi 4 Quantum Field Theory Without Cutoffs Part 1.
- Date: Physical Review published Part 1 in 1968.
- Note: Parts 2 and 3 appeared in 1970.
- Status: The literature proves cutoff removal for phi 4 in two dimensions, but Lean does not prove it yet.

## 4 OS axioms check

- Step: Check the Osterwalder Schrader axioms for the constructed Schwinger functions.
- Source: Konrad Osterwalder and Robert Schrader wrote Axioms for Euclidean Greens Functions.
- Date: Communications in Mathematical Physics published the paper in 1973.
- Note: Part 2 appeared in 1975 and corrected the first proof.
- Support: Barry Simon summarized the Euclidean P Phi 2 theory in 1974.
- Book: The book is The P Phi 2 Euclidean Quantum Field Theory.
- Status: The literature proves this check, but Lean holds only partial axiom steps.

## 5 Mass gap

- Step: Prove a positive gap above the vacuum in the energy spectrum.
- Source: James Glimm, Arthur Jaffe, and Thomas Spencer wrote the paper.
- Title: The title is The Wightman Axioms and Particle Structure in the P Phi 2 Quantum Field Model.
- Date: Annals of Mathematics published the paper in 1974.
- Note: Volume 100 pages 585 to 632 hold the paper.
- Extension: Francesco Guerra, Lon Rosen, and Barry Simon extended the gap result in 1975.
- Note: The third paper treats strongly coupled theories with a nonzero external field.
- Status: The literature proves a particle structure result with a gap, but Lean proves only a two state toy gap.

## Lean status

- The full construction stays open in Lean.
- Lean holds OS axiom steps in the QFT file.
- Lean holds a two state toy gap in the MassGap file.
- Neither file proves the full P Phi 2 construction.
- A model draft is not proof.
- Lean decides if code checks.

## Verification notes

- No piece in this map has unverified status.
- Each date above matches the source cited with it.
- The mass gap credit rests on Glimm, Jaffe, and Spencer in 1974.
- The mass gap extension rests on Guerra, Rosen, and Simon in 1975.
- The OS credit rests on Osterwalder and Schrader in 1973 and 1975.
