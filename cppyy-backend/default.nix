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
}
