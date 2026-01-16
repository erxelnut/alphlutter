{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in{
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        #(python3.withPackages (p: with p; [...]))
	flutter
      ];
    };
    shellHook = ''
      echo "flutter create your_project_name"
    '';
  };
}
