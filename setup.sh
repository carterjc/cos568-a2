#!/bin/bash
set -e

USER="carterjc"
NODES=("clnode202" "clnodeXXX" "clnodeYYY" "clnodeZZZ")
DOMAIN="clemson.cloudlab.us"
REPO_DIR="~/cos568-a2"

for node in "${NODES[@]}"; do
  host="${USER}@${node}.${DOMAIN}"
  echo "[*] Setting up $host"

  ssh "$host" 'sudo apt-get update && sudo apt-get install -y htop dstat python3-pip'
  ssh "$host" "echo 'export PATH=\$HOME/.local/bin:\$PATH' >> ~/.bashrc"
  ssh "$host" 'export PATH=$HOME/.local/bin:$PATH && pip install torch==2.5.0 torchvision==0.20.0 torchaudio==2.5.0 --index-url https://download.pytorch.org/whl/cpu && pip install numpy scipy scikit-learn tqdm pytorch_transformers apex'

  echo "[*] Done with $host"
done
