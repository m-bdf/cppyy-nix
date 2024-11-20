{
  lib,
  fetchPypi,
  buildPythonPackage,
  bash,
}:

buildPythonPackage rec {
  pname = "cppyy-cling";
  version = "6.30.0";
  format = "wheel";

  src = fetchPypi {
    pname = "cppyy_cling";
    inherit version format;
    platform = "manylinux2014_x86_64";
    sha256 = "8ff146c8c6dc61dabfb782b8f3062803e61e936688c2d9a32f67f81931a12ab4";
  };

  buildInputs = [ bash ];

  pythonImportsCheck = [ "cppyy_backend" ];

  meta = with lib; {
    homepage = "https://github.com/wlav/cppyy-backend/tree/master/cling";
    description = "Re-packaged Cling, as backend for cppyy";
    license = licenses.bsd3;
  };
}
