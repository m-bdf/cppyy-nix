{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  CPyCppyy,
}:

buildPythonPackage rec {
  pname = "cppyy";
  version = "3.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "7937d184af02e1510f44d5655e0bcc3c6a7888ef5b3f06c3dd09ba93d1c1f19b";
  };

  build-system = [ setuptools ];
  dependencies = [ CPyCppyy ];

  pythonImportsCheck = [ "cppyy" ];

  meta = with lib; {
    homepage = "https://github.com/wlav/cppyy";
    description = "Python-C++ bindings interface based on Cling/LLVM";
    license = licenses.bsd3;
  };
}