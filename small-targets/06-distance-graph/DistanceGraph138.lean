/-
The set {1, 3, 8, 10} in ZMod 11 is independent for differences 1, 3, 8,
has 4 elements and density 4/11, and its lift to the integers is independent
for differences 1, 3, 8. This gives a verified lower bound of 4/11 on the
independence ratio of the distance graph on Z with distance set {1, 3, 8}.

Novelty tier: 0, verification only. The pattern and the bound may already
be known. The file proves the finite check in Lean. It proves nothing new
about the graph.

State of the art: Carraher, Galvin, Hartke, Radcliffe, Stolee, Discrete
Mathematics 339 (2016), 3058-3072, On the independence ratio of distance graphs.

Bottleneck gap: the upper bound is not proved here. The exact independence
ratio is not proved here. The discharging argument for the upper bound is a
separate, harder target.

It would be misleading to claim that this file proves the exact independence ratio, the fractional chromatic number, or Carraher conjecture 38.

Lean integrity audit: Lean runs exit 0, no sorry, no admit, and #print axioms
reports only propext, Classical.choice, Quot.sound.

Version note: v02 changes v01 only in the import lines. The full import
Mathlib is not available in this project cache, so v02 imports the named
cached modules only. The statements and proofs are unchanged.
-/
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Data.Rat.Cast.Order
import Mathlib.Data.Int.Cast.Lemmas
import Mathlib.Tactic.NormNum

def pattern : Finset (ZMod 11) := {1, 3, 8, 10}

theorem pattern_independent : ∀ a ∈ pattern, ∀ b ∈ pattern, a ≠ b →
    b - a ≠ 1 ∧ b - a ≠ 3 ∧ b - a ≠ 8 := by
  decide

theorem pattern_card : pattern.card = 4 := by
  decide

theorem pattern_density : (pattern.card : ℚ) / 11 = 4 / 11 := by
  rw [pattern_card]
  norm_num

def periodicSet : Set ℤ := {n | (n : ZMod 11) ∈ pattern}

theorem periodicSet_independent : ∀ a ∈ periodicSet, ∀ b ∈ periodicSet,
    (b - a = 1 ∨ b - a = 3 ∨ b - a = 8 ∨
     a - b = 1 ∨ a - b = 3 ∨ a - b = 8) → False := by
  have bad : ∀ x ∈ pattern, ∀ y ∈ pattern,
      (y - x = 1 ∨ y - x = 3 ∨ y - x = 8) → False := by
    intro x hx y hy h
    have hne : x ≠ y := by
      intro e
      rw [e, sub_self] at h
      revert h
      decide
    obtain ⟨h₁, h₃, h₈⟩ := pattern_independent x hx y hy hne
    exact h.elim h₁ (fun t => t.elim h₃ h₈)
  intro a ha b hb h
  have hab := bad (a : ZMod 11) ha (b : ZMod 11) hb
  have hba := bad (b : ZMod 11) hb (a : ZMod 11) ha
  rcases h with h | h | h | h | h | h <;>
    have hc := congrArg (fun n : ℤ => (n : ZMod 11)) h <;>
    simp only [Int.cast_sub, Int.cast_one, Int.cast_ofNat] at hc
  · exact hab (Or.inl hc)
  · exact hab (Or.inr (Or.inl hc))
  · exact hab (Or.inr (Or.inr hc))
  · exact hba (Or.inl hc)
  · exact hba (Or.inr (Or.inl hc))
  · exact hba (Or.inr (Or.inr hc))

#print axioms pattern_independent
#print axioms pattern_card
#print axioms pattern_density
#print axioms periodicSet_independent
