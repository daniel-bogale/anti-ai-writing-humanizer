# anti-ai-writing-humanizer

**Humanize AI-written text.** A portable agent skill that writes prose — or rewrites it — so it
doesn't read as AI. Plain words over inflated ones, specific facts over puffery, uneven human
rhythm over the metronome. Works in Claude Code, Cursor, Codex, and OpenClaw.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-brightgreen.svg?style=flat-square)](CHANGELOG.md)
[![Works with Claude Code](https://img.shields.io/badge/Claude%20Code-skill%20%2B%20plugin-8A2BE2.svg?style=flat-square)](https://docs.anthropic.com/en/docs/claude-code)

---

## What it does

**Before** (15+ AI tells in two sentences):

> In today's rapidly evolving fintech landscape, our platform serves as a testament to seamless
> innovation, leveraging cutting-edge technology to foster vibrant communities. Despite its
> challenges, the product continues to thrive — showcasing not just growth, but also resilience.

**After:**

> Our platform settles P2P trades in under three seconds. We had two outages this quarter and fixed
> both inside an hour. Growth is steady: 4,000 active traders, up from 2,500 in March.

It caught: significance inflation ("serves as a testament"), the abstract "landscape", four word
swaps (leverage, foster, seamless, showcasing), "vibrant", the "Despite its X… continues to thrive"
formula, "not just X, but also Y" parallelism, an em dash, and the vague claims with no numbers — then
replaced the puffery with specifics.

## Why a skill, not a one-shot prompt

"Make this sound human" catches the obvious words. This skill goes further:

- **Two depths, picked automatically.** Short text (a DM, an email) gets one fast surgical pass.
  Long-form (an article, a post) loads a full detection engine and iterates until clean.
- **~50 pattern categories** from a vendored detection engine — not just vocabulary, but structural
  tells (rigid templates, uniform rhythm), AI fingerprints (placeholders, citation-markup leaks, UTM
  params), and stylometric checks.
- **An editable house-rules file that wins on conflict.** Your taste is the source of truth; the
  engine supplies breadth.
- **Writes clean from the start, not just fixes after.** A consistent first draft avoids the
  "sudden style shift" tell that stitched-together rewrites create.

## How it works

Three layers, with a clear precedence so nothing drifts:

1. **`references/house-rules.md`** — your editable banned words, structures, and style defaults. The
   single source of truth; **wins on conflict.** This is the one file you customize.
2. **`references/write-human.md`** — the prescriptive ruleset ("write this way, not that way"),
   synthesized from the house rules, Wikipedia's "Signs of AI writing" catalog, and the engine. Each
   rule is tagged with its source.
3. **`references/avoid-ai-writing.md`** — the deep detection engine (loaded only for the heavy pass).

On the heavy pass the engine detects, the house rules overlay (and win), and the rewrite iterates to
convergence — re-scanning until a pass makes no new edits.

## Install

### Claude Code

**Clone into your skills directory:**

```bash
git clone https://github.com/daniel-bogale/anti-ai-writing-humanizer ~/.claude/skills/anti-ai-writing-humanizer
```

It auto-triggers on phrases like "humanize this", "remove AI-isms", or "rewrite so it doesn't sound
like ChatGPT".

**Or install as a versioned plugin** (also works in Claude Cowork, which only loads skills from
plugins):

```
/plugin marketplace add daniel-bogale/anti-ai-writing-humanizer
/plugin install anti-ai-writing-humanizer@daniel-bogale-skills
```

### Cursor

```bash
mkdir -p .cursor/rules
curl -o .cursor/rules/anti-ai-writing-humanizer.mdc \
  https://raw.githubusercontent.com/daniel-bogale/anti-ai-writing-humanizer/main/cursor-rules/anti-ai-writing-humanizer.mdc
```

See [`cursor-rules/README.md`](cursor-rules/README.md). The Cursor port carries the same core rules
in one self-contained file.

### OpenAI Codex

Codex reads [Agent Skills](https://developers.openai.com/codex/skills) in the same `SKILL.md` format.
Put the repo in `~/.agents/skills/` (all projects) or `.agents/skills/` (one repo):

```bash
git clone https://github.com/daniel-bogale/anti-ai-writing-humanizer ~/.agents/skills/anti-ai-writing-humanizer
```

### OpenClaw

```bash
git clone https://github.com/daniel-bogale/anti-ai-writing-humanizer ~/.openclaw/skills/anti-ai-writing-humanizer
```

## Use it

Just ask, in plain language:

- "humanize this" / "make this sound human"
- "rewrite this so it doesn't read like ChatGPT"
- "audit this draft for AI tells and fix them" (triggers the deep pass)
- "draft a cold email to a fintech CTO — make it sound like a human wrote it"

## Customize

Edit **`references/house-rules.md`** — add a banned word, loosen a rule, tighten another. It's loaded
every pass and overrides the engine, so a change there takes effect everywhere with nothing else to
touch.

## Credits & sources

Built from:

- **Wikipedia, ["Signs of AI writing"](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing)** —
  the pattern catalog the prescriptive rules distill (CC BY-SA 4.0).
- **Conor Bronsdon's [`avoid-ai-writing`](https://github.com/conorbronsdon/avoid-ai-writing)** engine
  (v3.9.0, MIT) — vendored unmodified at `references/avoid-ai-writing.md` as the deep detection layer.

Those sources are synthesized into `references/write-human.md` (the prescriptive ruleset) and a
default `references/house-rules.md`. Full attribution in [NOTICE](NOTICE).

## License

[MIT](LICENSE). The vendored engine is MIT © Conor Bronsdon; see [NOTICE](NOTICE) for third-party terms.
