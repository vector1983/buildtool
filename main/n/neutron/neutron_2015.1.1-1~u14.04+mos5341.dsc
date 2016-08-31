Format: 3.0 (quilt)
Source: neutron
Binary: neutron-server, neutron-common, neutron-plugin-cisco, neutron-plugin-nec, neutron-plugin-nec-agent, neutron-plugin-bigswitch, neutron-plugin-bigswitch-agent, neutron-plugin-brocade, neutron-plugin-plumgrid, neutron-plugin-metaplugin, neutron-plugin-vmware, neutron-plugin-nicira, neutron-l3-agent, neutron-dhcp-agent, neutron-metadata-agent, python-neutron, neutron-plugin-openvswitch, neutron-plugin-ml2, neutron-plugin-openvswitch-agent, neutron-plugin-linuxbridge, neutron-plugin-linuxbridge-agent, neutron-plugin-midonet, neutron-plugin-mlnx, neutron-plugin-mlnx-agent, neutron-metering-agent, neutron-plugin-metering-agent, neutron-plugin-ibm, neutron-plugin-ibm-agent, neutron-plugin-sriov-agent, neutron-plugin-oneconvergence, neutron-plugin-oneconvergence-agent, neutron-plugin-nuage, neutron-plugin-opencontrail, neutron-doc
Architecture: all
Version: 1:2015.1.1-1~u14.04+mos5341
Maintainer: MOS Neutron Team <mos-neutron@mirantis.com>
Standards-Version: 3.9.6
Build-Depends: debhelper (>= 9), dh-python, python-all (>= 2.7.1), python-sphinx (>= 1.1.2), openstack-pkg-tools (>= 23~), python-pbr, python-setuptools
Build-Depends-Indep: alembic (>= 0.7.2), python-cliff (>= 1.10.0), python-coverage (>= 3.6), python-eventlet (>= 0.16.1), python-fixtures (>= 0.3.14), python-greenlet (>= 0.3.2), python-hacking (>= 0.10.0), python-httplib2 (>= 0.7.5), python-jinja2 (>= 2.6), python-jsonrpclib, python-keystoneclient (>= 1:1.2.0), python-keystonemiddleware (>= 1.5.0), python-mock (>= 1.0), python-mysqldb, python-netaddr (>= 0.7.12), python-neutronclient (>= 1:2.4.0), python-novaclient (>= 1:2.22.0), python-oslo.concurrency (>= 1.8.0), python-oslo.config (>= 1:1.9.3), python-oslo.context (>= 0.2.0), python-oslo.db (>= 1.7.0), python-oslo.i18n (>= 1.5.0), python-oslo.log (>= 1.0.0), python-oslo.messaging (>= 1.8.0), python-oslo.middleware (>= 1.0.0), python-oslo.rootwrap (>= 1.6.0), python-oslo.serialization (>= 1.4.0), python-oslo.utils (>= 1.4.0), python-oslosphinx (>= 2.5.0), python-oslotest (>= 1.5.1), python-gflags, python-paste, python-pastedeploy (>= 1.5.0), python-pbr (>= 0.10), python-psycopg2, python-pyudev, python-requests (>= 2.2.0), python-requests-mock (>= 0.6.0), python-retrying (>= 1.2.3), python-routes (>= 1.12.3), python-setuptools, python-six (>= 1.9.0), python-sphinx (>= 1.1.2), python-sqlalchemy (>= 0.9.7), python-stevedore (>= 1.3.0), python-tempest-lib (>= 0.4.0), python-testscenarios (>= 0.4), python-testtools (>= 0.9.36), python-webob (>= 1.2.3), subunit
Package-List: 
 neutron-common deb net optional
 neutron-dhcp-agent deb net optional
 neutron-doc deb doc optional
 neutron-l3-agent deb net optional
 neutron-metadata-agent deb net optional
 neutron-metering-agent deb net optional
 neutron-plugin-bigswitch deb net optional
 neutron-plugin-bigswitch-agent deb net optional
 neutron-plugin-brocade deb net optional
 neutron-plugin-cisco deb net optional
 neutron-plugin-ibm deb net optional
 neutron-plugin-ibm-agent deb net optional
 neutron-plugin-linuxbridge deb oldlibs extra
 neutron-plugin-linuxbridge-agent deb net optional
 neutron-plugin-metaplugin deb net optional
 neutron-plugin-metering-agent deb net optional
 neutron-plugin-midonet deb net optional
 neutron-plugin-ml2 deb net optional
 neutron-plugin-mlnx deb net optional
 neutron-plugin-mlnx-agent deb net optional
 neutron-plugin-nec deb net optional
 neutron-plugin-nec-agent deb net optional
 neutron-plugin-nicira deb oldlibs optional
 neutron-plugin-nuage deb net optional
 neutron-plugin-oneconvergence deb net optional
 neutron-plugin-oneconvergence-agent deb net optional
 neutron-plugin-opencontrail deb net optional
 neutron-plugin-openvswitch deb oldlibs extra
 neutron-plugin-openvswitch-agent deb net optional
 neutron-plugin-plumgrid deb net optional
 neutron-plugin-sriov-agent deb net optional
 neutron-plugin-vmware deb net optional
 neutron-server deb net optional
 python-neutron deb python optional
Checksums-Sha1: 
 7596e94777dcc2878fbc4d3206d0360f42c5228b 2072437 neutron_2015.1.1.orig.tar.gz
 51893c5fcecc4ccfddcaf7a4ac2a9c7be55bd245 13238 neutron_2015.1.1-1~u14.04+mos5341.debian.tar.gz
Checksums-Sha256: 
 3872f2d2703ad4f427db5c6c44cb0b6a182a882afa5d480d99e99e8c9cb9e6f0 2072437 neutron_2015.1.1.orig.tar.gz
 b6693358eb3c684b7e30f76a8d7684df937fa128dc4231b4080762987412a13a 13238 neutron_2015.1.1-1~u14.04+mos5341.debian.tar.gz
Files: 
 c1f2bc1bde7511aae5689d7482b05607 2072437 neutron_2015.1.1.orig.tar.gz
 98fe169713032019bc65877636e1f37e 13238 neutron_2015.1.1-1~u14.04+mos5341.debian.tar.gz
Testsuite: autopkgtest
