Format: 3.0 (quilt)
Source: keystone
Binary: python-keystone, keystone, keystone-doc
Architecture: all
Version: 1:2015.1.0-1~u14.04+mos4436
Maintainer: MOS Keystone Team <mos-keystone@mirantis.com>
Homepage: http://launchpad.net/keystone
Standards-Version: 3.9.3
Build-Depends: debhelper (>= 9), dh-python, dh-systemd, openstack-pkg-tools (>= 23~), python-all, python-pbr (>= 0.10), python-setuptools, python-sphinx, python-tempest-lib
Build-Depends-Indep: python-dogpile.cache (>= 0.5.3), python-eventlet (>= 0.16.1), python-greenlet (>= 0.3.2), python-iso8601 (>= 0.1.9), python-jsonschema (>= 2.0.0), python-keystoneclient (>= 1:1.1.0), python-keystonemiddleware (>= 1.5.0), python-oslo.concurrency (>= 1.8.0), python-ldap, python-ldappool, python-lxml, python-memcache, python-migrate (>= 0.9.5), python-mock, python-mox, python-netaddr (>= 0.7.12), python-netifaces, python-oauthlib (>= 0.6), python-pysaml2, python-oslo.i18n (>= 1.5.0), python-oslo.config (>= 1:1.9.3), python-oslo.db (>= 1.7.0), python-oslo.log (>= 1.0.0), python-oslo.messaging (>= 1.8.0), python-oslosphinx, python-oslotest, python-pam (>= 0.1.4), python-passlib, python-paste, python-pastedeploy (>= 1.5.0), python-posix-ipc, python-pycadf (>= 0.8.0), python-pymongo, python-pysqlite2, python-requests (>= 2.2.0), python-routes (>= 1.12.3), python-six (>= 1.9.0), python-sqlalchemy (>= 0.9.7), python-testtools (>= 0.9.36), python-webob (>= 1.2.3), python-webtest, python-wsme, subunit, testrepository
Package-List: 
 keystone deb python extra
 keystone-doc deb doc extra
 python-keystone deb python extra
Checksums-Sha1: 
 d1dddb8420195d2db261284bf11ae311ed5823f1 886034 keystone_2015.1.0.orig.tar.gz
 03d4d29a90eb1e4783db3f5ea1f947eb7fdf9912 8260 keystone_2015.1.0-1~u14.04+mos4436.debian.tar.gz
Checksums-Sha256: 
 797e0d2bacf93c8144715689e3b7d0aacf6e432499757fb675ce9f961a010eea 886034 keystone_2015.1.0.orig.tar.gz
 e7c04a13feb46ecf59601a694436ea4e75ebb99b3dd770a6c85e323d96b73e3a 8260 keystone_2015.1.0-1~u14.04+mos4436.debian.tar.gz
Files: 
 5ba935cd1033797250ffd6b5755487f9 886034 keystone_2015.1.0.orig.tar.gz
 61323878df64869949ca320e5647be77 8260 keystone_2015.1.0-1~u14.04+mos4436.debian.tar.gz
Python-Version: >= 2.6
Testsuite: autopkgtest
