#!/bin/bash
remote="analytics-base-5598fa1.private-us-east-1.github.net"
ssh $remote "mkdir -p data"
tar -czv -f - --exclude ./csv_data/intermediate_files ./csv_data | ssh $remote "cat > ~/data/csvfiles.tar.gz"


ssh $remote "ls -lah data"

ssh $remote "rm data/csvfiles.tar.gz"