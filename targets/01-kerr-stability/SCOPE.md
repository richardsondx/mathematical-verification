# Kerr stability: what Lean can and cannot check

Scope note, 2026-11-25.
GPT-6.2 Astra was run via OpenRouter as `openai/gpt-6.2-astra`.
Astra confirmed the slowly rotating case, and could NOT verify the
two 2026 full-range preprints from its own knowledge.
I verified those preprints independently at arXiv:
Hintz, arXiv:2606.28253, 26 Jun 2026, v2 3 Aug 2026;
Szeftel, arXiv:2609.40068, 30 Sep 2026, v2 5 Nov 2026.
Both are preprints, not peer-reviewed publications as of 25 Nov 2026.

This file is the Lean part. It does NOT prove Kerr stability.
It proves only the elementary algebra underneath the statement:
subextremality gives a positive discriminant, Delta factors
through (r-M)^2, and Delta vanishes exactly where (r-M)^2
equals that discriminant. The horizon-null claim is then
Delta / Sigma = 0 at a root, given Sigma != 0.
The full nonlinear PDE theorem is not formalised here,
and is not formalised anywhere in Lean as far as Astra
and I can establish.
