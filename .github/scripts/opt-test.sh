#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" &>/dev/null && pwd -P)

PARAMS=$("${SCRIPT_DIR}/opt-json.sh")
IFS=$'\n'; for key in $(echo "${PARAMS}" | jq -c -r 'keys | .[]' ); do
    OPT_PARAMS=$(echo "${PARAMS}" | jq -c ".\"${key}\" | .[]")
    echo "${key}"
    if [ -f "${SCRIPT_DIR}/${key}.done" ]; then
        echo "  Already tested."
        continue
    fi
    OPT_PARAMS_ARRAY=("${OPT_PARAMS}")
    for opt in "${OPT_PARAMS_ARRAY[@]}"; do
        echo "  ${opt}"
        echo "${opt}" | xargs -I {} gh activity-report "${key}" {} > /dev/null
        # API rate limite workaround
        sleep "${TEST_SLEEP:-3}"
    done
    touch "${SCRIPT_DIR}/${key}.done"
done
