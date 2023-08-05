#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" &>/dev/null && pwd -P)

FIRST_LINE=true

echo "{"
while read -r line
do
    KEYS=${line%%:*}
    VAL=${line##*:}
    IFS='| '; for key in ${KEYS}; do
        "${FIRST_LINE}" || echo ","
        echo "\"${key}\": ${VAL}"
        FIRST_LINE=false
    done
done < <(grep "option_test\(.*\)" "${SCRIPT_DIR}/../../gh-activity-report" | sed -e 's/\s*\(-.*\)\s*).*\(\[.*\]\).*/\1: \2/g')

echo "}"
