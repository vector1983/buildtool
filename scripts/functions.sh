#!/bin/bash
# builddebpackage.sh: used for the thinkstack debian package build
# author: huwei
# date: 2016-08-15

# help information
display_help() {
	cat << eof
    Usage: $0 {version} {component_name(s)|all}

The component name should be one of the following items:
ceilometer|cinder|glance|horizon|keystone|neutron|nova|django_openstack_auth|python-ceilometerclient| \
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
 	[[ -d ./ThinkStackU ]] || mkdir ./ThinkStackU
}

# prepare the build/stage directory
prepare() {
 	component=$1
 	[[ -d "./build/$1" ]] || mkdir -p "./build/$1"
 	#[[ -d "./stage/$1" ]] || mkdir -p "./stage/$1"
}

# copy component files to stage dir
copy_component_files() {
    component=$1
    [[ -d "./ThinkStackU/$component" ]] || log_error_and_exit "please git clone the project $component into ThinkStackU firstly!"
    [[ -d "./stage" ]] || mkdir ./stage
    [[ -d "./stage/$component" ]] && rm -rf ./stage/$component
    cp -rf ./ThinkStackU/$component ./stage/
    # remove .ignore file
    find ./stage -name ".ignore" -exec rm {} \;
}

restore_deb_dir () {
    workdir=$1
    distdir=$2
    docdir=$3

    [[ -d $docdir ]] || mkdir -p $docdir
    [[ -d $distdir ]] || mkdir -p $distdir

    # gzip the changelog.debian and changelog, copy them to doc dir
    [[ -f ${workdir}/changelog ]] && gzip ${workdir}/changelog && mv ${workdir}/changelog.gz $docdir
    [[ -f ${workdir}/ChangeLog ]] && gzip ${workdir}/ChangeLog && mv ${workdir}/ChangeLog.gz $docdir
    [[ -f ${workdir}/changelog.Debian ]] && gzip ${workdir}/changelog.Debian && mv ${workdir}/changelog.Debian.gz $docdir
    [[ -f ${workdir}/copyright ]] && mv ${workdir}/copyright $docdir

    # handle apport and locale for nova
    [[ -d ${workdir}/apport ]] && mv ${workdir}/apport ${workdir}/usr/share
    [[ -d ${workdir}/locale ]] && mv ${workdir}/locale ${workdir}/usr/share

    # move the $component and egg_info into dist-packages
    # #*-: handle the python-ceilometerclient and get ceilometerclient
    if [[ $component = "django_openstack_auth" ]]; then
        mv ${workdir}/openstack_auth $distdir
    else
        mv ${workdir}/${component#*-} $distdir
    fi
    mv ${workdir}/*.egg-info $distdir

    # modify the directory mode to 755
    find ./$distdir -type d | xargs chmod 755

    # modify the files mode to 644
    find ./$distdir -type f | xargs chmod 644

    # modify the shell script mode to 755
    for shfile in `find ./$distdir -type f -name "*.sh"` 
    do
        chmod 755 $shfile
    done
}
# prepare the python-${component} packaging dir
prepare_python_component() {
    component=$1
    # client include python
    if [[ $component =~ "python" ]];then
        workdir=./stage/${component}/${component}
        docdir=${workdir}/usr/share/doc/${component}
    else
        workdir=./stage/${component}/python-${component}
        docdir=${workdir}/usr/share/doc/python-${component}
    fi
    distdir=${workdir}/usr/lib/python2.7/dist-packages

    restore_deb_dir $workdir $distdir $docdir
}

prepare_horizon_component() {
    workdir=./stage/horizon/python-django-horizon
    distdir=${workdir}/usr/lib/python2.7/dist-packages
    docdir=${workdir}/usr/share/doc/python-django-horizon

    restore_deb_dir $workdir $distdir $docdir

}

prepare_dashboard_component() {
    workdir=./stage/horizon/openstack-dashboard
    mv ${workdir}/openstack_dashboard ${workdir}/usr/share/openstack-dashboard
}

prepare_horizon() {
    prepare_horizon_component
    prepare_dashboard_component
}

prepare_openstack_auth() {
    workdir=./stage/django_openstack_auth/python-openstack-auth
    distdir=${workdir}/usr/lib/python2.7/dist-packages/
    docdir=${workdir}/usr/share/doc/python-openstack-auth

    restore_deb_dir $workdir $distdir $docdir
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
    	mkdir -p $stagedir

    	# unpack mirrantis debian package to get the data and control files
    	dpkg-deb -R $debfile $stagedir
	done

	# special handling for horizon since the openstack_auth is located at /main/p
	if [[ $component = "horizon" ]]; then
		stagedir=./stage/horizon/python-openstack-auth
		rm -rf $stagedir
		mkdir -p $stagedir

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
	for dirname in `ls ./stage/$component | grep -v bugchange`
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
	for dir in `ls ./stage/$component | grep -v bugchange`
	do
		debianname="${dir}_${version}_all.deb"
		fakeroot dpkg -b ./stage/$component/$dir ./build/$component/$debianname
		chmod 755 ./build/$component/$debianname
	done
}

build() {
	component=$1
	version=$2
    
    # s1: prepare dir
    prepare $component

    # s2: copy files to stage
    copy_component_files $component

    # s3: prepare deb dir
    case $component in
        horizon)
            prepare_horizon
            ;;
        django_openstack_auth)
            prepare_openstack_auth
            ;;
        *)
            prepare_python_component
    esac

	# s4: generate md5sums file
	gen_md5sums_file $component

	# s5: modify control file
	modify_control_file  $component $version

	# s6: build debian package
	build_deb $component $version
}

#prepare $1
#copy_component_files $1
#prepare_python_component $1
#gen_md5sums_file $1
#modify_control_file $1 2016.1.1~u14.04+tos199999
#build_deb $1 2016.1.1~u14.04+tos199999
#build $1 2016.1.1~u14.04+tos199999
