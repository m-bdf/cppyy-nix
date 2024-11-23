{
  callPackage,
  symlinkJoin,
}:

let
  cppyy-cling = callPackage ./cppyy-cling.nix {};
  cling-wrapper = callPackage ./cling-wrapper.nix { cling = cppyy-cling; };
in

symlinkJoin {
  name = "cppyy-backend";
  paths = [ cppyy-cling cling-wrapper ];

  meta = {
    homepage = "https://github.com/wlav/cppyy-backend";
    description = "Re-packaged Cling, as backend for cppyy, wrapped";
    inherit (cling-wrapper.meta) license platforms;
  };
}
