#!/usr/bin/env bash
version=v2.6.5

set -e

curl -L https://github.com/kairos-io/provider-kairos/releases/download/$version/kairosctl-.$version-.linux-.amd64.tar.gz -o - | tar -xvzf - -C .
chmod +x ./kairosctl
find . -name cloud-config.yaml | while read config; do 
  echo -n \"\$config: \"; 
  kairosctl validate \$config;
  if [[ \$? -eq 0 ]]; then 
    echo \"valid\";
  else
    exit 1
  fi
done
