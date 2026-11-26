# Penrose inequality map, v02

Run: stage2-penrose-inequality-2026-11-25-01
Date: Nov 25, 2026
Status: map only, nothing proved in this run.
Kit: Research brief kit, draft, reused.
Version: v02, fix cycle 1.
Version note: v01 Case 6 said proof outline, 2013. v02 corrects it to proved, 2017.

## The question

- Penrose asked in 1973 if the mass of a spacetime bounds the area of its horizons.
- A violation would point to a naked singularity.
- A proof would support cosmic censorship.
- Source: Penrose, 1973, Annals of the New York Academy of Sciences.
- Source: Engelhardt and Horowitz, 2019, arXiv:1903.00555.

## The inequality, Riemannian version

- Take a complete asymptotically flat 3-manifold with nonnegative scalar curvature.
- Take its ADM mass m.
- Take A, the area of the outermost minimal surface.
- The inequality states m >= sqrt(A / 16 pi).
- Nonnegative scalar curvature encodes nonnegative local energy density.
- This version is the time-symmetric case.
- Time-symmetric means the second fundamental form vanishes.
- Equality holds only for the Schwarzschild exterior.
- Source: Huisken and Ilmanen, 2001, J. Differential Geom. 59:353-437.
- Source: Bray, 2001, J. Differential Geom. 59:177-267.

## The inequality, Lorentzian version

- Take asymptotically flat initial data with ADM mass M.
- Take an apparent horizon with area A.
- Take the smallest area needed to enclose that horizon.
- The inequality states M >= sqrt(A / 16 pi).
- The enclosing area matters, not the raw horizon area.
- The raw horizon area gives a false version.
- Source: Ben-Dov, 2004, Phys. Rev. D 70:124031.
- Source: Mars, 2009, Classical Quantum Gravity 26:193001.

## The inequality, charged version

- Take total charge q and area radius r = sqrt(A / 4 pi).
- The inequality states m >= (1/2)(r + q^2 / r).
- Equality holds only for Reissner-Nordstrom data.
- Source: Khuri, Weinstein, and Yamada, 2013, arXiv:1306.0206.

## The inequality, higher dimensions

- Take a complete asymptotically flat n-manifold with nonnegative scalar curvature.
- Take A, the area of the outer-minimizing horizon.
- The inequality states m >= (1/2)(A / w)^((n-2)/(n-1)).
- Here w is the area of the unit (n-1)-sphere.
- Source: Bray and Lee, 2009, Duke Math. J. 148:81.

## Proved cases

- Case 1: Riemannian, 3D, largest connected horizon component.
- Case 1 author: Huisken and Ilmanen.
- Case 1 date: 2001, announced 1997.
- Case 1 method: weak inverse mean curvature flow.
- Case 1 status: proved.
- Case 1 source: J. Differential Geom. 59:353-437.
- Case 2: Riemannian, 3D, total horizon area, any number of components.
- Case 2 author: Bray.
- Case 2 date: 2001.
- Case 2 method: conformal flow of metrics plus positive mass theorem.
- Case 2 status: proved.
- Case 2 source: J. Differential Geom. 59:177-267, arXiv:math/9911173.
- Case 3: Riemannian, dimensions n < 8, total horizon area.
- Case 3 author: Bray and Lee.
- Case 3 date: 2009.
- Case 3 method: Bray conformal flow extended to higher dimensions.
- Case 3 status: proved.
- Case 3 note: spin is assumed for the rigidity proof only, not for the inequality.
- Case 3 source: Duke Math. J. 148:81.
- Case 4: spherical symmetry, no time symmetry assumed.
- Case 4 author: Malec and O Murchadha.
- Case 4 date: 1994.
- Case 4 scope: maximal slices, weak energy condition outside the horizon.
- Case 4 status: proved.
- Case 4 source: Phys. Rev. D 49:6931-6934, arXiv:gr-qc/9401014.
- Case 5: charged Riemannian, connected horizon.
- Case 5 author: Jang, charged change to the flow; Huisken and Ilmanen, weak flow.
- Case 5 date: argument 1979, weak flow 2001.
- Case 5 status: proved.
- Case 5 source: Khuri, Weinstein, and Yamada, 2013, arXiv:1306.0206.
- Case 6: charged Riemannian, multiple black holes, no charged matter outside the horizon.
- Case 6 author: Khuri, Weinstein, and Yamada.
- Case 6 date: 2017.
- Case 6 status: proved.
- Case 6 source: J. Differential Geom. 106:451-498, arXiv:1409.3271.
- Case 6 note: the outline first appeared in 2013, arXiv:1308.3771.
- Case 7: charged Riemannian with charged matter, charge density of fixed sign.
- Case 7 author: McCormick.
- Case 7 date: 2019, revised 2021.
- Case 7 status: proved under the sign condition.
- Case 7 source: arXiv:1907.07967.

## Open cases

- Open 1: full Lorentzian case, general asymptotically flat data.
- Open 1 date: open since Penrose, 1973.
- Open 1 source: Mars, 2009, Classical Quantum Gravity 26:193001.
- Open 1 source: Williams, 2021, arXiv:2111.00106.
- Open 2: Riemannian case in spatial dimension n >= 8.
- Open 2 date: open since Bray and Lee, 2009.
- Open 2 source: Bray and Lee, 2009, Duke Math. J. 148:81.
- Open 3: general asymptotically anti-de Sitter data, even time-symmetric.
- Open 3 date: open, holographic argument only in 2019.
- Open 3 source: Engelhardt and Horowitz, 2019, arXiv:1903.00555.
- Open 4: Penrose inequality with angular momentum in full generality.
- Open 4 date: open.
- Open 4 source: Mars, 2009, Classical Quantum Gravity 26:193001.
- Open 5: charged case with charged matter of changing sign.
- Open 5 date: open, counterexamples exist when the sign changes.
- Open 5 source: McCormick, arXiv:1907.07967.

## Versions that fail

- Fail 1: raw apparent horizon area in the Lorentzian statement.
- Fail 1 author: Ben-Dov.
- Fail 1 date: 2004.
- Fail 1 fact: a spherical data set obeys the energy condition yet breaks the raw-area version.
- Fail 1 fact: the true version uses the enclosing area, and it survives.
- Fail 1 source: Phys. Rev. D 70:124031, arXiv:gr-qc/0408066.
- Fail 2: Gibbons charged conjecture for disconnected horizons.
- Fail 2 author: Gibbons proposed it, Dain, Weinstein, and Yamada broke it.
- Fail 2 date: proposed 1984, broken 2010.
- Fail 2 fact: Brill-Lindquist data breaks the charged version with an additive area sum.
- Fail 2 source: arXiv:1012.4190.
- Fail 3: Majumdar-Papapetrou necks break the charged inequality.
- Fail 3 fact: neck cross-sections violate the charged bound.
- Fail 3 fact: gluing fixes the data set, the inequality stays unproved for disconnected horizons.
- Fail 3 source: Khuri, Weinstein, and Yamada, 2013, arXiv:1306.0206.
- Fail 4: weak energy condition alone, without maximal slicing.
- Fail 4 author: Jaracz.
- Fail 4 date: 2023.
- Fail 4 fact: a spherical data set obeys the weak energy condition yet breaks the usual form.
- Fail 4 fact: this does not contradict Malec and O Murchadha, 1994, which assumes maximal slices.
- Fail 4 source: Classical Quantum Gravity 40:025005.

## Methods that do not work

- Method 1: the Jang equation route to the Lorentzian case.
- Method 1 fact: Malec and O Murchadha showed it fails even in spherical symmetry.
- Method 1 date: 2004.
- Method 1 source: arXiv:gr-qc/0408044.
- Method 2: Bray uniformly area-expanding time-flat flow.
- Method 2 fact: the flow runs as a backwards heat equation.
- Method 2 fact: it has no short-time existence in general.
- Method 2 source: Williams, 2021, arXiv:2111.00106.

## Reviews

- Review 1: Mars, Present status of the Penrose inequality, 2009.
- Review 1 source: Classical Quantum Gravity 26:193001.
- Review 2: Williams, Recent developments in the Penrose conjecture, 2021.
- Review 2 source: arXiv:2111.00106.
- Review 3: Bray and Chrusciel, 2003, cited as the background review.
- Review 3 source: McCormick, arXiv:1907.07967, introduction.

## What this map does not claim

- This map proves nothing.
- This map writes no Lean file.
- This map lists no proof of the full Lorentzian case.
- One Astra call supported this map, file astra-map-01.txt.
- Two Astra claims were checked against sources and corrected in this map.
- Astra said the Dain-Weinstein-Yamada counterexample was uncharged.
- The arXiv abstract says it breaks a charged inequality, arXiv:1012.4190.
- Astra said Bray and Lee need spin for the inequality.
- The paper assumes spin for rigidity only, Duke Math. J. 148:81.
