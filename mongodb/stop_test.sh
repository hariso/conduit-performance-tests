#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

docker compose -f "$SCRIPT_DIR"/conduit/compose.yaml down
docker compose -f "$SCRIPT_DIR"/kafka_connect/compose.yaml down
docker compose -f "$SCRIPT_DIR"/infrastructure/compose.yaml down
