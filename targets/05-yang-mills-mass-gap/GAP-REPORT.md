# Gap report for the rigorous QFT construction program

- Run: stage2-qft-entire-2026-11-25-01
- Predicate: pred-qft-entire-v02
- Date: Nov 25, 2026
- Purpose: This report lists every gap that stays open.
- Purpose: It also runs one falsification test on the full claim.

## Open gaps

### 1. Full 4d interacting construction

- Status: open.
- What would unblock it: Build one interacting 4d theory that meets the Wightman axioms.
- Owner: Richardson.
- Next step: Commission a run that targets the 4d construction alone.

### 2. Mass gap

- Status: open.
- What would unblock it: Prove a positive lower bound on nonzero energies in 4d.
- Owner: Richardson.
- Next step: Keep the mass gap as its own named run.

### 3. Continuum limit uniqueness

- Status: open.
- What would unblock it: Prove one unique infinite volume limit for all subsequences.
- Owner: Richardson.
- Next step: Ask a run to test uniqueness of the lattice scaling limit.

### 4. Analytic continuation from OS data to Wightman data in the interacting 4d case

- Status: open.
- What would unblock it: Prove the continuation from Euclidean data to real time data in 4d.
- Owner: Richardson.
- Next step: Scope a run to the continuation step in the interacting case.

### 5. Uniform spectral gap

- Status: open.
- What would unblock it: Prove gap bounds that hold uniformly as the cutoff goes away.
- Owner: Richardson.
- Next step: Target the uniform gap step from the P(phi)2 overview first.
- Note: The P(phi)2 overview names this step as an open target.

### 6. Lean formalization of P(phi)2

- Status: open.
- What would unblock it: Formalize the full 2d P(phi)2 proof in Lean with no sorry.
- Owner: Richardson.
- Next step: Start a Lean run on the P(phi)2 construction in 2d.

## Falsification test

- Claim: The full construction is done.
- Test that would kill it: Find one named piece of the full program that stays open.
- Evidence: The OpenAI assessment of Nov 10, 2026 claims no mass gap.
- Evidence: The same assessment proves no uniqueness of the infinite volume limit.
- Evidence: The map lists the mass gap and the continuum limit as open.
- Evidence: The map lists the full 4d interacting construction as not proved.
- Verdict: killed.
- Reason: The mass gap stays open, so the full construction is not done.

## What this run proved

- U1 mapped 12 pieces of the program with a source and a date each.
- U1 counted proved 4, partial 4, open 2, axioms only 2.
- U2 built a Nat toy model that checks one reconstruction step only.
- U2 ran Lean with exit 0, no sorry, and no sorryAx.
- U2 showed the toy theorems depend only on propext and Quot.sound.

## What this run did not prove

- It did not prove any interacting 4d theory.
- It did not prove a mass gap.
- It did not prove continuum limit uniqueness.
- It did not prove analytic continuation in the interacting 4d case.
- It did not prove a uniform spectral gap.
- It did not formalize P(phi)2 in Lean.
- The toy model is not a weaker form of the full construction.

## Count check

- Open items listed: 6
- Unblock lines: 6, one per open item.
- Owners named: 6, one per open item.
- Next steps named: 6, one per open item.
