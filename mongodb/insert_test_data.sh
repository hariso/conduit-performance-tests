#!/bin/bash

set -eou pipefail

mongosh "mongodb://mongo1:30001,mongo2:30002,mongo3:30003/test?replicaSet=my-replica-set" --eval 'load("insert-many-users.js")'