# Final report v05

- Run: stage2-qft-fix-2026-11-25-01
- Predicate: pred-qft-fix-v01
- Date: Nov 25, 2026
- Version: v05, fix run, rewrite of v04
- Change from v04: the rewrite fixes 1 readability break and 3 observations.
- Prior run: stage2-qft-entire-2026-11-25-01
- Prior verdict: not done

## Words

- pass: a check meets its bar
- fail: a check does not meet its bar
- done: the checks pass on a committed unit
- gap: work that remains
- check: the act of verification on the real artifact
- CLI: the tool that runs a check
- cost: money the run spent
- Fixed: the run re-checks a done gap in the same run
- Queued: the run records a gap as the next job with its own approval gate
- Accepted: the user explicitly accepted a gap for a recorded reason

## Result

- Result: this fix run closed D1 and D2.
- Result: Lean still passes on the toy model.
- Result: CLAIM.md states only what Lean proved.
- Result: the judge writes the verdict in verdict-fix.md.
- Result: this run proved no mass gap.

## Evidence

- Lean ran QFT_Toy.lean with exit 0 and no output.
- Lean ran QFT_Toy_axiom_check.lean with exit 0.
- Lean ran QFT.lean with exit 0 and no output.
- Grep finds no sorry in either Lean file.
- Axiom check shows no sorryAx in any line.
- Axiom check shows propext on five toy theorems.
- Axiom check shows Quot.sound on one toy theorem.
- Map v02 counts 12 pieces, 12 sources, 12 dates, 12 statuses.
- Section 1 reads early 1950s, first published 1964.
- Section 1 cites Wikipedia Wightman axioms.
- Section 6 credits Feldman and Osterwalder in 1976.
- Section 6 cites Ann. Physics 97, 1976, 80-135.
- Section 6 gives no mass gap credit to Magnen and Seneor.
- Section 6 lists 2 source lines for the credit.
- One 1956 remains in the map, in section 3.
- Section 3 dates the free field, not the axioms.
- Wikipedia confirms the early 1950s date.
- md5 c2891115d7a56220e61702cfc0019950 matches both QFT_Toy.lean copies.
- Kit check ran doctor with a pass.
- Kit check ran drive with a pass.
- The verifier checked F1, F2, F3, F4, F6, and F8.
- The verifier found 1 readability break in v04.
- The verifier report sits in verification-fix-report.md.

## Units

- Unit F1: map fix, done, my checks show F1 and F2 pass.
- Unit F1 output: ENTIRE-MAP-v02.md.
- Unit F2: report rewrite, done, the judge checks F4.
- Unit F2 output: final-report-v05.md.
- Unit F3: claim sheet, done, my checks show F6 passes.
- Unit F3 output: CLAIM.md.
- Unit F4: judge verdict, pending, verdict-fix.md holds the verdict.
- Unit F4 output: verdict-fix.md.
- Unit F5: push, pending, the push waits for judge DONE.
- Unit F5 output: remote commit on mathematical-verification.

## Kit

- Kit: QFT rigorous construction kit, draft, reused.
- Kit path: workspace/handover-qft-entire-2026-11-25/kit/
- Kit proof: U2 Lean check plus U1 map verification.
- Kit budget: 0.50 dollars, inside the 2 dollar cap.
- Kit check: doctor and drive pass.
- Kit status: draft, not proven.

## Gaps

- Gap D1: closed, the map reads early 1950s.
- Gap D2: closed, the map credits Feldman and Osterwalder.
- Gap 1: full 4d interacting construction, open.
- Gap 2: mass gap, open.
- Gap 3: continuum limit uniqueness, open.
- Gap 4: analytic continuation in the interacting 4d case, open.
- Gap 5: uniform spectral gap, open.
- Gap 6: Lean formalization of P(phi)2, open.
- Gap P7: the prior judge ruled the cap unproven at verdict time.
- A worst case bound now caps the Astra call at 0.101 dollars.
- This fix run used zero Astra calls.
- The bound is new evidence for the re-judge.

## Cost and envelope

- Cost cap: 2.00 dollars, hard.
- This fix run holds 0.30 dollars in reserve for verification.
- This fix run spent 0 Astra calls.
- This fix run spent 0 dollars.
- Known priced spend: 0.00 dollars.
- Push cost: 0 dollars.
- Envelope: local files plus one listed push only.
- Envelope: no deploy, no send, no pay, no delete.
- Timebox: 120 minutes.
- Time used: about 15 minutes of unit work.

## Next step

- Next step: the judge rules on the fixes and the cost bound.
- Next step: the push lands after judge DONE.
- Next step: Richardson posts the short claim from CLAIM.md.
- Next step: the mass gap stays its own named run.
