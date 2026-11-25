# Mathematical verification

Lean 4 checks of hard math and physics claims, with GPT-6.2 Astra as the research partner.

We do not claim a proof until Lean checks it. A preprint is a preprint. A peer reviewed paper is a peer reviewed paper. An axiom is an axiom.

## Method

- Research model: GPT-6.2 Astra, via OpenRouter as `openai/gpt-6.2-astra`
- Proof checker: Lean 4.23.0, with Mathlib where Real arithmetic is needed
- Rule: no `sorry` in a file we call verified
- Rule: every file says what it proves and what it assumes
- Rule: a claim about a 2026 preprint says preprint, with its arXiv number and date

## Shortlist

- 01 Kerr stability: in progress, see `targets/01-kerr-stability`
- 02 Einstein-Vlasov: not started
- 03 Penrose inequality: not started
- 04 Cosmic censorship: not started
- 05 Yang-Mills mass gap: axioms only so far, see `targets/05-yang-mills-mass-gap`
- 06 Cosmological stability: not started
- 07 Relativistic fluid regularity: not started

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

## License

MIT, see `LICENSE`.
