{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  cling,
  pip,
}:

buildPythonPackage rec {
  pname = "cling-wrapper";
  version = "1.15.2";
  pyproject = true;

  src = fetchPypi {
    pname = "cppyy-backend";
    inherit version;
    sha256 = "8d0ec169f6ea40d26999a61b274ce2ac880082e8d16aace6a0702933d3d835fc";
  };

  build-system = [ setuptools ];
  dependencies = [ cling ];

  nativeBuildInputs = [ pip ];
  installPhase = ''
    pip install --prefix $out dist/*.whl
  '';

  pythonImportsCheck = [ "cppyy_backend" ];

  meta = with lib; {
    homepage = "https://github.com/wlav/cppyy-backend/tree/master/clingwrapper";
    description = "C/C++ wrapper for Cling";
    license = licenses.bsd3;
  };
}
