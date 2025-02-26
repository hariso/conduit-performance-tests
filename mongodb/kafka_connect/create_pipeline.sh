#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

curl -X POST -H "Content-Type: application/json" -d @"$SCRIPT_DIR/connector.json" localhost:8083/connectors

"$SCRIPT_DIR/stop_pipeline.sh"
