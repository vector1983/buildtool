#!/bin/bash
# builddebpackage.sh: used for the thinkstack debian package build
# author: huwei
# date: 2016-08-15

set -e

. scripts/functions.sh

# mismatch and exit
[[ $# -lt 2 ]] && display_help

# get version and components
version=$1
shift
components=$@

echo -e "\033[42;37m**************deian package build start********************\033[0m"
# build debian package for each component
for component in $components; do
	echo "----start to build debian packages for ${component}----"
	case $component in
		ceilometer )
			bash ./scripts/build_ceilometer.sh ceilometer $version
			;;
		cinder )
			bash ./scripts/build_cinder.sh cinder $version
			;;
		glance )
			bash ./scripts/build_glance.sh glance $version
			;;
		horizon )
			bash ./scripts/build_horizon.sh horizon $version
			;;
		keystone )
			bash ./scripts/build_keystone.sh keystone $version
			;;
		neutron )
			bash ./scripts/build_neutron.sh neutron $version
			;;
		nova )
			bash ./scripts/build_nova.sh nova $version
			;;
        django_openstack_auth)
            bash ./scripts/build_django_openstack_auth.sh django_openstack_auth $version
            ;;
		python-ceilometerclient )
			bash ./scripts/build_ceilometerclient.sh python-ceilometerclient $version
			;;
		python-cinderclient )
			bash ./scripts/build_cinderclient.sh python-cinderclient $version
			;;
		python-glanceclient )
			bash ./scripts/build_glanceclient.sh python-glanceclient $version
			;;
		python-keystoneclient )
			bash ./scripts/build_keystoneclient.sh python-keystoneclient $version
			;;
		python-neutronclient )
			bash ./scripts/build_neutronclient.sh python-neutronclient $version
			;;
		python-novaclient )
			bash ./scripts/build_novaclient.sh python-novaclient $version
			;;
		python-swiftclient )
			bash ./scripts/build_swiftclient.sh python-swiftclient $version
			;;
		all )
			bash ./scripts/build_all.sh $version
			;;
		* )
			display_help
			;;
	esac
done
echo -e "\033[42;37m**************deian package build finished********************\033[0m"
