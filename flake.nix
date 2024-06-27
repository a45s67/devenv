{
    inputs = {
        nixpkgs.url = "github:nixOS/nixpkgs?ref=24.05";
    };

    outputs = {self, nixpkgs}:
# supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
    {
        packages."aarch64-darwin".default = let
            pkgs = nixpkgs.legacyPackages."aarch64-darwin";
        in pkgs.buildEnv {
            name = "devenv";
            paths = with pkgs; [
                yazi
            ];
        };

    };
}
