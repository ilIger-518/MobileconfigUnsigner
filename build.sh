#!/bin/bash
# Compiles the droplet app. Drag a .mobileconfig onto ProfileUnsigner.app to unsign it.
set -e
cd "$(dirname "$0")"
rm -rf ProfileUnsigner.app
osacompile -o ProfileUnsigner.app ProfileUnsigner.applescript
echo "Built $(pwd)/ProfileUnsigner.app"
