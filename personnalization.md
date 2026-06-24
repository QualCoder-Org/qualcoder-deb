Install sudo apt install build-essential devscripts debhelper fakeroot lintian

- Put binary in package/src
- rename the version numero on the directory
- change version in debian/control ; package/usr/share/applications/QualCoder
- compile (on package directory) : `debuild -us -uc`
- test : `sudo gdebi -n ./qualcoder_3.8.2_all.deb`
- check validity  `lintian qualcoder_3.8.2_all.deb`

https://www.debian.org/doc/manuals/maint-guide/start.en.html
https://www.baeldung.com/linux/create-debian-package
