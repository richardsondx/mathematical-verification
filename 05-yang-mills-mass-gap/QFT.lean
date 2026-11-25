import Init

namespace SmallQFT

universe u

-- Intended interpretation: real scalars. Only the scalar operations used
-- below are needed. We never infer field or order laws from this record.
structure Scalars (R : Type u) where
  zero : R
  one : R
  add : R → R → R
  mul : R → R → R
  le : R → R → Prop

-- Operations on an intended real vector space. The vector-space laws
-- are part of the ambient interpretation, not conclusions of this file.
structure Vops (R V : Type u) where
  zero : V
  add : V → V → V
  scale : R → V → V

-- Symmetry and left linearity suffice in the real case.
structure Form {R V : Type u} (s : Scalars R) (v : Vops R V) where
  pair : V → V → R
  symm : ∀ x y, pair x y = pair y x
  addL : ∀ x y z, pair (v.add x y) z = s.add (pair x z) (pair y z)
  scaleL : ∀ a x y, pair (v.scale a x) y = s.mul a (pair x y)

structure Inner {R V : Type u} (s : Scalars R) (v : Vops R V)
    extends Form s v where
  nonneg : ∀ x, s.le s.zero (pair x x)
  definite : ∀ x, pair x x = s.zero → x = v.zero

-- An explicit permutation, with no reliance on a permutation library.
structure Perm (n : Nat) where
  f : Fin n → Fin n
  inv : Fin n → Fin n
  leftInv : ∀ i, inv (f i) = i
  rightInv : ∀ i, f (inv i) = i

abbrev Corr (R T : Type u) := (n : Nat) → (Fin n → T) → R

-- Cluster is indexed by the actual correlation family; PairingFormula
-- is indexed by BOTH the family and the proposed reflected pairing.
structure OS {R T P E : Type u} (s : Scalars R) (v : Vops R P)
    (act : E → T → T) (Cluster Regular : Corr R T → Prop)
    (PairingFormula : Corr R T → (P → P → R) → Prop) where
  S : Corr R T
  euclidean : ∀ (g : E) n (t : Fin n → T),
    S n (fun i => act g (t i)) = S n t
  symmetric : ∀ n (p : Perm n) (t : Fin n → T),
    S n (fun i => t (p.f i)) = S n t
  clustering : Cluster S
  regularity : Regular S
  B : Form s v
  reflected : PairingFormula S B.pair
  reflectionPositive : ∀ x, s.le s.zero (B.pair x x)

section OSResults

variable {R T P E : Type u} {s : Scalars R} {v : Vops R P}
variable {act : E → T → T} {C A : Corr R T → Prop}
variable {F : Corr R T → (P → P → R) → Prop}
variable (d : OS s v act C A F)

-- x is a whole test vector, not a single insertion. Thus this is
-- positivity on arbitrary test superpositions in the intended model.
theorem normSq_nonneg (x : P) : s.le s.zero (d.B.pair x x) :=
  d.reflectionPositive x

theorem schwinger_perm (n : Nat) (p : Perm n) (t : Fin n → T) :
    d.S n (fun i => t (p.f i)) = d.S n t :=
  d.symmetric n p t

end OSResults

-- Presentation of a quotient as a vector space Q, with chosen lifts.
-- The class criterion identifies points iff their pairing rows agree.
-- nullRow is the usual null-vector consequence of Cauchy-Schwarz;
-- we request it explicitly instead of assuming an ordered-field library.
structure Presentation {R P Q : Type u} {s : Scalars R}
    {v : Vops R P} (b : Form s v) (w : Vops R Q) where
  cls : P → Q
  lift : Q → P
  onto : ∀ q, cls (lift q) = q
  classIff : ∀ x y, cls x = cls y ↔ ∀ z, b.pair x z = b.pair y z
  mapZero : cls v.zero = w.zero
  mapAdd : ∀ x y, cls (v.add x y) = w.add (cls x) (cls y)
  mapScale : ∀ a x, cls (v.scale a x) = w.scale a (cls x)
  nullRow : ∀ x, b.pair x x = s.zero →
    ∀ z, b.pair x z = b.pair v.zero z

section Descent

variable {R P Q : Type u} {s : Scalars R} {v : Vops R P}
variable {w : Vops R Q} {b : Form s v} (k : Presentation b w)

def descended (x y : Q) : R := b.pair (k.lift x) (k.lift y)

-- The computed value agrees with evaluation on ANY representatives.
theorem onClasses (x y : P) :
    descended k (k.cls x) (k.cls y) = b.pair x y := by
  have row (z : P) := (k.classIff _ _).mp (k.onto (k.cls z))
  change b.pair (k.lift (k.cls x)) (k.lift (k.cls y)) = _
  calc
    _ = b.pair x (k.lift (k.cls y)) := row x _
    _ = b.pair (k.lift (k.cls y)) x := b.symm _ _
    _ = b.pair y x := row y _
    _ = b.pair x y := b.symm _ _

def quotientInner (positive : ∀ x, s.le s.zero (b.pair x x)) :
    Inner s w where
  pair := descended k
  symm := fun x y => b.symm (k.lift x) (k.lift y)
  addL := by
    intro x y z
    have h := onClasses k (v.add (k.lift x) (k.lift y)) (k.lift z)
    rw [k.mapAdd, k.onto, k.onto, k.onto, b.addL] at h
    exact h
  scaleL := by
    intro a x y
    have h := onClasses k (v.scale a (k.lift x)) (k.lift y)
    rw [k.mapScale, k.onto, k.onto, b.scaleL] at h
    exact h
  nonneg := fun x => positive (k.lift x)
  definite := by
    intro x hx
    have e := (k.classIff (k.lift x) v.zero).mpr (k.nullRow _ hx)
    rw [k.onto, k.mapZero] at e
    exact e

end Descent

def osPreHilbert {R T P E Q : Type u} {s : Scalars R}
    {v : Vops R P} {w : Vops R Q} {act : E → T → T}
    {C A : Corr R T → Prop} {F : Corr R T → (P → P → R) → Prop}
    (d : OS s v act C A F) (k : Presentation d.B w) : Inner s w :=
  quotientInner k d.reflectionPositive

-- Bosonic, common-invariant-domain schematic Wightman interface.
-- H is the inner-product carrier; D is the field domain. The meaning
-- of spectral support, completeness, cyclicity, etc. is supplied by
-- the interpretation. G indexes spacetime symmetries.
structure Wightman {R H D T G : Type u} (s : Scalars R) (v : Vops R H)
    (Complete : Inner s v → Prop)
    (Spectrum : (G → H → H) → Prop)
    (FieldLaw : (T → D → D) → Prop)
    (Cyclic : (D → H) → D → (T → D → D) → Prop)
    (spaceLike : T → T → Prop) (act : G → T → T) where
  ip : Inner s v
  complete : Complete ip
  embed : D → H
  vacuum : D
  normalized : ip.pair (embed vacuum) (embed vacuum) = s.one
  U : G → H → H
  domainU : G → D → D
  compatible : ∀ g x, embed (domainU g x) = U g (embed x)
  isometry : ∀ g x y, ip.pair (U g x) (U g y) = ip.pair x y
  invariant : ∀ g, U g (embed vacuum) = embed vacuum
  spectrumCondition : Spectrum U
  field : T → D → D
  fieldLaw : FieldLaw field
  covariance : ∀ g t x,
    domainU g (field t x) = field (act g t) (domainU g x)
  locality : ∀ t u, spaceLike t u → ∀ x, field t (field u x) = field u (field t x)
  cyclic : Cyclic embed vacuum field

-- Weak clustering along a chosen sequence of translations.
-- Limit f a is meant to mean f tends to a. No topology is constructed.
structure VacuumCluster {R H : Type u} {s : Scalars R} {v : Vops R H}
    (ip : Inner s v) (omega : H) (shift : Nat → H → H)
    (Limit : (Nat → R) → R → Prop) where
  fixed : ∀ n, shift n omega = omega
  constLimit : ∀ a, Limit (fun _ => a) a
  uniqueLimit : ∀ f a b, Limit f a → Limit f b → a = b
  cluster : ∀ x y, Limit (fun n => ip.pair (shift n x) y)
    (s.mul (ip.pair x omega) (ip.pair omega y))
  -- Standard inner-product separation, explicit since we did not
  -- axiomatize subtraction and the real vector-space laws.
  separate : ∀ x y, (∀ z, ip.pair x z = ip.pair y z) → x = y

theorem invariant_is_vacuum_multiple {R H : Type u}
    {s : Scalars R} {v : Vops R H} {ip : Inner s v}
    {omega : H} {shift : Nat → H → H} {Limit : (Nat → R) → R → Prop}
    (c : VacuumCluster ip omega shift Limit) (x : H)
    (hx : ∀ n, shift n x = x) :
    x = v.scale (ip.pair x omega) omega := by
  apply c.separate
  intro y
  rw [ip.scaleL]
  have h := c.cluster x y
  simp only [hx] at h
  exact c.uniqueLimit _ _ _ (c.constLimit _) h

end SmallQFT
