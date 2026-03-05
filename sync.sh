#!/bin/bash
set -e

USER="carterjc"
NODES=("clnode202")
DOMAIN="clemson.cloudlab.us"
REPO_DIR="~/cos568-a2"

for node in "${NODES[@]}"; do
  host="${USER}@${node}.${DOMAIN}"
  echo "[*] Syncing to $host"
  rsync -avz --exclude '.git' --exclude '__pycache__' --exclude '.venv' ./ "${host}:${REPO_DIR}/"
  echo "[*] Copying utils_glue.py into task dirs on $host"
  ssh "$host" "cd ${REPO_DIR} && for dir in task1 task2a task2b task3 task4; do [ -d \$dir ] && cp utils_glue.py \$dir/; done"
  echo "[*] Downloading GLUE data on $host"
  ssh "$host" "cd ${REPO_DIR} && mkdir -p glue_data && python3 download_glue_data.py --data_dir glue_data"
done
