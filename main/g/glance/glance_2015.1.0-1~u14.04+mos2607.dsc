Format: 3.0 (quilt)
Source: glance
Binary: python-glance, glance, glance-doc, glance-common, glance-api, glance-registry
Architecture: all
Version: 1:2015.1.0-1~u14.04+mos2607
Maintainer: MOS Glance team <mos-glance@mirantis.com>
Homepage: http://launchpad.net/glance
Standards-Version: 3.9.4
Build-Depends: debhelper (>= 9), dh-python, dh-systemd, openstack-pkg-tools (>= 21), python-all (>= 2.7.1), python-pbr (>= 0.10), python-setuptools, python-sphinx (>= 1.1.2)
Build-Depends-Indep: python-anyjson (>= 0.3.3), python-babel (>= 1.3), python-cinderclient (>= 1:1.1.0), python-coverage (>= 3.6), python-crypto (>= 2.6), python-eventlet (>= 0.16.1), python-fixtures (>= 0.3.14), python-glance-store (>= 0.3.0), python-greenlet (>= 0.3.2), python-hacking (>= 0.10.0), python-httplib2 (>= 0.7.5), python-iso8601 (>= 0.1.9), python-jsonschema (>= 2.0.0), python-keystoneclient (>= 1:1.1.0), python-kombu (>= 2.5.0), python-lxml (>= 2.3), python-migrate (>= 0.9.5), python-mock (>= 1.0), python-mox, python-mox3 (>= 0.7.0), python-openssl (>= 0.11), python-oslo.concurrency (>= 1.8.0), python-oslo.config (>= 1:1.9.3), python-oslo.context (>= 0.2.0), python-oslo.db (>= 1.7.0), python-oslo.i18n (>= 1.5.0), python-oslosphinx (>= 2.5.0), python-oslo.log (>= 1.0.0), python-oslo.messaging (>= 1.8.0), python-oslo.policy (>= 0.3.1), python-oslo.serialization (>= 1.4.0), python-oslo.vmware (>= 0.11.1), python-oslo.utils (>= 1.4.0), python-oslotest, python-passlib, python-paste, python-pastedeploy (>= 1.5.0), python-psutil (>= 1.1.1), python-requests (>= 2.2.0), python-routes (>= 1.12.3), python-semantic-version (>= 2.3.1), python-six (>= 1.9.0), python-sqlalchemy (>= 0.9.7), python-suds (>= 0.4), python-swiftclient (>= 1:2.2.0), python-taskflow (>= 0.7.1), python-testtools (>= 0.9.36), python-webob (>= 1.2.3), python-xattr (>= 0.4), sqlite3, testrepository (>= 0.0.18)
Package-List: 
 glance deb python extra
 glance-api deb python extra
 glance-common deb python extra
 glance-doc deb doc extra
 glance-registry deb python extra
 python-glance deb python extra
Checksums-Sha1: 
 3da1d093f3258b98e428b61d02c73162396c8b03 1109111 glance_2015.1.0.orig.tar.gz
 20f1a40f6b873e24b9bdb61f64429c88c02a5807 8285 glance_2015.1.0-1~u14.04+mos2607.debian.tar.gz
Checksums-Sha256: 
 de4b7d7deab9dd7d716aeae435820024658bf8b274c99558e80d7d86aec3f1d4 1109111 glance_2015.1.0.orig.tar.gz
 c23ca7cd383314ef1c938bbbbbbc14a4822d62a39ca818762ec0a508ad7a8efc 8285 glance_2015.1.0-1~u14.04+mos2607.debian.tar.gz
Files: 
 e8b998b3116d626afc395f087d2b2d80 1109111 glance_2015.1.0.orig.tar.gz
 e648644e7bf25681acb6e0bee309891a 8285 glance_2015.1.0-1~u14.04+mos2607.debian.tar.gz
Python-Version: >= 2.6
Testsuite: autopkgtest
