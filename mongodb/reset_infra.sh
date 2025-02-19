#!/bin/bash

set -eou pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR"/stop_infra.sh
"$SCRIPT_DIR"/clean_up.sh

"$SCRIPT_DIR"/reset_network.sh
"$SCRIPT_DIR"/start_infra.sh
