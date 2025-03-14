# Expression generated by update.sh; do not edit it by hand!
{ stdenv, callPackage, ... }@args:

let
  pname = "brave";
  version = "1.75.181";

  allArchives = {
    aarch64-linux = {
      url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser_${version}_arm64.deb";
      hash = "sha256-auFTQKwcnRwWaNHnO6GBQGV1RlSThmYnvOElKt2TvCc=";
    };
    x86_64-linux = {
      url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser_${version}_amd64.deb";
      hash = "sha256-1nAdmjo16yQDyEZOR4mS95j9I5/ifWXjlq8zy26vaFM=";
    };
    aarch64-darwin = {
      url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-v${version}-darwin-arm64.zip";
      hash = "sha256-ap+OPfCaKOwNkhFcAN6p0gT54sdRVpEvQPGoaK4ezl0=";
    };
    x86_64-darwin = {
      url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-v${version}-darwin-x64.zip";
      hash = "sha256-knAWVxKaYOevNbYDNe78htCb4QVUQ8X+AZim33DN3MU=";
    };
  };

  archive =
    if builtins.hasAttr stdenv.system allArchives then
      allArchives.${stdenv.system}
    else
      throw "Unsupported platform.";

in
callPackage ./make-brave.nix (removeAttrs args [ "callPackage" ]) (
  archive
  // {
    inherit pname version;
  }
)
