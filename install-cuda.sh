#!/bin/bash

set -e

# Detect Ubuntu version
. /etc/os-release
UBUNTU_VERSION=$VERSION_ID

echo "Detected Ubuntu version: $UBUNTU_VERSION"

# Determine CUDA repo
case "$UBUNTU_VERSION" in
  "20.04")
    CUDA_REPO="ubuntu2004"
    ;;
  "22.04")
    CUDA_REPO="ubuntu2204"
    ;;
  "24.04")
    CUDA_REPO="ubuntu2404"
    ;;
  *)
    echo "Unsupported Ubuntu version: $UBUNTU_VERSION"
    exit 1
    ;;
esac

# Install prerequisites
sudo apt-get update
sudo apt-get install -y wget gnupg software-properties-common

# Add NVIDIA GPG key and CUDA 12.9 repo
echo "Adding CUDA 12.9 repository..."
wget https://developer.download.nvidia.com/compute/cuda/repos/${CUDA_REPO}/x86_64/cuda-${CUDA_REPO}.pin
sudo mv cuda-${CUDA_REPO}.pin /etc/apt/preferences.d/cuda-repository-pin-600

sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/${CUDA_REPO}/x86_64/3bf863cc.pub

sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/${CUDA_REPO}/x86_64/ /"

# Update & install CUDA 12.9 toolkit only
sudo apt-get update
sudo apt-get install -y cuda-toolkit-12-9

# Add CUDA to PATH
if ! grep -q "/usr/local/cuda/bin" ~/.bashrc; then
  echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
  echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
fi

echo "CUDA 12.9 Toolkit installed successfully!"
echo "Please run: source ~/.bashrc"
