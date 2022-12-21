#!/bin/bash

while (( $# )); do
    echo "process args: $1"
    shift
done

for i in $*; do
    echo $i
done
