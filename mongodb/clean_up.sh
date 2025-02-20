#!/bin/bash

set -eou pipefail

echo "Cleaning up data..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

docker container prune -f
docker volume prune -f --filter all=true

echo "Data clean-up finished."