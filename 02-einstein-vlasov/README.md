# 02 Einstein-Vlasov

Status: finite particle toy proved, Nov 25, 2026. Full question open.

## Question

Do solutions of the Einstein-Vlasov system, coupling gravity to a collisionless gas, stay regular and stable for small data, and what is their long time behaviour?

## What is proved here

- A finite particle toy version is proved in Lean.
- Cells are indexed by Fin n.
- The distribution is f : Fin n -> Nat, particle counts per cell.
- One transport step scatters counts along a transport map.
- Lean proves the total particle count is conserved by the step.
- Proof: [EinsteinVlasov.lean](EinsteinVlasov.lean), Lean 4.23.0, core Lean only, no `sorry`.
- Axiom check: [EinsteinVlasov_axiom_check.lean](EinsteinVlasov_axiom_check.lean), no `sorryAx`.
- The theorems depend only on `propext` and `Quot.sound`.
- Map: [EINSTEIN-VLASOV-MAP.md](EINSTEIN-VLASOV-MAP.md).
- Gap report: [EINSTEIN-VLASOV-REPORT.md](EINSTEIN-VLASOV-REPORT.md).

## What is not proved here

- The full Einstein-Vlasov question stays open.
- Global existence for small data is not proved here.
- Stability of Minkowski space is not proved here.
- Long time behaviour of the full system is not proved here.
- The continuum system is a definition only in the Lean file.
- The small data stability claim is a definition only in the Lean file.

## Proved cases in the literature

- Rein and Rendall, 1992, global existence for small data in spherical symmetry.
- Fajman, Joudioux, and Smulevici, 2021, stability of Minkowski for massive Vlasov matter.
- Bigorgne, Fajman, Joudioux, Smulevici, and Thaller, 2021, massless case.
- Taylor, 2024, future stability of expanding FLRW solutions, massless case.
- Full sources, dates, and status are in the map.
