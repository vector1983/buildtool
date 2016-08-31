Format: 3.0 (quilt)
Source: neutron-lbaas
Binary: python-neutron-lbaas, neutron-lbaas-agent, neutron-lbaas-doc
Architecture: all
Version: 1:2015.1.1-1~u14.04+mos739
Maintainer: MOS Neutron Team <mos-neutron@mirantis.com>
Homepage: http://github.com/openstack/neutron-lbaas
Standards-Version: 3.9.6
Build-Depends: debhelper (>= 9), dh-python, dh-systemd, openstack-pkg-tools (>= 21), python-all (>= 2.7.1)
Build-Depends-Indep: alembic (>= 0.7.2), neutron-common (>= 1:2015.1), python-barbicanclient (>= 3.0.1), python-cliff (>= 1.10.0), python-coverage, python-eventlet (>= 0.16.1), python-fixtures (>= 0.3.14), python-greenlet (>= 0.3.2), python-hacking (>= 0.10.0), python-mock (>= 1.0), python-netaddr (>= 0.7.12), python-novaclient (>= 1:2.22.0), python-openssl (>= 0.11), python-oslo.config (>= 1:1.9.3), python-oslo.db (>= 1.7.0), python-oslo.log (>= 1.0.0), python-oslo.messaging (>= 1.8.0), python-oslo.rootwrap (>= 1.6.0), python-oslo.serialization (>= 1.4.0), python-oslosphinx (>= 2.5.0), python-oslo.utils (>= 1.4.0), python-oslotest (>= 1.5.1), python-pbr (>= 0.10), python-pyasn1, python-pyasn1-modules, python-requests (>= 2.2.0), python-requests-mock (>= 0.6.0), python-setuptools, python-six (>= 1.9.0), python-sphinx (>= 1.1.2), python-sqlalchemy (>= 0.9.7), python-stevedore (>= 1.3.0), python-subunit (>= 0.0.18), python-testscenarios (>= 0.4), python-testtools (>= 0.9.36), python-webob (>= 1.2.3), python-webtest (>= 2.0), testrepository (>= 0.0.18)
Package-List: 
 neutron-lbaas-agent deb python optional
 neutron-lbaas-doc deb doc optional
 python-neutron-lbaas deb python optional
Checksums-Sha1: 
 24dbdc8469b2510cbbf3ba2b79fe2d0603eea68b 278654 neutron-lbaas_2015.1.1.orig.tar.gz
 e05bf1ff1edfe93dc6a9533733bcf1988cac7b00 4534 neutron-lbaas_2015.1.1-1~u14.04+mos739.debian.tar.gz
Checksums-Sha256: 
 c92721fa804feacd9ca07c76e29a03482d323a5ff9500f05502604ab4f3ff203 278654 neutron-lbaas_2015.1.1.orig.tar.gz
 3fe0aa4f7e593bc055bd334e3ac9ab6c0fd4a39c07e43773fa78074325dfec3c 4534 neutron-lbaas_2015.1.1-1~u14.04+mos739.debian.tar.gz
Files: 
 cb8325fd18ab30a987419c47dce9a867 278654 neutron-lbaas_2015.1.1.orig.tar.gz
 160b0a931dea21ecbc0230544886488f 4534 neutron-lbaas_2015.1.1-1~u14.04+mos739.debian.tar.gz
