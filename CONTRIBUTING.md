# Contributing

Thanks for the interest. This is a small, focused skill — contributions that keep it sharp are welcome.

## How it's structured

- **`SKILL.md`** — the skill's behavior and the light/heavy depth logic.
- **`references/house-rules.md`** — the editable banned-word/style list. Source of truth, wins on conflict.
- **`references/write-human.md`** — the synthesized prescriptive rules (tagged by source).
- **`references/avoid-ai-writing.md`** — vendored upstream engine. **Don't hand-edit** — re-vendor from
  [conorbronsdon/avoid-ai-writing](https://github.com/conorbronsdon/avoid-ai-writing).
- The `plugins/` copy is **generated** — never edit it directly.

## Before you open a PR

1. Edit the root `SKILL.md` / `references/` — never the `plugins/` copy.
2. Run `bash scripts/sync-plugin-skill.sh` to regenerate the plugin copy and commit the result.
   CI fails if the bundled copy drifts from the root.
3. Keep prose changes consistent with the skill's own rules (sentence case, no AI-isms — eat your own dog food).

## Good contributions

- New banned words or patterns with a clear before/after example.
- Install paths for other agent platforms.
- Fixes to false positives (a rule firing where it shouldn't).

## Not in scope

- Rewriting the vendored engine (send those upstream).
- Turning this into a general grammar/style linter — it's specifically about removing AI tells.
