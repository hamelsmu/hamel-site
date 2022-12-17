#!/bin/bash

mkfifo pipe1
ls -l > pipe1 &
cat < pipe1
