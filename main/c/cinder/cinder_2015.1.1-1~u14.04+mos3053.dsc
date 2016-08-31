Format: 3.0 (quilt)
Source: cinder
Binary: python-cinder, cinder-common, cinder-api, cinder-volume, cinder-scheduler, cinder-backup, cinder-doc
Architecture: all
Version: 1:2015.1.1-1~u14.04+mos3053
Maintainer: MOS Cinder Team <mos-cinder@mirantis.com>
Homepage: http://launchpad.net/cinder
Standards-Version: 3.9.6
Build-Depends: debhelper (>= 9), dh-systemd, dh-python, openstack-pkg-tools (>= 21), python-all (>= 2.7.1), python-pbr (>= 0.10), python-setuptools, python-sphinx (>= 1.1.2)
Build-Depends-Indep: python-anyjson (>= 0.3.3), python-babel (>= 1.3), python-barbicanclient (>= 3.0.1), python-coverage (>= 3.6), python-crypto (>= 2.6), python-eventlet (>= 0.16.1), python-fixtures (>= 0.3.14), python-glanceclient (>= 1:0.15.0), python-greenlet (>= 0.3.2), python-hacking (>= 0.10.0), python-iso8601 (>= 0.1.9), python-keystoneclient (>= 1:1.1.0), python-keystonemiddleware (>= 1.5.0), python-kombu (>= 2.5.0), python-lxml (>= 2.3), python-migrate (>= 0.9.5), python-mock (>= 1.0), python-mox (>= 0.5.3), python-mysqldb, python-netaddr (>= 0.7.12), python-novaclient (>= 1:2.22.0), python-oslo.concurrency (>= 1.8.0), python-oslo.config (>= 1:1.9.3), python-oslo.context (>= 0.2.0), python-oslo.db (>= 1.7.0), python-oslo.i18n (>= 1.5.0), python-oslo.log (>= 1.0.0), python-oslo.messaging (>= 1.8.0), python-oslo.middleware (>= 1.0.0), python-oslo.rootwrap (>= 1.6.0), python-oslo.serialization (>= 1.4.0), python-oslo.utils (>= 1.4.0), python-oslo.vmware (>= 0.11.1), python-oslosphinx (>= 2.5.0), python-oslotest (>= 1.5.1), python-osprofiler (>= 0.3.0), python-paramiko (>= 1.13.0), python-paste, python-pastedeploy (>= 1.5.0), python-psycopg2, python-pyparsing (>= 2.0.1), python-requests (>= 2.2.0), python-retrying (>= 1.2.3), python-routes (>= 1.12.3), python-setuptools, python-six (>= 1.9.0), python-sqlalchemy (>= 0.9.7), python-stevedore (>= 1.3.0), python-subunit (>= 0.0.18), python-suds (>= 0.4), python-swiftclient (>= 1:2.2.0), python-taskflow (>= 0.7.1), python-tempest-lib (>= 0.4.0), python-testresources (>= 0.2.4), python-testtools (>= 0.9.36), python-webob (>= 1.2.3), testrepository (>= 0.0.18)
Package-List: 
 cinder-api deb net extra
 cinder-backup deb net extra
 cinder-common deb net extra
 cinder-doc deb doc extra
 cinder-scheduler deb net extra
 cinder-volume deb net extra
 python-cinder deb python extra
Checksums-Sha1: 
 214cee5b2b3f8e279d766beaca2055701f34837e 2074907 cinder_2015.1.1.orig.tar.gz
 9fe0700da557a7df7be656229508b3e6bc5511a2 9716 cinder_2015.1.1-1~u14.04+mos3053.debian.tar.gz
Checksums-Sha256: 
 4999288e6b3863299e7c6f6960182d8c1ca8485b9b10345f039ba9eedd89e156 2074907 cinder_2015.1.1.orig.tar.gz
 649a5ac3e4aa5916146f4df0637dc350f8516566b12624ede1879a9edfc24c70 9716 cinder_2015.1.1-1~u14.04+mos3053.debian.tar.gz
Files: 
 17154e4881e3438f6001e14b55cc2dec 2074907 cinder_2015.1.1.orig.tar.gz
 08f90a37c390db3247862e8e6c7118c7 9716 cinder_2015.1.1-1~u14.04+mos3053.debian.tar.gz
Testsuite: autopkgtest
