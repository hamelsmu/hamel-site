#!/bin/bash

echo "This is the first line"
sleep 1
trap "echo this should show up at the end" EXIT

echo "This is the last line"


