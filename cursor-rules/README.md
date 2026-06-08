# Cursor rule — anti-ai-writing-humanizer

`anti-ai-writing-humanizer.mdc` is the Cursor port of the skill. It carries the same core rules as
`../references/write-human.md`, condensed into a single self-contained rule (Cursor rules can't load
external reference files).

## Install

Copy the rule into your project's Cursor rules directory:

```bash
mkdir -p .cursor/rules
cp anti-ai-writing-humanizer.mdc .cursor/rules/
```

## How it activates

The rule's frontmatter sets `globs` to prose file types (`.md`, `.mdx`, `.txt`, `.rst`, `.adoc`) with
`alwaysApply: false`, so it activates when you're editing those files or when you ask Cursor to
"humanize" / "remove AI-isms". Edit the `globs` to fit your project.

For the full depth (severity tiers, context/voice profiles, the complete engine), use the Claude
Code skill — see the repo [README](../README.md).
