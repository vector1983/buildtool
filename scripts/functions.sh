#!/bin/bash
# builddebpackage.sh: used for the thinkstack debian package build
# author: huwei
# date: 2016-08-15

# help information
display_help() {
	cat << eof
Usage: $0 {component_name}

The component name should be one of the following items:
ceilometer|cinder|glance|horizon|keystone|neutron|nova|python-ceilometerclient| \
pythone-cinderclient|python-glanceclient|python-keystoneclient|python-neutronclient| \
python-novaclient|python-swiftclient|all
eof
	exit
}

# log error and exit
log_error_and_exit() {
	echo -e "\033[41;37mError:\033[0m $1" && exit
}

# check the required directories
check_dirs() {
    [[ -d ./main ]] || log_error_and_exit "please copy the mirrantis update main directory in the same directory firstly"
 	[[ -d ./ThinkStackU ]] || log_error_and_exit "please git clone the ThinkStackU project firstly"
}

# prepare the build/stage directory
prepare() {
 	component=$1
 	[[ -d "./build/$1" ]] || mkdir -p "./build/$1"
 	[[ -d "./stage/$1" ]] || mkdir -p "./stage/$1"
}

# get the first char of component
get_1st_char_of_component() {
	component=$1
	echo ${component:0:1}
}

# unpack all debian packages for specific component
unpack() {
	component=$1
	# get the first char, for example, n in main/n/nova
	firstchr=`get_1st_char_of_component $component`

	# check if the compoent directory
	debdir=./main/$firstchr/$component
	[[ -d $debdir ]] || log_error_and_exit "$debdir not exists"

	for debfile in `ls $debdir/*.deb`
	do
		# get directory name to be created, like python-nova_2015.1.1-1~u14.04+mos19664
		# get the python-nova as directory and create it
		dirname=`echo $debfile | awk -F "/" '{print $5}' | awk -F "." '{print $1}' | awk -F "_" '{print $1}'`
    	stagedir=./stage/$component/$dirname
    	rm -rf $stagedir
    	mkdir $stagedir

    	# unpack mirrantis debian package to get the data and control files
    	dpkg-deb -R $debfile $stagedir
	done

	# special handling for horizon since the openstack_auth is located at /main/p
	if [[ $component = "horizon" ]]; then
		stagedir=./stage/horizon/python-openstack-auth
		rm -rf $stagedir
		mkdir $stagedir

		debfile=`find ./main -name "*openstack-auth*.deb"`
		dpkg-deb -R $debfile $stagedir
	fi
}

# copy thinkstack component source code to override the mirrantis one
copy_source_code() {
	component=$1
	
	for dirname in `ls ./stage/$component`
	do
		# get the code directory
    	codedir=`find ./stage/$component/$dirname -type d -name "dist-packages"`

    	if [ $? -eq 0 -a -d "$codedir" ];then
    		#echo "testing: $codedir"
    		# copy our code to override the mirrantis code
            # for client,./ThinkStackU/python-cinderclient/cinderclient
            # for nova, ./ThinkStackU/nova/nova
            if echo $component|grep -q python;then
                cp -r ./ThinkStackU/$component/${component:7} $codedir
            elif [[ $dirname = "python-openstack-auth" ]];then  ## special handling for horizon openstack auth
                cp -r ./ThinkStackU/$component/openstack_auth $codedir
            else
    		    cp -r ./ThinkStackU/$component/$component $codedir
            fi

            # modify the directory mode to 755
    		find ./$codedir -type d | xargs chmod 755

			# modify the files mode to 644
			find ./$codedir -type f | xargs chmod 644

			# modify the shell script mode to 755
			for shfile in `find ./$codedir -type f -name "*.sh"` 
            do
                chmod 755 $shfile
            done
        fi
	done
}
# copy thinkstack policy file to override the mirrantis one
copy_policy_file() {
	component=$1
	policyfile=`find ./stage/$component -type f -name "policy.json"`
	newpolicyfile=`find ./ThinkStackU/$component -name "policy.json"`

	if [[ -f $policyfile && -f $newpolicyfile ]]; then
		cp $newpolicyfile $policyfile
	fi

} 

# copy the thinkstack config file 
copy_config_files() {
	component=$1
    # most cases: the etc config files is locate in deb ${component}-common deb package
    # rare cases: keystone, the config files is locate in keystone deb package, not keystone-common package
	if [[ -d ./ThinkStackU/$component/etc ]]; then
		if [[ -d ./stage/$component/${component}-common/etc/$component ]]; then
            # special handling for neutron, ./ThinkStackU/neutron/etc has a directory neutron, need to omit it, will handle the ml2 config in build_neutron.sh
            # ! -name "*ml2_conf*": fix the bug for neutron, shouldn't copy the ml2_conf.ini to /etc/neutron
            find ./ThinkStackU/$component/etc -type f ! -name "*ml2_conf*" -exec cp {} ./stage/$component/${component}-common/etc/$component/ \;
		else
            # special handling for neutron, ./ThinkStackU/neutron/etc has a directory neutron, need to omit it, will handle the ml2 config in build_neutron.sh
            find ./ThinkStackU/$component/etc -type f -exec cp {} ./stage/$component/$component/etc/$component/ \;
		fi
	fi
}

# generate the md5sums file
gen_md5sums_file() {

	component=$1
	currentpath=`pwd`
	for dirname in `ls ./stage/$component`
	do
		cd ./stage/$component/$dirname
		if [[ -d ./DEBIAN ]] && [[ -d ./usr ]]; then
			find usr -type f | xargs md5sum >./DEBIAN/md5sums
		else
			log_error_and_exit "please check the ./stage/$component/$dirname why no DEBIAN control file exists"
		fi
		cd $currentpath
	done
}

# modify version info in control file
modify_control_version(){
	
	component=$1
	version=$2
	# modify the version in the control file
	for controlfile in `find ./stage/$component -name "control"`
	do
		sed -i "s/^Version:.*$/Version: 1:$version/g" $controlfile		
	done
}

# modify the dependencies in control file
modify_control_depends() {

	component=$1
	version=$2
    # check and modify the dependencies 
    for dir in `ls ./stage/$component`
    do 
    	for controlfile in `find ./stage/$component -name "control"`
    	do
    		sed -i "s/$dir (= [^()]*)/$dir (= 1:$version)/g" $controlfile
    	done
	done
}
# modify version info in control file based on version inputed
modify_control_file() {
	component=$1
	version=$2

	modify_control_version $component $version
	modify_control_depends $component $version
}

# build debian package
build_deb() {
	component=$1
	version=$2

	# build the debian package
	for dir in `ls ./stage/$component`
	do
		debianname="${dir}_${version}_all.deb"
		fakeroot dpkg -b ./stage/$component/$dir ./build/$component/$debianname
		chmod 755 ./build/$component/$debianname
	done
}

build() {
	component=$1
	version=$2

	# s1: prepare build/stage
	prepare $component

	# s2: unpack mirrantis debian package to get the control and data file
	unpack $component

	# s3: copy source code to override
	copy_source_code $component

	# s4: copy policy file
	copy_policy_file $component

	# s5: generate md5sums file
	gen_md5sums_file $component

	# s6: modify control file
	modify_control_file  $component $version

	# s7: build debian package
	build_deb $component $version
}


# copy source code for openstack dashboard(special handling for horizon)
copy_dashboard_code() {
	sourcedir=./ThinkStackU/horizon/openstack_dashboard
	stagedir=./stage/horizon/openstack-dashboard/usr/share/openstack-dashboard
	if [[ -d $sourcedir ]] && [[ -d $stagedir ]]; then
		 cp -rf $sourcedir $stagedir/ >/dev/null 2>&1 #ignore the error which syslink cannot be overrided(js/css syslink file)
	fi
}

# special handling for neutron, need to copy ml2 config file
copy_ml2_config() {
    cp ./ThinkStackU/neutron/etc/neutron/plugins/ml2/* ./stage/neutron/neutron-plugin-ml2/etc/neutron/plugins/ml2/
}

# prepare nova
# unpack nova
# copy_source_code nova
# copy_policy_file nova
# gen_md5sums_file nova
# #modify_control_version nova 2016.1.1-1~u14.04+tos19999
# modify_control_file nova 2016.1.1-1~u14.04+tos19999
# build_deb nova 2016.1.1-1~u14.04+tos19999

