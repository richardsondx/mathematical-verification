/-
  EinsteinVlasov.lean
  Run: stage2-einstein-vlasov-2026-11-25-01
  Date: Nov 25, 2026
  Lean: 4.23.0, core Lean only, no Mathlib, no placeholder proofs.

  What this file proves:
  - It proves a finite particle toy version of Vlasov transport.
  - Cells are indexed by Fin n.
  - The distribution is f : Fin n -> Nat, particle counts per cell.
  - One transport step scatters each source count to its destination cell.
  - It proves the total particle count is conserved by the step.
  - It proves the total of a sum of distributions is the sum of the totals.
  - It proves a single deposit carries its full count to the total.

  What this file does NOT prove:
  - It does not prove global existence for small data.
  - It does not prove stability of Minkowski space.
  - It does not prove long time behaviour of the full system.
  - It does not construct geodesics or a momentum integral.
  - It does not show the discrete step approximates Vlasov transport.
  - The continuum system is a definition only, never proved here.
  - The small data stability claim is a definition only, never proved here.

  Deduction handoff:
  - Premise P1 [source: this file, proved]: total of a deposit equals the deposited count.
  - Premise P2 [source: this file, proved]: total of a sum equals the sum of the totals.
  - Premise P3 [source: this file, proved]: scatter of a distribution is a sum of deposits.
  - Premise P4 [assumed]: none, the conservation theorem uses P1, P2, and P3 only.
  - Chain step 1: P3 writes the scattered distribution as a sum of deposits.
  - Chain step 2: P2 splits the total of that sum into a sum of totals.
  - Chain step 3: P1 turns each deposit total into its source count.
  - Chain step 4: the sum of source counts is the total of the source distribution.
  - Rule checked: the transport step moves counts, it never creates or destroys them.
  - Fallacy check 1: no step uses the continuum statement. The continuum statement is a definition only.
  - Fallacy check 2: no step claims finite conservation proves continuum stability.
  - Fallacy check 3: no step needs the transport map to be a bijection. Deposits add, they never overwrite.
  - Conclusion: the finite toy conserves total particle count under one transport step.
  - Limits: the result holds for Fin n cells and Nat counts only. It says nothing about the continuum limit.
-/

import Init

namespace EinsteinVlasov

/-- Abstract continuum interface. Shell g is the mass shell for g. -/
structure Model where
  Metric : Type
  Scalar : Type
  Tensor : Type
  Data : Type
  Shell : Metric → Type
  nonneg : Scalar → Prop
  ric : Metric → Tensor
  scalarCurv : Metric → Scalar
  metricTensor : Metric → Tensor
  sub : Tensor → Tensor → Tensor
  scale : Scalar → Tensor → Tensor
  half : Scalar → Scalar
  eightPi : Scalar
  stress : (g : Metric) → (Shell g → Scalar) → Tensor
  geodesicDerivative : (g : Metric) →
    (Shell g → Scalar) → Shell g → Scalar
  zero : Scalar
  admissibleSmall : Data → Prop
  realizes : Data → (g : Metric) → (Shell g → Scalar) → Prop
  futureComplete : Metric → Prop
  stableAsymptotics : (g : Metric) → (Shell g → Scalar) → Prop

/-- The Einstein-Vlasov system, as a definition only.
    The first conjunct says f is nonnegative.
    The second conjunct is the Einstein equation.
    The third conjunct is the Vlasov equation. -/
def System (M : Model) (g : M.Metric) (f : M.Shell g → M.Scalar) : Prop :=
  (∀ p, M.nonneg (f p)) ∧
  M.sub (M.ric g)
      (M.scale (M.half (M.scalarCurv g)) (M.metricTensor g)) =
    M.scale M.eightPi (M.stress g f) ∧
  (∀ p, M.geodesicDerivative g f p = M.zero)

/-- The small data stability claim, as a definition only.
    This is a statement, never proved in this file.
    It says small data admits a solution of the system
    that is future complete and has stable asymptotics. -/
def SmallDataStability (M : Model) : Prop :=
  ∀ d, M.admissibleSmall d →
    ∃ (g : M.Metric) (f : M.Shell g → M.Scalar),
      M.realizes d g f ∧ System M g f ∧
      M.futureComplete g ∧ M.stableAsymptotics g f

namespace Toy

/-- Total particle count over finitely many cells, by recursion on the cell count. -/
def total : {n : Nat} → (Fin n → Nat) → Nat
  | 0, _ => 0
  | n + 1, f => f 0 + total (fun i : Fin n => f i.succ)

/-- The total of the zero distribution is zero. -/
theorem totalZero (n : Nat) :
    total (fun _ : Fin n => 0) = 0 := by
  induction n with
  | zero => rfl
  | succ n ih => simp [total, ih]

/-- The total of a sum of distributions is the sum of the totals. -/
theorem totalAdd {n : Nat} (f g : Fin n → Nat) :
    total (fun i => f i + g i) = total f + total g := by
  induction n with
  | zero => rfl
  | succ n ih =>
    show (f 0 + g 0) + total (fun i : Fin n => f i.succ + g i.succ) =
      (f 0 + total (fun i : Fin n => f i.succ)) +
      (g 0 + total (fun i : Fin n => g i.succ))
    rw [ih]
    omega

/-- Deposit a count w at cell a, zero elsewhere. -/
def deposit {n : Nat} (a : Fin n) (w : Nat) (j : Fin n) : Nat :=
  if j = a then w else 0

/-- A single deposit carries its full count to the total. -/
theorem totalDeposit {n : Nat} (a : Fin n) (w : Nat) :
    total (deposit a w) = w := by
  induction n with
  | zero => exact Fin.elim0 a
  | succ n ih =>
    rcases Fin.eq_zero_or_eq_succ a with rfl | ⟨b, rfl⟩
    · have h0 : deposit (0 : Fin (n + 1)) w 0 = w := if_pos rfl
      have hz : ∀ i : Fin n, deposit (0 : Fin (n + 1)) w i.succ = 0 := by
        intro i
        unfold deposit
        rw [if_neg]
        exact Fin.succ_ne_zero i
      show deposit (0 : Fin (n + 1)) w 0 +
        total (fun i : Fin n => deposit (0 : Fin (n + 1)) w i.succ) = w
      rw [h0]
      have hfun : (fun i : Fin n => deposit (0 : Fin (n + 1)) w i.succ) =
          fun _ => 0 := funext hz
      rw [hfun, totalZero]
      exact Nat.add_zero w
    · have h0 : deposit b.succ w (0 : Fin (n + 1)) = 0 := by
        unfold deposit
        rw [if_neg]
        exact fun h => Fin.succ_ne_zero b h.symm
      have hstep : (fun i : Fin n => deposit b.succ w i.succ) =
          deposit b w := by
        funext i
        unfold deposit
        by_cases h : i = b
        · subst h
          simp
        · rw [if_neg h, if_neg (fun hcon => h (Fin.succ_inj.mp hcon))]
      show deposit b.succ w 0 +
        total (fun i : Fin n => deposit b.succ w i.succ) = w
      rw [h0, hstep, ih]
      exact Nat.zero_add w

/-- Scatter source counts into destination cells, by recursion on the source count. -/
def scatter {n : Nat} : {m : Nat} →
    (Fin m → Fin n) → (Fin m → Nat) → Fin n → Nat
  | 0, _, _, _ => 0
  | m + 1, s, f, j =>
    deposit (s 0) (f 0) j +
      scatter (fun i : Fin m => s i.succ) (fun i => f i.succ) j

/-- Scattering preserves the total particle count. -/
theorem totalScatter {m n : Nat} (s : Fin m → Fin n)
    (f : Fin m → Nat) : total (scatter s f) = total f := by
  induction m with
  | zero => exact totalZero n
  | succ m ih =>
    show total (fun j => deposit (s 0) (f 0) j +
        scatter (fun i : Fin m => s i.succ) (fun i => f i.succ) j) =
      f 0 + total (fun i : Fin m => f i.succ)
    rw [totalAdd, totalDeposit, ih]

/-- A transport map, with its bijection data recorded. -/
structure Perm (n : Nat) where
  sigma : Fin n → Fin n
  inj : ∀ i j, sigma i = sigma j → i = j
  onto : ∀ j, ∃ i, sigma i = j

/-- One transport step scatters counts along the transport map. -/
def step {n : Nat} (p : Perm n) (f : Fin n → Nat) : Fin n → Nat :=
  scatter p.sigma f

/-- The transport step conserves the total particle count. -/
theorem step_conserves {n : Nat} (p : Perm n) (f : Fin n → Nat) :
    total (step p f) = total f :=
  totalScatter p.sigma f

end Toy

end EinsteinVlasov

#print axioms EinsteinVlasov.Toy.totalZero
#print axioms EinsteinVlasov.Toy.totalAdd
#print axioms EinsteinVlasov.Toy.totalDeposit
#print axioms EinsteinVlasov.Toy.totalScatter
#print axioms EinsteinVlasov.Toy.step_conserves
