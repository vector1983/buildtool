Format: 3.0 (quilt)
Source: neutron-vpnaas
Binary: python-neutron-vpnaas, neutron-vpn-agent, neutron-vpnaas-doc
Architecture: all
Version: 1:2015.1.1-1~u14.04+mos653
Maintainer: MOS Neutron Team <mos-neutron@mirantis.com>
Homepage: http://github.com/openstack/neutron-vpnaas
Standards-Version: 3.9.6
Build-Depends: debhelper (>= 9), dh-python, dh-systemd, openstack-pkg-tools (>= 21), python-all (>= 2.7.1)
Build-Depends-Indep: alembic (>= 0.7.2), neutron-common (>= 1:2015.1), python-cliff (>= 1.10.0), python-coverage, python-eventlet (>= 0.16.1), python-fixtures (>= 0.3.14), python-hacking (>= 0.10.0), python-jinja2 (>= 2.6), python-mock (>= 1.0), python-netaddr (>= 0.7.12), python-oslo.config (>= 1:1.9.3), python-oslo.db (>= 1.7.0), python-oslo.log (>= 1.0.0), python-oslo.messaging (>= 1.8.0), python-oslo.middleware (>= 0.1.0), python-oslo.serialization (>= 1.4.0), python-oslosphinx (>= 2.5.0), python-oslo.utils (>= 1.4.0), python-oslotest (>= 1.5.1), python-pbr (>= 0.10), python-requests (>= 2.2.0), python-requests-mock (>= 0.6.0), python-setuptools, python-six (>= 1.9.0), python-sphinx (>= 1.1.2), python-sqlalchemy (>= 0.9.7), python-subunit (>= 0.0.18), python-testscenarios (>= 0.4), python-testtools (>= 0.9.36), python-webob (>= 1.2.3), python-webtest (>= 2.0), testrepository (>= 0.0.18)
Package-List: 
 neutron-vpn-agent deb python optional
 neutron-vpnaas-doc deb doc optional
 python-neutron-vpnaas deb python optional
Checksums-Sha1: 
 960e6ba1630bc49db53cdc2f7ac2fa14f7d0dce6 137339 neutron-vpnaas_2015.1.1.orig.tar.gz
 a164e1460f067092ecc30e92e0eff3dc7ab6f8a5 4114 neutron-vpnaas_2015.1.1-1~u14.04+mos653.debian.tar.gz
Checksums-Sha256: 
 cd0c128064565068713f30cf88d43236f4aab6029ee0a704f89fd918bd06535d 137339 neutron-vpnaas_2015.1.1.orig.tar.gz
 b61f5fb687527ab829184b93435e6f5eb6a03ff9f825d9d4c7fee4d256dd3f92 4114 neutron-vpnaas_2015.1.1-1~u14.04+mos653.debian.tar.gz
Files: 
 d068473360c73e442063b61d555066d8 137339 neutron-vpnaas_2015.1.1.orig.tar.gz
 1e6d6deec2a6544105e8046ba7173411 4114 neutron-vpnaas_2015.1.1-1~u14.04+mos653.debian.tar.gz
