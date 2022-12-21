#!/bin/bash
IFS=","
while read a b c d; do
    echo "a - $a, b - $b, c - $c, d - $d"
done < distros.txt