#!/usr/bin/env bash
# Regenerate the plugin's bundled skill from the canonical root files.
# Root SKILL.md + references/ are the single source of truth; the plugin copy is generated.
# Run this after editing SKILL.md or anything in references/. CI fails if the copy is out of sync.
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
dest="$repo_root/plugins/anti-ai-writing-humanizer/skills/anti-ai-writing-humanizer"

mkdir -p "$dest/references"
cp "$repo_root/SKILL.md" "$dest/SKILL.md"
# refresh references (remove stale, copy current)
rm -f "$dest/references/"*.md
cp "$repo_root/references/"*.md "$dest/references/"

count="$(find "$repo_root/references" -maxdepth 1 -name '*.md' | wc -l | tr -d ' ')"
echo "synced: plugin skill (SKILL.md + ${count} reference files)"
