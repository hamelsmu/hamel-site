#!/bin/bash

find . -name "*.csv" -exec tar -rvf data.tar {} \; && gzip data.tar