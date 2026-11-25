/-
  MassGap.lean
  Run: stage2-massgap-2026-11-25-01
  Date: Nov 25, 2026
  Lean: 4.23.0, core Lean only, no Mathlib, no placeholder proofs.

  What this file does:
  - It defines a spectral gap in plain Lean terms.
  - It proves a gap in a finite two-state toy model.
  - It proves the vacuum is unique in that toy model.
  - It proves no state sits between zero and the gap.

  What this file does NOT do:
  - It does not prove the Yang-Mills mass gap.
  - It does not build a 4d interacting theory.
  - It does not claim a Clay prize proof.
  - Energies here are whole numbers, not real energies.
-/

namespace MassGap

/-- A spectral gap for an energy function `E`.
    `d` is the gap size. Every energy is zero or at least `d`. -/
def HasGap {S : Type} (E : S → Nat) (d : Nat) : Prop :=
  0 < d ∧ ∀ s, E s = 0 ∨ d ≤ E s

/-- The Clay mass gap statement, as a definition only.
    For a general energy function, some positive gap exists.
    This file proves it only for the toy model below, never for Yang-Mills. -/
def ClayGapStatement {S : Type} (E : S → Nat) : Prop :=
  ∃ d, HasGap E d

/-- Toy energies: two states, vacuum at 0, one excited state at `m`. -/
def energy (m : Nat) : Bool → Nat
  | false => 0
  | true => m

/-- The toy model has a gap of `m`. -/
theorem gapHolds (m : Nat) (hm : 0 < m) :
    HasGap (energy m) m := by
  refine ⟨hm, ?_⟩
  intro s
  cases s with
  | false => exact Or.inl rfl
  | true => exact Or.inr (Nat.le_refl m)

/-- The toy model satisfies the Clay gap statement. -/
theorem toySatisfiesClayStatement (m : Nat) (hm : 0 < m) :
    ClayGapStatement (energy m) :=
  ⟨m, gapHolds m hm⟩

/-- Only the vacuum state has energy zero in the toy model. -/
theorem uniqueVacuum (m : Nat) (hm : 0 < m) (s : Bool) :
    energy m s = 0 ↔ s = false := by
  cases s <;> simp [energy, Nat.ne_of_gt hm]

/-- No state sits strictly between 0 and the gap. -/
theorem noMiddle {S : Type} {E : S → Nat} {d : Nat}
    (hg : HasGap E d) (s : S) :
    ¬ (0 < E s ∧ E s < d) := by
  intro h
  cases hg.2 s with
  | inl hz => exact (Nat.ne_of_gt h.1) hz
  | inr hd => exact (Nat.not_lt_of_ge hd) h.2

/-- The gap isolates the vacuum: any state below the gap is the vacuum. -/
theorem gapIsolatesVacuum (m : Nat) (s : Bool)
    (h : energy m s < m) :
    s = false := by
  cases s with
  | false => rfl
  | true =>
    exact absurd h (Nat.lt_irrefl m)

end MassGap

#print axioms MassGap.gapHolds
#print axioms MassGap.toySatisfiesClayStatement
#print axioms MassGap.uniqueVacuum
#print axioms MassGap.noMiddle
#print axioms MassGap.gapIsolatesVacuum
