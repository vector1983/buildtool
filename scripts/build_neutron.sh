#!/bin/bash
# build nova debian package
# author: huwei

. ./scripts/functions.sh


component=$1
version=$2

check_dirs

# s1: prepare build/stage
prepare $component

# s2: unpack mirrantis debian package to get the control and data file
unpack $component

# s3: copy source code to override
copy_source_code $component

# s4: copy config file
copy_config_files $component

# s5: copy ml2 config file
#copy_ml2_config $component

# s6: generate md5sums file
gen_md5sums_file $component

# s7: modify control file
modify_control_file $component $version

# s8: build debian package
build_deb $component $version




