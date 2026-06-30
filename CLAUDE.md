# CLAUDE.md

Guidance for working in this repo.

## What this is

`anti-ai-writing-humanizer` — a portable agent skill that writes or rewrites prose so it doesn't
read as AI. Published on [skills.sh](https://skills.sh/daniel-bogale/anti-ai-writing-humanizer),
installable with `npx skills add daniel-bogale/anti-ai-writing-humanizer`. MIT licensed. The repo
is content (Markdown), not code — there's no build or test step.

## Layout (skills.sh convention — don't change it)

```
skills/anti-ai-writing-humanizer/
  SKILL.md                  the skill: light/heavy depth logic
  references/
    house-rules.md          editable banned words/structures — SOURCE OF TRUTH, wins on conflict
    write-human.md          synthesized prescriptive rules, each tagged [H]/[W]/[E]
    avoid-ai-writing.md     VENDORED engine (Conor Bronsdon, MIT) — do not hand-edit
.claude-plugin/             marketplace.json + plugin.json (Claude plugin install; source ".")
cursor-rules/               self-contained Cursor port (.mdc)
```

The skill must live at `skills/anti-ai-writing-humanizer/` — that single canonical location is what
the `skills` CLI and skills.sh expect. Do **not** reintroduce a duplicate copy (e.g. under
`plugins/`); one copy only.

## Editing rules

- **Change writing taste** (add/remove a banned word, tweak a style rule) → edit only
  `references/house-rules.md`. It's the source of truth and overrides the engine.
- **`references/avoid-ai-writing.md` is vendored** from
  [conorbronsdon/avoid-ai-writing](https://github.com/conorbronsdon/avoid-ai-writing). Don't edit by
  hand — re-vendor the file and keep `NOTICE` (MIT attribution) intact.
- **Eat your own dog food:** README and skill prose must follow the skill's own rules — sentence
  case, no AI-isms, ≤1 em dash, specifics over puffery.

## SKILL.md frontmatter gotcha (important)

The `skills` CLI parses YAML strictly. A plain (unquoted) `description:` value must **not** contain
`: ` (colon-space) or ` #` (space-hash) — either breaks discovery and the CLI silently reports
"No skills found." Claude Code itself tolerates these, so test with the CLI, not just Claude Code.
Keep `name:` and `description:` present in the frontmatter.

## Verify before pushing

```bash
npx skills add ./ --list          # must show exactly ONE skill: anti-ai-writing-humanizer
npx skills use ./ --skill anti-ai-writing-humanizer   # prompt should include the references
```

CI (`.github/workflows/ci.yml`) also validates the manifest JSON, the SKILL.md frontmatter, and that
all three references exist.

## Publish flow

Edit → commit → `git push` → bump `version` in `.claude-plugin/plugin.json` + `CHANGELOG.md` →
`gh release create vX.Y.Z`. The globally-installed copy refreshes with
`npx skills update -g anti-ai-writing-humanizer` (editing this repo alone does not change it).

## Don't

- Commit secrets, private paths, or personal names — this repo is public.
- Turn the skill into a general grammar/style linter; it's specifically about removing AI tells.
