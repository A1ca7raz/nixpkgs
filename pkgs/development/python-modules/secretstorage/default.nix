{
  lib,
  buildPythonPackage,
  cryptography,
  fetchPypi,
  jeepney,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "secretstorage";
  version = "3.3.3";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    pname = "SecretStorage";
    inherit version;
    hash = "sha256-JANTPvNp7KbSuoFxhXbF4PVk1cyhtY9zqLI+fU7uvXc=";
  };

  propagatedBuildInputs = [
    cryptography
    jeepney
  ];

  # Needs a D-Bus session
  doCheck = false;

  pythonImportsCheck = [ "secretstorage" ];

  meta = with lib; {
    description = "Python bindings to FreeDesktop.org Secret Service API";
    homepage = "https://github.com/mitya57/secretstorage";
    license = licenses.bsd3;
    maintainers = with maintainers; [ teto ];
  };
}
