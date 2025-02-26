#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

curl -X PUT http://localhost:8083/connectors/$(jq -r '.name' "$SCRIPT_DIR/connector.json")/pause
