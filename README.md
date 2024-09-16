```
# Update the flake.lock
nix flake update

# test
nix shell github:a45s67/devenv

# install
nix profile install github:a45s67/devenv  # or add --refresh to prevent caching
```
