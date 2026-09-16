#!/usr/bin/env bash

set -euo pipefail

proof_branch="lab3-proof-${GITHUB_RUN_ID}"

git config user.name "Lab 3 Proof"
git config user.email "lab3-proof@example.invalid"
git switch -c "$proof_branch"
printf 'Lab 3 workflow-token write confirmed for run %s\n' "$GITHUB_RUN_ID" > lab3-proof.txt
git add lab3-proof.txt
git commit -m "lab: record authorized workflow-token proof"
git push origin "HEAD:refs/heads/$proof_branch"

printf 'Created proof branch: %s\n' "$proof_branch"
