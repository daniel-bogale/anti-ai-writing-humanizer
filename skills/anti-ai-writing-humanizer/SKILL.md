---
name: anti-ai-writing-humanizer
description: Humanizer that writes prose (or rewrites it) so it doesn't read as AI — using an editable house-rules file plus a deep detection engine. Use whenever the user wants to de-AI any writing — a chat message, DM, email, Slack reply, social caption, or a full blog post, article, newsletter, essay, or landing-page copy. Triggers on "anti-ai", "humanize this", "make this sound human", "rewrite so it doesn't sound like ChatGPT", "less AI / less ChatGPT-y", "de-AI this", "remove AI-isms", "audit this for AI tells", "do an AI-detection sweep", "why does this read like AI", or a request to WRITE something that should sound human. Picks depth automatically — a fast pass for short text, a deep multi-pass audit for long-form. Prose only — never run on code, code comments, or technical config.
---

# anti-ai-writing-humanizer

Write prose a human can deliver as their own, or rewrite existing prose so it stops reading as AI.
Same rules either way — the only thing that changes is how deep to go.

## Pick the depth (the rules are the same; the thoroughness isn't)

| Depth | When | What changes |
|---|---|---|
| **light** | Short text (a DM, email, caption, a paragraph), or the user says "quick / light" | One fast surgical sweep using the house rules + the core rules in `references/write-human.md`. Don't load the engine. |
| **heavy** | Long-form (article, blog post, newsletter, essay), or the user says "deep / thorough / remove AI-isms properly / full audit" | Load `references/avoid-ai-writing.md` too. Run its full detection (severity tiers, context + voice profiles, the long tail of edge-case patterns), then iterate to convergence. |

Default to **light** for a short snippet, **heavy** for a whole document or an explicit deep
request. If genuinely unsure, ask once: "quick pass or deep audit?"

This is for **prose** — emails, posts, docs, drafts, chat replies. Never run it on code, code
comments, or technical config.

## Sources of truth (and who wins)

1. **House rules (always win):** `references/house-rules.md` — the editable list of banned
   vocabulary, banned structures, the ≤1 em-dash rule, sentence-case and contraction defaults.
   Read it every pass. It's the single source of truth; on any conflict with the engine, the house
   file decides. **This is the one file you customize to your own taste.**
2. **The prescriptive ruleset:** `references/write-human.md` — the core "write this way, not that
   way" rules, synthesized from the house rules, the Wikipedia "Signs of AI writing" catalog, and
   the engine. The main guide for both depths and for writing from scratch.
3. **The deep engine (heavy only):** `references/avoid-ai-writing.md` — the conorbronsdon
   `avoid-ai-writing` engine (v3.9.0, MIT). ~50 pattern categories, tiered vocab tables, P0/P1/P2
   severity, context/voice profiles, stylometric rhythm tests. The detection superset for audits.

## When writing from scratch

Apply the rules *as you write* rather than fixing afterward — clean-first keeps the voice
consistent (stitched-together rewrites cause the "sudden style shift" tell themselves). Lead with
the specific fact or ask, use plain words, vary sentence length, and where you lack a specific (a
number, name, date) leave a clearly marked blank for the user instead of padding or speculating.

## When rewriting (the pass)

Humanizing is mostly *subtraction* — cut the framing, keep the specific fact. Don't invent "human
texture"; that's its own tell.

1. **Plain words.** Replace inflated vocab (delve, showcase, leverage, foster, garner, crucial,
   tapestry, landscape, pivotal, vibrant, "serves as", "valuable insights"...) with the ordinary
   word, or cut it. Never swap one banned word for another ("leverage" → "harness" is still a tell).
2. **Direct sentences.** Kill "not just X, but Y" parallelism; the "Despite its X… continues to
   thrive" formula; rule-of-three padding; synonym chains (repeat the noun). Use is/are/has.
3. **No AI framing.** Cut significance-claiming, collaborative voice ("Let's explore", "As we can
   see"), knowledge-cutoff disclaimers, and verbalized placeholders.
4. **End at the fact.** Remove "-ing" tack-on clauses and "challenges and future outlook" kickers.
5. **Quiet formatting.** Sentence case headings, bold only for real emphasis, ≤1 em dash,
   contractions in chat, no emoji unless the user used them.
6. **(heavy)** Run the engine across all categories, pick a context/voice profile if the piece has
   one, fix P0+P1 always and P2 when warranted, apply house rules as the overlay, then **re-scan
   and fix again until a pass produces no new edits.**

Surgical only. If a sentence already reads human, leave it. Over-polishing clean prose is its own
tell. Preserve meaning, facts, numbers, names, quotes, and citations exactly.

## Report back

```
Depth: light | heavy   (heavy: profile blog, voice blunt)
- Replaced: leverage→use, delve→look at, "serves as a testament"→shows  (N)
- Cut: 2 rule-of-three, 1 optimism kicker, 1 template outline reshaped
- Rhythm (heavy): 4 short sentences added to break uniform pacing
- Em dashes: 6 → 1
- Passes to convergence (heavy): 2
```

If it's already clean, say "No changes — already reads human." Never invent edits to look busy.

## Updating this skill (one owner per rule — edit in one place)

To avoid the same rule drifting across files, each kind of change has a single home:

| To change... | Edit only | Notes |
|---|---|---|
| Your taste — add/remove a banned word, tweak a style or structure rule | `references/house-rules.md` | Source of truth; **wins on conflict**. Loaded every pass, so the change takes effect everywhere with no other edits. |
| Synthesized framing, or a Wikipedia/engine-derived rule not in the house rules | `references/write-human.md` | The prescriptive guide. Its vocab table mirrors the house rules — don't add words there. |
| The deep pattern engine | nothing by hand — re-vendor from upstream | `references/avoid-ai-writing.md` is vendored; hand-edits get wiped on refresh. |

## Credits

Built from the Wikipedia "Signs of AI writing" catalog and Conor Bronsdon's `avoid-ai-writing`
engine (MIT, vendored at `references/avoid-ai-writing.md`), synthesized into `references/write-human.md`.
See `README.md` and `NOTICE` for full attribution.
