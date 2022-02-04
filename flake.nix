{
  description = "Parity Polkadot Parachain Roadmap";

  inputs = {
    utils.url = "github:numtide/flake-utils";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";

    polkadot.url = "github:paritytech/polkadot";
    polkadot.flake = false;
  };

  outputs = { self, utils, nixpkgs, polkadot }: 
    utils.lib.eachDefaultSystem (system: {

      packages = let
        pkgs = nixpkgs.legacyPackages.${system};

        mdbook-linkcheck = pkgs.callPackage ./mdbook-linkcheck.nix {};

        rev = if self ? rev
          then (builtins.substring 0 8 self.rev) 
          else toString self.lastModified;
          
        args = { 
          version = rev;

          nativeBuildInputs = with pkgs; [
            mdbook
            graphviz
            mdbook-graphviz
            mdbook-mermaid
            mdbook-linkcheck 
          ];
        };
      in {
        implementers-guide = pkgs.runCommand "implementers-guide-html-${rev}" args ''
          mdbook build -d $out ${polkadot}/roadmap/implementers-guide 
        '';
      };

      defaultPackage = self.packages.${system}.implementers-guide;
    }) // {
      checks = self.packages;
    };
}
