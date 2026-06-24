Install sudo apt install build-essential devscripts debhelper fakeroot lintian

- Put binary in package/src/qualcoder
- rename the version numero on the directory
- change version in debian/control ; package/usr/share/applications/QualCoder
- compile (on package directory) : `debuild -us -uc`


https://www.debian.org/doc/manuals/maint-guide/start.en.html
https://www.baeldung.com/linux/create-debian-package
