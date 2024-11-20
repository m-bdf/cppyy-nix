{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  cppyy-backend,
}:

buildPythonPackage rec {
  version = "1.12.16";
  pname = "CPyCppyy";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "09a845652ac1a82777ec499dda862f54493c1560e9df4cadecda09ecde9e4202";
  };

  build-system = [ setuptools ];
  dependencies = [ cppyy-backend ];

  meta = with lib; {
    homepage = "https://github.com/wlav/CPyCppyy";
    description = "Cling-based Python-C++ bindings for CPython";
    license = licenses.bsd3;
  };
}
