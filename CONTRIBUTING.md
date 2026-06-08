# Contributing

Thanks for the interest. This is a small, focused skill — contributions that keep it sharp are welcome.

## How it's structured

The skill follows the [skills.sh](https://skills.sh) convention — everything lives under
`skills/anti-ai-writing-humanizer/`:

- **`skills/anti-ai-writing-humanizer/SKILL.md`** — the skill's behavior and the light/heavy depth logic.
- **`.../references/house-rules.md`** — the editable banned-word/style list. Source of truth, wins on conflict.
- **`.../references/write-human.md`** — the synthesized prescriptive rules (tagged by source).
- **`.../references/avoid-ai-writing.md`** — vendored upstream engine. **Don't hand-edit** — re-vendor from
  [conorbronsdon/avoid-ai-writing](https://github.com/conorbronsdon/avoid-ai-writing).

## Before you open a PR

1. Verify the skill still resolves: `npx skills add ./ --list` should show one skill named
   `anti-ai-writing-humanizer`.
2. Keep prose changes consistent with the skill's own rules (sentence case, no AI-isms — eat your own dog food).
3. New patterns include a before/after example.

## Good contributions

- New banned words or patterns with a clear before/after example.
- Install paths for other agent platforms.
- Fixes to false positives (a rule firing where it shouldn't).

## Not in scope

- Rewriting the vendored engine (send those upstream).
- Turning this into a general grammar/style linter — it's specifically about removing AI tells.
