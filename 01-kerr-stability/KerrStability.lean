/-
Copy of `KerrMathlib/Basic.lean` from the Lake Mathlib project at
`~/workspace/kerr-stability-lean/kerr-mathlib/`.

REQUIRES MATHLIB. This file does not check standalone with bare `lean`:
it imports `Mathlib.Data.Real.Sqrt`,
`Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic`,
`Mathlib.Tactic.Ring`, and `Mathlib.Tactic.Linarith`.
Check it inside the project with:
  cd ~/workspace/kerr-stability-lean/kerr-mathlib
  lake env lean KerrMathlib/Basic.lean
  lake build

Verified 2026-11-25: `lake env lean` exit 0 with no output, `lake build`
exit 0, no `sorry`, no `sorryAx` (axioms: propext, Classical.choice,
Quot.sound only). See `kerr-mathlib/RUN-LOG.md`.

This file proves only elementary Kerr algebra (Delta factorisation,
positive discriminant under subextremality, the two horizon roots,
Sigma positivity, Delta / Sigma = 0 at the outer horizon).
It does NOT prove Kerr stability.
-/

import Mathlib.Data.Real.Sqrt
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith

/-!
# Elementary Kerr algebra

This file proves only the elementary real algebra underneath the
Kerr black-hole stability statement. It does NOT prove Kerr stability.

* `Kerr.Delta M a r = r^2 - 2*M*r + a^2` is the function whose zeros
  locate the horizons in Boyer-Lindquist coordinates.
* `Kerr.Sigma a r θ = r^2 + a^2 * (cos θ)^2` is the denominator that
  appears in `g⁻¹(dr, dr) = Delta / Sigma`.
* Subextremality, `|a| < M` with `0 < M`, makes the discriminant
  `M^2 - a^2` positive, so `Delta` has two distinct real roots
  `r± = M ± sqrt (M^2 - a^2)`, with `0 < r+`, and `Delta / Sigma = 0`
  at `r+`.

What is NOT proved here: the nonlinear stability of Kerr, linear
(mode) stability, Teukolsky estimates, decay of waves, or anything
about the Einstein equations. Those are research-scale PDE theorems
with no complete Lean formalisation.
-/

namespace Kerr

/-- The Kerr `Δ` function in Boyer-Lindquist coordinates. -/
noncomputable def Delta (M a r : ℝ) : ℝ := r ^ 2 - 2 * M * r + a ^ 2

/-- The Kerr `Σ` function in Boyer-Lindquist coordinates. -/
noncomputable def Sigma (a r θ : ℝ) : ℝ := r ^ 2 + a ^ 2 * (Real.cos θ) ^ 2

/-- `Δ` factors through `(r - M)^2` and the discriminant `M^2 - a^2`. -/
theorem delta_factor (M a r : ℝ) :
    Delta M a r = (r - M) ^ 2 - (M ^ 2 - a ^ 2) := by
  unfold Delta
  ring

/-- Subextremality makes the discriminant positive. -/
theorem discriminant_pos {M a : ℝ} (_hM : 0 < M) (ha : |a| < M) :
    0 < M ^ 2 - a ^ 2 := by
  have h1 : -M < a := (abs_lt.mp ha).1
  have h2 : a < M := (abs_lt.mp ha).2
  have h3 : 0 < M - a := sub_pos.mpr h2
  have h4 : 0 < M + a := by linarith
  have h5 : 0 < (M - a) * (M + a) := mul_pos h3 h4
  have h6 : (M - a) * (M + a) = M ^ 2 - a ^ 2 := by ring
  rw [← h6]
  exact h5

/-- The outer root `r+ = M + √(M^2 - a^2)` is a zero of `Δ`. -/
theorem delta_at_add_sqrt {M a : ℝ} (hM : 0 < M) (ha : |a| < M) :
    Delta M a (M + Real.sqrt (M ^ 2 - a ^ 2)) = 0 := by
  rw [delta_factor]
  have hd : 0 ≤ M ^ 2 - a ^ 2 := le_of_lt (discriminant_pos hM ha)
  have hsq : (Real.sqrt (M ^ 2 - a ^ 2)) ^ 2 = M ^ 2 - a ^ 2 := Real.sq_sqrt hd
  have h1 : (M + Real.sqrt (M ^ 2 - a ^ 2) - M) ^ 2 = M ^ 2 - a ^ 2 := by
    rw [show M + Real.sqrt (M ^ 2 - a ^ 2) - M = Real.sqrt (M ^ 2 - a ^ 2) by ring]
    exact hsq
  rw [h1, sub_self]

/-- The inner root `r- = M - √(M^2 - a^2)` is a zero of `Δ`. -/
theorem delta_at_sub_sqrt {M a : ℝ} (hM : 0 < M) (ha : |a| < M) :
    Delta M a (M - Real.sqrt (M ^ 2 - a ^ 2)) = 0 := by
  rw [delta_factor]
  have hd : 0 ≤ M ^ 2 - a ^ 2 := le_of_lt (discriminant_pos hM ha)
  have hsq : (Real.sqrt (M ^ 2 - a ^ 2)) ^ 2 = M ^ 2 - a ^ 2 := Real.sq_sqrt hd
  have h1 : (M - Real.sqrt (M ^ 2 - a ^ 2) - M) ^ 2 = M ^ 2 - a ^ 2 := by
    rw [show (M - Real.sqrt (M ^ 2 - a ^ 2) - M) ^ 2
        = (Real.sqrt (M ^ 2 - a ^ 2)) ^ 2 by ring]
    exact hsq
  rw [h1, sub_self]

/-- The two horizon radii, their order, and positivity of the outer one. -/
theorem horizon_roots {M a : ℝ} (hM : 0 < M) (ha : |a| < M) :
    Delta M a (M + Real.sqrt (M ^ 2 - a ^ 2)) = 0 ∧
    Delta M a (M - Real.sqrt (M ^ 2 - a ^ 2)) = 0 ∧
    M - Real.sqrt (M ^ 2 - a ^ 2) < M + Real.sqrt (M ^ 2 - a ^ 2) ∧
    0 < M + Real.sqrt (M ^ 2 - a ^ 2) := by
  have hs : 0 < Real.sqrt (M ^ 2 - a ^ 2) :=
    Real.sqrt_pos.mpr (discriminant_pos hM ha)
  exact ⟨delta_at_add_sqrt hM ha, delta_at_sub_sqrt hM ha, by linarith, by linarith⟩

/-- `Σ` is positive away from `r = 0`. -/
theorem sigma_pos {a r θ : ℝ} (hr : r ≠ 0) : 0 < Sigma a r θ := by
  unfold Sigma
  have h1 : 0 < r ^ 2 := sq_pos_of_ne_zero hr
  have h2 : 0 ≤ a ^ 2 * (Real.cos θ) ^ 2 :=
    mul_nonneg (sq_nonneg a) (sq_nonneg _)
  linarith

/-- `Σ` is positive at the outer horizon radius. -/
theorem sigma_pos_at_horizon {M a θ : ℝ} (hM : 0 < M) (ha : |a| < M) :
    0 < Sigma a (M + Real.sqrt (M ^ 2 - a ^ 2)) θ := by
  apply sigma_pos
  have hs : 0 < Real.sqrt (M ^ 2 - a ^ 2) :=
    Real.sqrt_pos.mpr (discriminant_pos hM ha)
  have hpos : 0 < M + Real.sqrt (M ^ 2 - a ^ 2) := by linarith
  exact ne_of_gt hpos

/-- At the outer horizon, `Δ / Σ = 0`. -/
theorem delta_div_sigma_at_horizon {M a θ : ℝ} (hM : 0 < M) (ha : |a| < M) :
    Delta M a (M + Real.sqrt (M ^ 2 - a ^ 2))
      / Sigma a (M + Real.sqrt (M ^ 2 - a ^ 2)) θ = 0 := by
  rw [delta_at_add_sqrt hM ha]
  exact zero_div _

end Kerr
