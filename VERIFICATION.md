# Verification rules

These rules apply to every target in this repo.

- State the claim in plain words first, then in Lean.
- Name the source for every outside claim, with a date.
- A preprint is not a peer reviewed result, label it as a preprint.
- No `sorry` in a verified file. If a step is assumed, name it as a hypothesis in the Lean code.
- Run `#print axioms` on the main theorems and record the result.
- Record the Lean version and the Mathlib version or commit used.
- If a result is partial, say which part is proved and which part is open.
- Do not use a model output as proof. A model can draft the design and the code, Lean decides if it checks.
