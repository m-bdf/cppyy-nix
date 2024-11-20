{
  outputs = { self, systems, nixpkgs }: {
    packages = nixpkgs.lib.genAttrs (import systems) (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        cppyy = pkgs.python3Packages.callPackage ./cppyy.nix {
          CPyCppyy = pkgs.python3Packages.callPackage ./CPyCppyy.nix {
            cppyy-backend = pkgs.python3Packages.callPackage ./cppyy-backend {};
          };
        };
      }
    );
  };
}
