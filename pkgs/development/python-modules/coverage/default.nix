{
  lib,
  buildPythonPackage,
  fetchPypi,
  mock,
  pythonOlder,
  setuptools,
}:

buildPythonPackage rec {
  pname = "coverage";
  version = "7.5.3";
  pyproject = true;

  # uses f strings
  disabled = pythonOlder "3.5";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BK78pRkNHcelOkwaWn+FaIETBteo7iMcQvtpIVVxlE8=";
  };

  nativeBuildInputs = [ setuptools ];

  # No tests in archive
  doCheck = false;
  nativeCheckInputs = [ mock ];

  meta = {
    description = "Code coverage measurement for python";
    homepage = "https://coverage.readthedocs.io/";
    license = lib.licenses.bsd3;
  };
}
