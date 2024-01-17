{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };
  
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let

        pkgs = import nixpkgs { inherit system;
                                config.allowUnfree = true;};

      in rec {
        
        devShell =  pkgs.mkShell {
          buildInputs = with pkgs; [
            terraform
            goreleaser
            go
            docker
            svu
            git-chglog
          ];
        };
        
      }
    );
}
  
