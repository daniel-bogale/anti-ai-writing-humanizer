# Changelog

All notable changes to this project are documented here. Format loosely follows
[Keep a Changelog](https://keepachangelog.com/); versions follow [SemVer](https://semver.org/).

## [1.1.0] — 2026-06-08

Restructured to the [skills.sh](https://skills.sh) convention so it installs with
`npx skills add daniel-bogale/anti-ai-writing-humanizer`.

- Moved the skill to `skills/anti-ai-writing-humanizer/SKILL.md` with `references/` alongside —
  the single canonical location the `skills` CLI and skills.sh expect.
- Removed the duplicated `plugins/` skill tree and the sync script/CI (no longer needed with one
  canonical copy). The Claude plugin now uses a root `.claude-plugin/` with `source: "."`.
- README leads with the `skills` CLI install and adds a skills.sh badge. No change to the skill's
  behavior or rules.

## [1.0.0] — 2026-06-08

Initial release.

- `SKILL.md` — the humanizer skill with an automatic light/heavy depth toggle.
- `references/write-human.md` — prescriptive "write this way, not that way" ruleset, synthesized
  from the house rules, Wikipedia's "Signs of AI writing" catalog, and the detection engine, each
  rule tagged with its source.
- `references/house-rules.md` — editable default house rules (the single source of truth, wins on conflict).
- `references/avoid-ai-writing.md` — vendored `avoid-ai-writing` engine v3.9.0 (Conor Bronsdon, MIT).
- Multi-platform install: Claude Code (clone or plugin), Cursor, Codex, OpenClaw.
- Plugin marketplace, CI sync check, MIT license + third-party NOTICE.
