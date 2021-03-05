#! /bin/bash
# setup_nix_local.sh
# Setup that is required on local machine

# Get Nix so we can use nix-env
sh <(curl -L https://nixos.org/nix/install)
# Install some packages locally
nix-env -iA nixpkgs.awscli2
nix-env -iA nixpkgs.terraform_0_14
nix-env -iA nixpkgs.tailscale
