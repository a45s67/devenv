{
    inputs = {
        nixpkgs.url = "github:nixOS/nixpkgs?ref=25.11";
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
                lazygit
                lf
                yazi
                zsh
                neovim
                tmux
                lua
                nodejs_24
                go
                fd
                tree
                rustup
                google-cloud-sdk
                helix
                nmap
                rustscan
                zoxide
                fzf
                ripgrep
                uv
                chezmoi
            ];
        };
      });
}
