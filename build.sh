#!/bin/bash
# Compiles the droplet app. Drag a .mobileconfig onto MobileconfigUnsigner.app to unsign it.
set -e
cd "$(dirname "$0")"
rm -rf MobileconfigUnsigner.app
osacompile -o MobileconfigUnsigner.app MobileconfigUnsigner.applescript
echo "Built $(pwd)/MobileconfigUnsigner.app"
