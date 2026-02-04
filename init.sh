#!/usr/bin/env bash
set -euo pipefail

NAME="${1:?usage: bash init.sh <repo-name>}"
OWNER="${2:-}"

rm -rf .git
git init -q
git branch -M main
git add .
git commit -qm "Initial commit"

if command -v gh >/dev/null 2>&1; then
  OWNER="${OWNER:-$(gh api user --jq .login 2>/dev/null || true)}"
  [[ -n "$OWNER" ]] && gh repo create "$OWNER/$NAME" --private --source=. --remote=origin --push -q
fi

echo "✔ $NAME ready"
