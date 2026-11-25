# Mathematical verification

Lean 4 checks of hard math and physics claims, with GPT-6.2 Astra as the research partner.

We do not claim a proof until Lean checks it. A preprint is a preprint. A peer reviewed paper is a peer reviewed paper. An axiom is an axiom.

Each target lives in its own folder at the root of this repo, for example `01-kerr-stability`, not under a `targets/` folder.

## Method

- Research model: GPT-6.2 Astra, via OpenRouter as `openai/gpt-6.2-astra`
- Proof checker: Lean 4.23.0, with Mathlib where Real arithmetic is needed
- Rule: no `sorry` in a file we call verified
- Rule: every file says what it proves and what it assumes
- Rule: a claim about a 2026 preprint says preprint, with its arXiv number and date

## What is proved, and what is not

| Target | Proved in this repo | Date proved | Not proved |
| --- | --- | --- | --- |
| 01 Kerr stability | Elementary Delta algebra, 8 theorems | 25 Nov 2026 | Full nonlinear stability |
| 02 Einstein-Vlasov | Finite particle toy, total count conserved | 25 Nov 2026 | Whole question |
| 03 Penrose inequality | Nothing yet | - | Whole question |
| 04 Cosmic censorship | Nothing yet | - | Whole question |
| 05 Yang-Mills mass gap | QFT axioms step, toy reconstruction, toy gap | 25 Nov 2026 | 4d existence, real mass gap |
| 06 Cosmological stability | Nothing yet | - | Whole question |
| 07 Relativistic fluids | Nothing yet | - | Whole question |

## Proved answers

### 01 Kerr stability, elementary algebra only

- Answer: subextremality makes the discriminant positive, so Delta has two distinct real roots, $r_{\pm} = M \pm \sqrt{M^2-a^2}$, with $0 < r_+$, Sigma is positive at $r_+$, and Delta over Sigma is 0 at $r_+$.
- Original source: Roy Kerr, Gravitational field of a spinning mass as an example of algebraically special metrics, Physical Review Letters 11, 1963, 237-238.
- Stability source, not proved here: Klainerman, Szeftel, Giorgi, and Shen, slowly rotating Kerr, 2021 to 2022. Full range claims are preprints only, Hintz arXiv:2606.28253 and Szeftel arXiv:2609.40068, both 2026.
- Proof: [01-kerr-stability/KerrStability.lean](01-kerr-stability/KerrStability.lean), 8 theorems, Lean 4.23.0, Mathlib v4.23.0, no `sorry`, axioms only `propext`, `Classical.choice`, `Quot.sound`. Proved 25 Nov 2026. Run log: [01-kerr-stability/RUN-LOG.md](01-kerr-stability/RUN-LOG.md).

### 05 Yang-Mills mass gap, axioms and toys only

- Answer: reflection positivity gives a nonneg pairing, the reflected pairing descends to the quotient by its null space, that quotient carries a true inner product, and clustering plus invariance forces an invariant vector to be a multiple of the vacuum.
- Original sources: Wightman axioms, early 1950s, first published 1964; Osterwalder and Schrader, axioms for Euclidean Green functions, 1973 and 1975.
- Proof: [05-yang-mills-mass-gap/QFT.lean](05-yang-mills-mass-gap/QFT.lean), Lean 4.23.0, core only, no `sorry`. Proved 25 Nov 2026.
- Toy answer: a one-site Nat model meets the OS axioms and checks the reconstruction step on that one example only.
- Proof: [05-yang-mills-mass-gap/QFT_Toy.lean](05-yang-mills-mass-gap/QFT_Toy.lean), Lean 4.23.0, no `sorry`.
- Toy gap answer: a two-state model with energies 0 and m has a gap of m, only the vacuum has energy zero, and no toy state sits between 0 and m.
- Original source for the real question: Jaffe and Witten, Quantum Yang-Mills theory, Clay Mathematics Institute millennium problem, 2000.
- Nearest proved model, not the 4d case: Feldman and Osterwalder, phi4_3 mass gap, Annals of Physics 97, 1976, 80-135.
- Proof: [05-yang-mills-mass-gap/MassGap.lean](05-yang-mills-mass-gap/MassGap.lean), Lean 4.23.0, no `sorry`.
- Claim sheet: [05-yang-mills-mass-gap/CLAIM.md](05-yang-mills-mass-gap/CLAIM.md). The 4d Yang-Mills mass gap stays open.

## Shortlist

- 01 Kerr stability: elementary algebra proved, full stability in progress, see `01-kerr-stability`
- 02 Einstein-Vlasov: finite particle toy proved, full question open, see `02-einstein-vlasov`
- 03 Penrose inequality: not started, see `03-penrose-inequality`
- 04 Cosmic censorship: not started, see `04-cosmic-censorship`
- 05 Yang-Mills mass gap: axioms and toys proved, real gap open, see `05-yang-mills-mass-gap`
- 06 Cosmological stability: not started, see `06-cosmological-stability`
- 07 Relativistic fluid regularity: not started, see `07-relativistic-fluid-regularity`

## How to check a target

- Read its README first, it states the exact claim and the status
- Run `lean <file>.lean` in its folder, expect exit 0 and no errors
- Run the axiom check file where one is given, expect no `sorryAx`
- Mathlib targets need a Lake project, see that target's README

## What counts as done

- The exact statement is written in Lean
- Lean accepts it with no `sorry`
- The status line in the target README says proved, with the date and the Lean version
- Anything less is labelled in progress, partial, or axioms only

## How to cite

Please cite this repository and the original sources you use. Credit the scholars listed in each target folder for their work.

```bibtex
@misc{dackam_mathematical_verification,
  author       = {Dackam, Richardson},
  title        = {Mathematical verification: Lean 4 checks of hard math and physics claims},
  howpublished = {GitHub repository},
  note         = {Add the date you accessed it}
}
```

## Author

Richardson Dackam is an independent researcher in Toronto, Canada.

- LinkedIn: https://linkedin.com/in/richardsondx
- X: https://x.com/RichardsonDx

## License

MIT, see `LICENSE`.
