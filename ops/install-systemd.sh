#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
sudo systemd-analyze verify ops/systemd/heatlh-checker-run.service ops/systemd/heatlh-checker-run.timer
sudo install -m 0644 ops/systemd/heatlh-checker-run.service /etc/systemd/system/heatlh-checker-run.service
sudo install -m 0644 ops/systemd/heatlh-checker-run.timer /etc/systemd/system/heatlh-checker-run.timer
sudo systemctl daemon-reload
sudo systemctl enable --now heatlh-checker-run.timer
sudo systemctl restart heatlh-checker-run.timer
sudo systemctl start heatlh-checker-run.service
sudo systemctl is-active --quiet heatlh-checker-run.timer
