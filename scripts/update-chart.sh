#!/usr/bin/env bash

set -euo pipefail

newDockerVersion="$1"

# inspired by https://github.com/renovatebot/renovate/issues/8231#issuecomment-886188267
# if we manually surround the version by quotes it will break!!
sed -i "s/^version:.*/version: $(grep '^version:' chart/pyroscope/Chart.yaml | awk '{print $2}' | awk -F '[.\"]' '{$NF = $NF + 1;} 1' | sed 's/ /./g')/" chart/pyroscope/Chart.yaml

sed -i "s/^appVersion:.*/appVersion: \"$newDockerVersion\"/" chart/pyroscope/Chart.yaml

# TODO
# only run if it's on linux
if [ -f /etc/os-release ]; then
  # create a temporary director
  # and delete in the end (even though it makes no difference since renovate runs in a container)
  tempDir=$(mktemp -d)
  trap "rm -rf $tempDir" EXIT

  # download norwoodj/helm-docs to our temp dir
  curl -sfL https://github.com/norwoodj/helm-docs/releases/download/v1.5.0/helm-docs_1.5.0_Linux_x86_64.tar.gz --output "$tempDir/helm-docs.tar.gz"

  # extract that file
  tar xvf "$tempDir/helm-docs.tar.gz" --directory="$tempDir"

  # execute the command
  "$tempDir/helm-docs"
fi
