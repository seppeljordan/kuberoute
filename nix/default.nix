{ mkDerivation,
  pykube, effect, tornado, nose, route53, jinja2, python-etcd, boto3, python3
}:
let
  version = "1.1";
in
mkDerivation {
  name = "kuberoute-${version}";
  src = ../.;
  propagatedBuildInputs = [
    pykube effect tornado nose route53 jinja2 python-etcd boto3
  ];
  checkPhase = ''
    python $src/run-tests
  '';
  postUnpack = ''
    echo "Delete eventually old build artifacts"
    rm kuberoute/build -rfv
    rm kuberoute/dist -rfv
  '';
}
