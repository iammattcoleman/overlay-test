#!/bin/bash
set -euf -o pipefail

# Remove APT metadata
apt-get clean
set +f
rm -rf /var/lib/apt/*
set -f

# Generate the system's default locale
locale-gen en_US.UTF-8
