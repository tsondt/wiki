#!/usr/bin/env bash -eu

CONTAINER_NAME="tsondt/wiki"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build -t "${CONTAINER_NAME}" "$DIR"
