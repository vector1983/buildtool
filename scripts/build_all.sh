#!/bin/bash
# build nova debian package
# author: huwei

. ./scripts/functions.sh

version=$1
bash ./scripts/build_ceilometer.sh ceilometer $version
bash ./scripts/build_cinder.sh cinder $version
bash ./scripts/build_glance.sh glance $version
bash ./scripts/build_horizon.sh horizon $version
bash ./scripts/build_keystone.sh keystone $version
bash ./scripts/build_neutron.sh neutron $version
bash ./scripts/build_nova.sh nova $version
bash ./scripts/build_ceilometerclient.sh python-ceilometerclient $version
bash ./scripts/build_cinderclient.sh python-cinderclient $version
bash ./scripts/build_glanceclient.sh python-glanceclient $version
bash ./scripts/build_keystoneclient.sh python-keystoneclient $version
bash ./scripts/build_neutronclient.sh python-neutronclient $version
bash ./scripts/build_novaclient.sh python-novaclient $version
bash ./scripts/build_swiftclient.sh python-swiftclient $version




