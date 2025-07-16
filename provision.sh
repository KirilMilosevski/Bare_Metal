#!/bin/bash

set -e

install_docker() {
  echo "Installing Docker..."
  apt-get update
  apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

  # Ensure the directory exists
  mkdir -p /etc/apt/keyrings

# Download and store the GPG key
  curl -fsSL --insecure https://download.docker.com/linux/ubuntu/gpg | \
  gpg --dearmor --batch --yes -o /etc/apt/keyrings/docker.gpg

  echo "Acquire::https::download.docker.com::Verify-Peer \"false\";" > /etc/apt/apt.conf.d/99insecure
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu focal stable" > /etc/apt/sources.list.d/docker.list

  apt-get update
  apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
  usermod -aG docker vagrant

  systemctl enable docker
  systemctl start docker
}

install_make() {
  echo "Installing Make..."
  apt-get install -y make
}

install_dependencies() {
  install_docker
  install_make
  # Add other installs if needed
}

install_dependencies
