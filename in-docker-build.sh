#!/bin/sh -eux
sed -i '1s/Types: deb/Types: deb deb-src/' /etc/apt/sources.list.d/debian.sources
apt-get update
apt-get install -y build-essential
MESA_VERSION=22.3.0-2
apt-get build-dep -y "mesa=$MESA_VERSION"
apt-get source "mesa=$MESA_VERSION"
cd mesa-*
sed -i '128s/iris crocus/iris crocus i915/' debian/rules
dpkg-buildpackage
