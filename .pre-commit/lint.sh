#!/usr/bin/env bash
set -e
curl -s -L https://github.com/kairos-io/provider-kairos/releases/download/v2.6.5/kairosctl-v2.6.5-linux-amd64.tar.gz -o - | tar -xvzf - -C .
chmod +x ./kairosctl
./kairosctl validate cloud-config.yaml
