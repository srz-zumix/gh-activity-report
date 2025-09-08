#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" &>/dev/null && pwd -P)

"${SCRIPT_DIR}/../.././gh-activity-report" -d 1 -n
"${SCRIPT_DIR}/../.././gh-activity-report" -d 1 -n --no-repo a
"${SCRIPT_DIR}/../.././gh-activity-report" -d 1 -n -- -- -repo:a
"${SCRIPT_DIR}/../.././gh-activity-report" -d 1 -n --
