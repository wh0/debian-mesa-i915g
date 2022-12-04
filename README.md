```sh
docker run -name build32 -it i386/debian:unstable
```

inside:

```sh
sed -i '1s/Types: deb/Types: deb deb-src/' /etc/apt/sources.list.d/debian.sources
apt update
apt install -y build-essential
apt build-dep -y libgl1-mesa-dri
mkdir project
cd project
apt source libgl1-mesa-dri
cd mesa-*
sed -i '128s/iris crocus/iris crocus i915/' debian/rules
dpkg-buildpackage
```

outside:

```sh
docker cp build32:/project/libgl1-mesa-dri_22.3.0-1_i386.deb .
```
