#!/bin/bash

set -eou pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mongosh "mongodb://mongo1:30001,mongo2:30002,mongo3:30003/test?replicaSet=my-replica-set" --eval "load(\"$SCRIPT_DIR/insert-many-users.js\")"