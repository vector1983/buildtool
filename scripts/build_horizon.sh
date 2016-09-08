#!/bin/bash
# build nova debian package
# author: huwei

. ./scripts/functions.sh

component=$1
version=$2

check_dirs

# s1: prepare build/stage
prepare $component

# s2: copy files to stage
copy_component_files $component

# s3: prepare deb dir
prepare_horizon

# s4: generate md5sums file
gen_md5sums_file $component

# s5: modify control file
modify_control_file $component $version

# s6: build debian package
build_deb $component $version




