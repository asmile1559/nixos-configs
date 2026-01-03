#!/bin/sh

nix-env --profile /nix/var/nix/profiles/system --delete-generations +3

nix-collect-garbage