{
  lib,
  stdenv,
  fetchPypi,
  buildPythonPackage,
  autoPatchelfHook,
  bash,
}:

let
  srcs = {
    x86_64-linux = {
      platform = "manylinux2014_x86_64";
      sha256 = "8ff146c8c6dc61dabfb782b8f3062803e61e936688c2d9a32f67f81931a12ab4";
    };
    aarch64-darwin = {
      platform = "macosx_11_0_arm64";
      sha256 = "af30bd3064ca7c8258401ddc061466639357d87ffe45197852b7d0659a20f3da";
    };
    x86_64-darwin = {
      platform = "macosx_10_15_x86_64";
      sha256 = "b88ac593af6dad07571273f4bf01b9350c9a48f888ef81c9d1e9d206367843c5";
    };
  };
in

buildPythonPackage rec {
  pname = "cppyy-cling";
  version = "6.30.0";
  format = "wheel";

  src = fetchPypi ({
    pname = "cppyy_cling";
    inherit version format;
  } // srcs.${stdenv.system});

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ bash ];

  pythonImportsCheck = [ "cppyy_backend" ];

  meta = {
    homepage = "https://github.com/wlav/cppyy-backend/tree/master/cling";
    description = "Re-packaged Cling, as backend for cppyy";
    license = lib.licenses.bsd3;
    platforms = lib.attrNames srcs;
  };
}
