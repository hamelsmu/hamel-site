#!/bin/bash

set -e
mkdir -p synthetic_data
cd $(dirname "$0")/synthetic_data

cat /dev/urandom | head -n100 > random.txt
yes | head -n100 > yes.txt

# https://randomuser.me/
# https://randomuser.me/documentation#results

curl -s "https://randomuser.me/api/?format=csv&results=100" > random_users.csv
curl -s "https://randomuser.me/api/?format=json&results=100" > random_users.json

ls -lah
