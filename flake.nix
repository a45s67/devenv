{
    inputs = {
        nixpkgs.url = "github:nixOS/nixpkgs?ref=24.05";
        flake-utils.url = "github:numtide/flake-utils";
    };

    
    # Reference: [flakes template - ruby](https://github.com/NixOS/templates/blob/master/ruby/flake.nix)
    outputs = {self, nixpkgs, flake-utils}:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        defaultPackage = with pkgs;
        buildEnv {
            name = "devenv";
            paths = with pkgs; [
                openvpn
                yazi
                zsh
                neovim
                tmux
                lua
                nodejs_22
                go
                fd
                rustup
                google-cloud-sdk
                helix
            ];
        };
      });
}
