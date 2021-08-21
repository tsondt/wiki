#!/usr/bin/env bash -eu

CONTAINER_NAME="tsondt/wiki"
CONTAINER_PORT=4000
ARGS="${CONTAINER_PORT}"

usage () {
    echo "Usage:"
    echo -e "\t./docker-run.sh"
    echo -e "\t./docker-run.sh [port] [extra args for jekyll serve]"
}

if ! [ $# -eq 0 ]; then
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
        usage
        exit 1
    fi
    CONTAINER_PORT=$1
    ARGS="$@"
fi

docker run --rm -v $PWD:/srv "${CONTAINER_NAME}" check ||
docker run --rm -v $PWD:/srv "${CONTAINER_NAME}" install &&
docker run -ti --rm -v $PWD:/srv -p ${CONTAINER_PORT}:${CONTAINER_PORT} "${CONTAINER_NAME}" exec jekyll serve --incremental --host 0.0.0.0 --port ${ARGS}
