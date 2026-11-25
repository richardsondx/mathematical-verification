/-
  PPhi2.lean
  Run: stage2-pphi2-lean-2026-11-25-01
  Date: Nov 25, 2026
  Lean: 4.23.0, core Lean only, no Mathlib, no placeholder proofs.

  What this file proves:
  - It proves a finite two-site lattice version of a P(phi)2 model.
  - Sites are Bool, false and true.
  - Fields are phi : Bool -> Int.
  - The interaction is P(x) = x^4 - x^2 at each site.
  - It proves P(x) >= 0 for every integer x.
  - It proves P(x) = 0 only for x = 0, 1, -1.
  - It proves the total action S(phi) >= 0 for every phi.
  - It proves S(phi) = 0 implies phi = 0, when m > 0.
  - It proves a positive gap: phi /= 0 implies S(phi) >= m^2.
  - This gap is the finite lattice analogue of the MassGap.lean result.

  What this file does NOT prove:
  - It does not prove the full Glimm and Jaffe construction.
  - It does not prove a continuum P(phi)2 theory.
  - It does not prove the Osterwalder-Schrader axioms.
  - It does not prove a 4d mass gap.
  - Fields here are integers on two sites, not continuum fields.

  Deduction handoff:
  - Premise P1 [source: this file, proved]: P(x) = x^4 - x^2 >= 0 for all x : Int.
  - Premise P2 [source: this file, proved]: the gradient term is a square, so it is >= 0.
  - Premise P3 [source: this file, proved]: the mass term is m^2 times a sum of squares, hence nonneg.
  - Premise P4 [source: this file, proved]: lambda >= 0, so lambda times a sum of P values is >= 0.
  - Premise P5 [assumed]: m > 0 and lambda > 0, as Nat hypotheses in the theorems.
  - Assumed premises named again: P5 only. This file proves P1 to P4, it assumes none of them.
  - Chain step 1: P1 gives each interaction value a lower bound of 0.
  - Chain step 2: P2, P3 and P4 give each action term a lower bound of 0.
  - Chain step 3: each term stays at or above 0. So S(phi) >= 0.
  - Chain step 4: if S(phi) = 0, then each nonnegative term is 0, by step 3.
  - Chain step 5: the mass term is 0 and m > 0.
  - Step 5, continued: both site squares are 0, so phi = 0.
  - Chain step 6: if phi /= 0, then some site square is >= 1.
  - Step 6, continued: the mass term is >= m^2.
  - Chain step 7: the other terms are >= 0, so S(phi) >= m^2 for phi /= 0.
  - Rule checked: the interaction term stays bounded below, so the total action stays bounded below.
  - Fallacy check 1: no step uses the continuum statement. The continuum statement is a definition only.
  - Fallacy check 2: no step claims a finite gap proves a continuum gap. The finite gap is an analogue only.
  - Fallacy check 3: no step divides by m or lambda. Only m^2 > 0 carries the positivity of m.
  - Conclusion: the finite two-site model has a nonnegative action, a unique vacuum, and a gap of m^2.
  - Limits: the result holds for two Bool sites and Int fields only. It says nothing about the continuum limit.
-/

import Init

namespace PPhi2

/-- Helper: x ^ 2 = x * x for integers, proved from Int.pow_succ. -/
theorem pow_two_int (x : Int) : x ^ 2 = x * x := by
  rw [show (2 : Nat) = 1 + 1 from rfl, Int.pow_succ,
    show (1 : Nat) = 0 + 1 from rfl, Int.pow_succ, Int.pow_zero, Int.one_mul]

/-- Helper: integer power addition, proved by induction on the second exponent. -/
theorem int_pow_add (x : Int) (m n : Nat) : x ^ (m + n) = x ^ m * x ^ n := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [Nat.add_succ, Int.pow_succ, ih, Int.pow_succ, Int.mul_assoc]

/-- Helper: x ^ 4 = x ^ 2 * x ^ 2. -/
theorem pow_four_int (x : Int) : x ^ 4 = x ^ 2 * x ^ 2 := by
  rw [show (4 : Nat) = 2 + 2 from rfl, int_pow_add]

/-- The polynomial factorisation x ^ 4 - x ^ 2 = x ^ 2 * (x ^ 2 - 1). -/
theorem poly_factored (x : Int) : x ^ 4 - x ^ 2 = x ^ 2 * (x ^ 2 - 1) := by
  rw [Int.mul_sub, Int.mul_one, ← pow_four_int]

/-- A square of an integer is nonnegative. -/
theorem sq_nonneg_int (x : Int) : 0 ≤ x ^ 2 := by
  rw [pow_two_int]
  rcases Int.le_total 0 x with h | h
  · exact Int.mul_nonneg h h
  · exact Int.mul_nonneg_of_nonpos_of_nonpos h h

/-- A square is zero only at zero. -/
theorem sq_eq_zero (x : Int) (h : x ^ 2 = 0) : x = 0 := by
  rw [pow_two_int] at h
  rcases Int.mul_eq_zero.mp h with h3 | h3 <;> exact h3

/-- If 1 <= x then 1 <= x ^ 2. -/
theorem one_le_sq_of_one_le (x : Int) (h : 1 ≤ x) : 1 ≤ x ^ 2 := by
  have h1 : (1 : Int) * 1 ≤ x * x :=
    Int.mul_le_mul h h (by decide) (Int.le_trans (by decide) h)
  have h2 : (1 : Int) * 1 = 1 := rfl
  rw [h2, ← pow_two_int] at h1
  exact h1

/-- If x <= -1 then 1 <= x ^ 2, by passing to -x. -/
theorem one_le_sq_of_le_neg_one (x : Int) (h : x ≤ -1) : 1 ≤ x ^ 2 := by
  have h1 : (1 : Int) ≤ -x := by omega
  have h2 : (1 : Int) ≤ (-x) ^ 2 := one_le_sq_of_one_le (-x) h1
  have h3 : (-x) ^ 2 = x ^ 2 := by
    rw [pow_two_int, pow_two_int]
    exact Int.neg_mul_neg x x
  rw [h3] at h2
  exact h2

/-- A nonzero integer has square at least 1. -/
theorem one_le_sq_of_ne_zero (x : Int) (hx : x ≠ 0) : 1 ≤ x ^ 2 := by
  rcases (by omega : 1 ≤ x ∨ x ≤ -1) with h | h
  · exact one_le_sq_of_one_le x h
  · exact one_le_sq_of_le_neg_one x h

/-- If |x| >= 2 then 4 <= x ^ 2. -/
theorem four_le_sq_of_abs_ge_two (x : Int) (h : 2 ≤ x ∨ x ≤ -2) : 4 ≤ x ^ 2 := by
  rcases h with h | h
  · have h1 : (2 : Int) * 2 ≤ x * x :=
      Int.mul_le_mul h h (by decide) (Int.le_trans (by decide) h)
    have h2 : (2 : Int) * 2 = 4 := rfl
    rw [h2, ← pow_two_int] at h1
    exact h1
  · have h1 : (2 : Int) ≤ -x := by omega
    have h2 : (4 : Int) ≤ (-x) ^ 2 := by
      have hh : (2 : Int) * 2 ≤ (-x) * (-x) :=
        Int.mul_le_mul h1 h1 (by decide) (Int.le_trans (by decide) h1)
      have h3 : (2 : Int) * 2 = 4 := rfl
      rw [h3, ← pow_two_int] at hh
      exact hh
    have h3 : (-x) ^ 2 = x ^ 2 := by
      rw [pow_two_int, pow_two_int]
      exact Int.neg_mul_neg x x
    rw [h3] at h2
    exact h2

/-- The polynomial interaction P(x) = x ^ 4 - x ^ 2, one site at a time. -/
def PPoly (x : Int) : Int := x ^ 4 - x ^ 2

/-- The interaction stays at or above 0 on every integer. -/
theorem poly_nonneg (x : Int) : 0 ≤ PPoly x := by
  by_cases hx : x = 0
  · subst hx
    simp [PPoly]
  · have h1 : 1 ≤ x ^ 2 := one_le_sq_of_ne_zero x hx
    have h2 : 0 ≤ x ^ 2 - 1 := by omega
    have h3 : 0 ≤ x ^ 2 * (x ^ 2 - 1) := Int.mul_nonneg (sq_nonneg_int x) h2
    unfold PPoly
    rw [poly_factored]
    exact h3

/-- The interaction vanishes only at 0, 1 and -1. -/
theorem poly_eq_zero (x : Int) (h : PPoly x = 0) :
    x = 0 ∨ x = 1 ∨ x = -1 := by
  have h2 : x ^ 2 * (x ^ 2 - 1) = 0 := by
    rw [← poly_factored]
    exact h
  rcases Int.mul_eq_zero.mp h2 with h3 | h3
  · exact Or.inl (sq_eq_zero x h3)
  · have hsq : x ^ 2 = 1 := by omega
    by_cases hge : 2 ≤ x
    · have h4 : 4 ≤ x ^ 2 := four_le_sq_of_abs_ge_two x (Or.inl hge)
      omega
    · by_cases hle : x ≤ -2
      · have h4 : 4 ≤ x ^ 2 := four_le_sq_of_abs_ge_two x (Or.inr hle)
        omega
      · have hx0 : x ≠ 0 := by
          intro h0
          subst h0
          simp at hsq
        right
        omega

/-- The total action on two sites.
    Gradient term plus mass term plus lambda times the interaction at both sites. -/
def action (m lam : Nat) (phi : Bool → Int) : Int :=
  (phi true - phi false) ^ 2
    + (m : Int) ^ 2 * (phi false ^ 2 + phi true ^ 2)
    + (lam : Int) * (PPoly (phi false) + PPoly (phi true))

/-- The action of the zero field is zero. -/
theorem zero_field_action (m lam : Nat) :
    action m lam (fun _ => 0) = 0 := by
  simp [action, PPoly]

/-- The action is nonnegative for every field. -/
theorem action_nonneg (m lam : Nat) (phi : Bool → Int) :
    0 ≤ action m lam phi := by
  have hgrad : 0 ≤ (phi true - phi false) ^ 2 := sq_nonneg_int _
  have hmass : 0 ≤ (m : Int) ^ 2 * (phi false ^ 2 + phi true ^ 2) :=
    Int.mul_nonneg (Int.pow_nonneg (Int.natCast_nonneg m))
      (Int.add_nonneg (sq_nonneg_int _) (sq_nonneg_int _))
  have hint : 0 ≤ (lam : Int) * (PPoly (phi false) + PPoly (phi true)) :=
    Int.mul_nonneg (Int.natCast_nonneg lam)
      (Int.add_nonneg (poly_nonneg _) (poly_nonneg _))
  unfold action
  exact Int.add_nonneg (Int.add_nonneg hgrad hmass) hint

/-- The vacuum is unique: action zero forces the field to be zero, when m > 0. -/
theorem vacuum_unique (m lam : Nat) (hm : 0 < m) (phi : Bool → Int)
    (h : action m lam phi = 0) : phi = fun _ => 0 := by
  have hgrad : 0 ≤ (phi true - phi false) ^ 2 := sq_nonneg_int _
  have hmass : 0 ≤ (m : Int) ^ 2 * (phi false ^ 2 + phi true ^ 2) :=
    Int.mul_nonneg (Int.pow_nonneg (Int.natCast_nonneg m))
      (Int.add_nonneg (sq_nonneg_int _) (sq_nonneg_int _))
  have hint : 0 ≤ (lam : Int) * (PPoly (phi false) + PPoly (phi true)) :=
    Int.mul_nonneg (Int.natCast_nonneg lam)
      (Int.add_nonneg (poly_nonneg _) (poly_nonneg _))
  have hsum : (phi true - phi false) ^ 2
      + (m : Int) ^ 2 * (phi false ^ 2 + phi true ^ 2)
      + (lam : Int) * (PPoly (phi false) + PPoly (phi true)) = 0 := h
  have hgrad0 : (phi true - phi false) ^ 2 = 0 := by omega
  have hmass0 : (m : Int) ^ 2 * (phi false ^ 2 + phi true ^ 2) = 0 := by omega
  have hmpos : 0 < (m : Int) ^ 2 :=
    Int.pow_pos (Int.natCast_pos.mpr hm)
  have hsqsum : phi false ^ 2 + phi true ^ 2 = 0 := by
    rcases Int.mul_eq_zero.mp hmass0 with hleft | hright
    · omega
    · exact hright
  have hf0 : phi false ^ 2 = 0 := by
    have h1 : 0 ≤ phi false ^ 2 := sq_nonneg_int _
    have h2 : 0 ≤ phi true ^ 2 := sq_nonneg_int _
    omega
  have ht0 : phi true ^ 2 = 0 := by
    have h1 : 0 ≤ phi false ^ 2 := sq_nonneg_int _
    have h2 : 0 ≤ phi true ^ 2 := sq_nonneg_int _
    omega
  have hfalse : phi false = 0 := sq_eq_zero _ hf0
  have htrue : phi true = 0 := sq_eq_zero _ ht0
  funext b
  cases b with
  | false => exact hfalse
  | true => exact htrue

/-- The finite lattice gap: a nonzero field has action at least m ^ 2. -/
theorem action_gap (m lam : Nat) (hm : 0 < m) (phi : Bool → Int)
    (hne : phi ≠ fun _ => 0) : (m : Int) ^ 2 ≤ action m lam phi := by
  have _ : 0 < (m : Int) := Int.natCast_pos.mpr hm
  have hgrad : 0 ≤ (phi true - phi false) ^ 2 := sq_nonneg_int _
  have hint : 0 ≤ (lam : Int) * (PPoly (phi false) + PPoly (phi true)) :=
    Int.mul_nonneg (Int.natCast_nonneg lam)
      (Int.add_nonneg (poly_nonneg _) (poly_nonneg _))
  have hsite : phi false ≠ 0 ∨ phi true ≠ 0 := by
    by_cases hf : phi false = 0
    · by_cases ht : phi true = 0
      · exfalso
        apply hne
        funext b
        cases b with
        | false => exact hf
        | true => exact ht
      · exact Or.inr ht
    · exact Or.inl hf
  have hsum1 : 1 ≤ phi false ^ 2 + phi true ^ 2 := by
    have h1 : 0 ≤ phi false ^ 2 := sq_nonneg_int _
    have h2 : 0 ≤ phi true ^ 2 := sq_nonneg_int _
    rcases hsite with h | h
    · have h3 : 1 ≤ phi false ^ 2 := one_le_sq_of_ne_zero _ h
      omega
    · have h3 : 1 ≤ phi true ^ 2 := one_le_sq_of_ne_zero _ h
      omega
  have hmassge : (m : Int) ^ 2
      ≤ (m : Int) ^ 2 * (phi false ^ 2 + phi true ^ 2) := by
    have hle : (m : Int) ^ 2 * 1
        ≤ (m : Int) ^ 2 * (phi false ^ 2 + phi true ^ 2) :=
      Int.mul_le_mul_of_nonneg_left hsum1 (sq_nonneg_int (m : Int))
    rw [Int.mul_one] at hle
    exact hle
  have hmass : 0 ≤ (m : Int) ^ 2 * (phi false ^ 2 + phi true ^ 2) :=
    Int.mul_nonneg (Int.pow_nonneg (Int.natCast_nonneg m))
      (Int.add_nonneg (sq_nonneg_int _) (sq_nonneg_int _))
  have hsum : (phi true - phi false) ^ 2
      + (m : Int) ^ 2 * (phi false ^ 2 + phi true ^ 2)
      + (lam : Int) * (PPoly (phi false) + PPoly (phi true))
      = action m lam phi := rfl
  omega

/-- Every field has action zero or action at least m ^ 2. -/
theorem finite_gap (m lam : Nat) (hm : 0 < m) (phi : Bool → Int) :
    action m lam phi = 0 ∨ (m : Int) ^ 2 ≤ action m lam phi := by
  by_cases hphi : phi = fun _ => 0
  · left
    rw [hphi]
    exact zero_field_action m lam
  · right
    exact action_gap m lam hm phi hphi

/-- A spectral gap for the finite lattice action, in the style of MassGap.HasGap. -/
def HasGap (m lam : Nat) (gap : Int) : Prop :=
  0 < gap ∧ ∀ phi : Bool → Int,
    action m lam phi = 0 ∨ gap ≤ action m lam phi

/-- The finite lattice model has gap m ^ 2. -/
theorem finite_has_gap (m lam : Nat) (hm : 0 < m) :
    HasGap m lam ((m : Int) ^ 2) := by
  refine ⟨Int.pow_pos (Int.natCast_pos.mpr hm), ?_⟩
  intro phi
  exact finite_gap m lam hm phi

/-- The main P(phi)2 construction statement, as a definition only.
    This file never proves this statement.
    `Field` is the continuum field type.
    `S` is the continuum action.
    `ContinuumOS` says the Osterwalder-Schrader axioms hold.
    The finite theorems above prove only the two-site Int analogue. -/
def MainConstructionStatement (Field : Type) (S : Field → Int)
    (ContinuumOS : Prop) : Prop :=
  ContinuumOS ∧
  ∃ gap : Int, ∃ vacuum : Field,
    0 < gap ∧ S vacuum = 0 ∧
    (∀ φ, 0 ≤ S φ) ∧
    (∀ φ, S φ = 0 → φ = vacuum) ∧
    (∀ φ, φ ≠ vacuum → gap ≤ S φ)

end PPhi2

#print axioms PPhi2.poly_nonneg
#print axioms PPhi2.poly_eq_zero
#print axioms PPhi2.action_nonneg
#print axioms PPhi2.zero_field_action
#print axioms PPhi2.vacuum_unique
#print axioms PPhi2.action_gap
#print axioms PPhi2.finite_gap
#print axioms PPhi2.finite_has_gap
