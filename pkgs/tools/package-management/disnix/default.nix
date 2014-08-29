{ stdenv, fetchgit, pkgconfig, dbus_glib, libxml2, libxslt, getopt, nixStable, dysnomia, libintlOrEmpty, libiconvOrEmpty, automake, autoconf, libtool }:

stdenv.mkDerivation {
  name = "disnix-0.3-git-4d1b19cf4c";
  
  src = fetchgit {
    url = http://github.com/vizanto/disnix.git;
    rev = "4d1b19cf4c032cfb3584438c2591ef1fdbc0d6d9";
    sha256 = "a8cd129173aa439c53eda584f76b72d514f43083d2cea9851cf5becb81d2dd49";
  };
  
  buildInputs = [ pkgconfig dbus_glib libxml2 libxslt getopt nixStable libintlOrEmpty libiconvOrEmpty dysnomia automake autoconf libtool ];

  preConfigure = ''
    sed -e 's|doc||' -i Makefile.am
    ./bootstrap
  '';

  dontStrip = true;
  
  meta = {
    description = "A distributed deployment extension for Nix";
    license = stdenv.lib.licenses.lgpl21Plus;
    maintainers = [ stdenv.lib.maintainers.sander ];
  };
}
