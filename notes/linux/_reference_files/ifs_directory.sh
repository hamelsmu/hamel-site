#!/bin/bash
IFS=":"
for directory in $PATH ; do
   echo $directory
done