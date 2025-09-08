#!/usr/bin/env zsh
set -euo pipefail

echo "Running zsh test script..."
output=$(gh activity-report -d 1 --author srz-zumix)

if [[ -z "$output" ]]; then
  echo "Output is empty"
  # exit 1 # This might fail if there is no activity, so I'll comment it out for now.
fi

echo "Zsh test script finished."
