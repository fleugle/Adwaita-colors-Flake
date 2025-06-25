{
  description = "Adwaita-colors icon themes flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        packages.adwaita-colors = pkgs.stdenv.mkDerivation {
          pname = "adwaita-colors";
          version = "git";

          src = pkgs.fetchFromGitHub {
            owner = "dpejoh";
            repo = "Adwaita-colors";
            rev = "main";
            sha256 = "sha256-kTgPD9Q8C5+LmwK5Mww4fh3IJ+mYMh400iQU1/u9iR0=";
          };

          installPhase = ''
            mkdir -p $out/share/icons
            cp -r Adwaita* $out/share/icons/

            rm -f $out/share/icons/Adwaita-blue/scalable/places/com.bitwig.BitwigStudio.application-bitwig-project-folder-legacy.svg
          '';

          meta = with pkgs.lib; {
            description = "Color variants of the Adwaita icon theme";
            homepage = "https://github.com/dpejoh/Adwaita-colors";
            license = licenses.gpl3Plus;
            platforms = platforms.linux;
          };
        };

        defaultPackage = self.packages.${system}.adwaita-colors;
      });
}
