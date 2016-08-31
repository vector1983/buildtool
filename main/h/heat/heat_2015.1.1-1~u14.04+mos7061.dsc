Format: 3.0 (quilt)
Source: heat
Binary: heat-api-cloudwatch, heat-api-cfn, python-heat, heat-api, heat-docker, heat-engine, heat-common, heat-doc
Architecture: all
Version: 2015.1.1-1~u14.04+mos7061
Maintainer: MOS Heat Team <mos-heat@mirantis.com>
Homepage: http://wiki.openstack.org/Heat
Standards-Version: 3.9.6
Build-Depends: debhelper (>= 9), dh-python, dh-systemd, openstack-pkg-tools (>= 21), python-all (>= 2.7.1), python-pbr (>= 0.10), python-sphinx (>= 1.1.2)
Build-Depends-Indep: python-alembic, python-babel (>= 1.3), python-boto (>= 2.32.1), python-ceilometerclient (>= 1.0.13), python-cinderclient (>= 1:1.1.0), python-coverage (>= 3.6), python-crypto (>= 2.6), python-eventlet (>= 0.16.1), python-extras, python-glanceclient (>= 1:0.15.0), python-greenlet (>= 0.3.2), python-hacking (>= 0.10.0), python-heatclient (>= 0.3.0), python-httplib2 (>= 0.7.5), python-iso8601 (>= 0.1.9), python-keystoneclient (>= 1:1.1.0), python-keystonemiddleware (>= 1.5.0), python-kombu (>= 2.5.0), python-lockfile (>= 1:0.8), python-lxml (>= 2.3), python-memcache (>= 1.48), python-migrate (>= 0.9.5), python-mock (>= 1.0), python-mox (>= 0.5.3), python-mysqldb, python-netaddr (>= 0.7.12), python-neutronclient (>= 1:2.3.11), python-novaclient (>= 1:2.22.0), python-oslo.concurrency (>= 1.8.0), python-oslo.config (>= 1:1.9.3), python-oslo.context (>= 0.2.0), python-oslo.db (>= 1.7.0), python-oslo.i18n (>= 1.5.0), python-oslo.log (>= 1.0.0), python-oslo.messaging (>= 1.8.0), python-oslo.middleware (>= 1.0.0), python-oslo.serialization (>= 1.4.0), python-oslo.utils (>= 1.4.0), python-oslosphinx (>= 2.5.0), python-oslo.versionedobjects (>= 0.1.1), python-oslotest (>= 1.5.1), python-osprofiler (>= 0.3.0), python-paramiko (>= 1.13.0), python-paste, python-pastedeploy (>= 1.5.0), python-posix-ipc, python-psycopg2, python-requests (>= 2.2.0), python-routes (>= 1.12.3), python-saharaclient (>= 0.8.0), python-setuptools, python-six (>= 1.9.0), python-sqlalchemy (>= 0.9.7), python-stevedore (>= 1.3.0), python-swiftclient (>= 1:2.2.0), python-testrepository (>= 0.0.18), python-testscenarios (>= 0.4), python-testtools (>= 0.9.36), python-troveclient (>= 1:1.0.7), python-webob (>= 1.2.3), python-yaml (>= 3.1.0), subunit, testrepository (>= 0.0.18)
Package-List: 
 heat-api deb web optional
 heat-api-cfn deb web optional
 heat-api-cloudwatch deb web optional
 heat-common deb web optional
 heat-doc deb doc optional
 heat-docker deb web optional
 heat-engine deb web optional
 python-heat deb python optional
Checksums-Sha1: 
 2c5635c8a80c4d0e7c99148569598c9fbed83c3f 1074206 heat_2015.1.1.orig.tar.gz
 0712b212e06f9b3bf6cd48916f31cd483b366706 8011 heat_2015.1.1-1~u14.04+mos7061.debian.tar.gz
Checksums-Sha256: 
 f59381bf91fa97808280dabc6534e500200ab6c62d2bff95c6e26d94e3407787 1074206 heat_2015.1.1.orig.tar.gz
 ee657e328c35a1991b539b39250d98b526cd0cd08b5c8eac7c99b12bfb52d05a 8011 heat_2015.1.1-1~u14.04+mos7061.debian.tar.gz
Files: 
 8a563212e84849847430d42c864beb9f 1074206 heat_2015.1.1.orig.tar.gz
 0040c600f6f409cf8eb34187104705fc 8011 heat_2015.1.1-1~u14.04+mos7061.debian.tar.gz
Testsuite: autopkgtest
