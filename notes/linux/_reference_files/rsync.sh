#!/bin/bash
set -e
remote="analytics-base-5598fa1.private-us-east-1.github.net"
ssh $remote "mkdir -p syncdirectory"
echo "before syncing:"
ssh $remote "ls -lah syncdirectory"
rsync -av csv_data $remote:syncdirectory

echo "after syncing:"
ssh $remote "ls -lah syncdirectory"
