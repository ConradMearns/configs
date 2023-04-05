{ pkgs }:

pkgs.python38Packages.buildPythonPackage rec {
  pname = "mdns-publisher";
  version = "0.9.2";
  src = pkgs.python39Packages.pip.fetchPypi {
    inherit pname version;
    sha256 = "b230902a7b0547ac372300af675183c3456a9cb8c46cedde72028e26b4998fce";
  };
  buildInputs = [ pkgs.python38Packages.setuptools ];
  meta = {
    description = "Publish CNAMEs pointing to the local host over Avahi/mDNS";
    homepage = "https://github.com/carlosefr/mdns-publisher";
    license = pkgs.lib.licenses.mit;
    maintainers = with pkgs.maintainers; [ ];
  };
}
