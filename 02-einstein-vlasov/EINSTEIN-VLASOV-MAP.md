# Einstein-Vlasov map v01

Run: stage2-einstein-vlasov-2026-11-25-01
Date: Nov 25, 2026
Predicate: pred-einstein-vlasov-v01
Status: map only, no proof of the full question

## Words

- pass: a check meets its bar
- fail: a check does not meet its bar
- done: a unit has a commit and its checks pass
- gap: work that remains
- check: the act of verification on the real artifact
- cost: money the run spent

## 1. Question

- Question: do solutions of the Einstein-Vlasov system stay regular and stable for small data?
- Question: what is their long time behaviour?
- Source: live target 02 README, Nov 25, 2026.
- Status: not started in this repo before this run.
- Status: the full question stays open in Lean.

## 2. Einstein equations

- Piece: Einstein equations link spacetime curvature to matter.
- Piece: the metric g has Lorentz signature (-, +, +, +).
- Piece: the equation reads Ric(g) - (1/2) R(g) g = 8 pi T.
- Piece: Ric(g) is the Ricci curvature of g.
- Piece: R(g) is the scalar curvature of g.
- Piece: T is the energy momentum tensor of the matter.
- Source: Andreasson, The Einstein-Vlasov System, Living Reviews in Relativity, 2011.
- Date: 2011, arXiv 1106.1367, DOI 10.12942/lrr-2011-4.
- Status: peer reviewed review, system definition checked.

## 3. Vlasov equation

- Piece: Vlasov matter is a collisionless gas.
- Piece: the gas is described by a distribution function f.
- Piece: f is a nonnegative function on the mass shell.
- Piece: f gives the density of particles at each point and momentum.
- Piece: particles travel on geodesics of the metric g.
- Piece: the Vlasov equation says f stays constant along geodesics.
- Piece: the equation reads Tg(f) = 0, where Tg is the geodesic spray.
- Source: Andreasson, The Einstein-Vlasov System, Living Reviews in Relativity, 2011.
- Date: 2011, arXiv 1106.1367, DOI 10.12942/lrr-2011-4.
- Status: peer reviewed review, system definition checked.

## 4. Coupling

- Piece: the coupling runs through the energy momentum tensor T[f].
- Piece: T[f] comes from f by integration over momentum space.
- Piece: T[f] feeds the Einstein equations as the matter source.
- Piece: the metric g feeds the Vlasov equation through geodesics.
- Piece: Vlasov matter meets the dominant, weak, and strong energy conditions.
- Piece: the gas forms no shocks, unlike a fluid model.
- Source: Andreasson, The Einstein-Vlasov System, Living Reviews in Relativity, 2011.
- Date: 2011, arXiv 1106.1367, DOI 10.12942/lrr-2011-4.
- Status: peer reviewed review, coupling checked.
- Source: Bigorgne, Fajman, Joudioux, Smulevici, Thaller, arXiv 2003.03346, 2020.
- Date: 2020, published 2021, DOI 10.1007/s00205-021-01639-2.
- Status: peer reviewed, coupling description checked.

## 5. Small data

- Piece: small data means initial data close to a known solution.
- Piece: the known solution is Minkowski space with f = 0.
- Piece: Rein and Rendall proved global existence for small data in spherical symmetry.
- Piece: the matter disperses and the spacetime is geodesically complete.
- Source: Rein and Rendall, Communications in Mathematical Physics 150, 1992, 561-583.
- Date: 1992, DOI 10.1007/BF02096962, erratum 1996, volume 176, 475-478.
- Status: peer reviewed, proved case.
- Piece: Fajman, Joudioux, and Smulevici proved stability of Minkowski for massive Vlasov matter.
- Piece: the proof needs no compact support in velocity.
- Source: Fajman, Joudioux, Smulevici, Analysis and PDE 14, 2021, 425-531.
- Date: 2021, DOI 10.2140/apde.2021.14.425.
- Status: peer reviewed, proved case.
- Piece: Bigorgne, Fajman, Joudioux, Smulevici, and Thaller proved the massless case.
- Piece: the proof needs no compact support in space or momentum.
- Source: Bigorgne, Fajman, Joudioux, Smulevici, Thaller, Archive for Rational Mechanics and Analysis, 2021.
- Date: 2021, arXiv 2003.03346, DOI 10.1007/s00205-021-01639-2.
- Status: peer reviewed, proved case.
- Piece: local existence for general data is known, from the review and the lecture notes.
- Source: Rendall, An introduction to the Einstein-Vlasov system, 1996.
- Date: 1996, arXiv gr-qc/9604001, 36 pages.
- Status: lecture notes, local existence stated.
- Piece: global existence for general large data is open.
- Source: Andreasson, The Einstein-Vlasov System, Living Reviews in Relativity, 2011.
- Date: 2011, arXiv 1106.1367.
- Status: peer reviewed review, open case stated.

## 6. Long time behaviour

- Piece: small data in spherical symmetry disperses with algebraic decay in time.
- Piece: the metric and the energy momentum tensor decay at late times.
- Source: Rein and Rendall, Communications in Mathematical Physics 150, 1992, 561-583.
- Date: 1992, DOI 10.1007/BF02096962.
- Status: peer reviewed, proved case.
- Piece: small perturbations of Minkowski settle back to Minkowski at late times.
- Source: Fajman, Joudioux, Smulevici, Analysis and PDE 14, 2021, 425-531.
- Date: 2021, DOI 10.2140/apde.2021.14.425.
- Status: peer reviewed, proved case.
- Piece: expanding FLRW solutions of the massless system are future stable under spherical perturbations.
- Source: Taylor, Journal of Mathematical Physics 65, 2024, 022503.
- Date: 2024.
- Status: peer reviewed, proved case.
- Piece: large data can form singularities and black holes.
- Source: Andreasson, The Einstein-Vlasov System, Living Reviews in Relativity, 2011.
- Date: 2011, arXiv 1106.1367.
- Status: peer reviewed review, open case stated.
- Piece: stability of spherically symmetric static steady states is basically open.
- Piece: numerical work supports stability up to the first binding energy maximum.
- Source: Andreasson, On the existence, structure and stability of static solutions, AIP Conference Proceedings 1578, 2014, 129-139.
- Date: 2014, DOI 10.1063/1.4862458.
- Status: peer reviewed review, open case stated.
- Source: Gunther, Straub, Rein, Astrophysical Journal 918, 2021, 48.
- Date: 2021, DOI 10.3847/1538-4357/ac0eef.
- Status: peer reviewed numerical study, evidence only, not proof.

## 7. What this run does

- This run states the system in Lean as definitions only.
- This run proves a finite particle toy version in Lean.
- This run proves total particle count is conserved by a transport step.
- This run does not prove global existence for small data.
- This run does not prove stability of Minkowski in Lean.
- This run does not prove long time behaviour of the full system.
- The full question stays open.
