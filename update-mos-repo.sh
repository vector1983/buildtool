#! /bin/sh
# author: huwei
# date: 2016-08-03

# work directory
workdir=`pwd`

# repo directory
repodir=/var/www/nailgun/mos-repos/ubuntu/7.0
cd ${repodir}

# create the package index
dpkg-scanpackages pool/main > ${workdir}/Packages
chmod 755 ${workdir}/Packages
cd ${workdir}

cat Packages | gzip -9c > Packages.gz
#cat Packages | bzip2 > Packages.bz2 
chmod 755 Packages.gz


# move the package index files to repos
mv Packages ${repodir}/dists/mos7.0-updates/main/binary-amd64
mv Packages.gz ${repodir}/dists/mos7.0-updates/main/binary-amd64
#mv Packages.bz2 ${repodir}/dists/mos7.0-updates/main/binary-amd64
cd ${repodir}/dists/mos7.0-updates

# get all filelist required by Release
filelists=$(find ./ -type f | grep -E 'Packages|Sources|/\Release' | grep -v '\.\/Release' | sed 's/\.\///' | grep -v total)
types="MD5Sum SHA1 SHA256"

# create the release file
cat <<EOF > ${workdir}/Release
Origin: Mirantis
Label: mos7.0
Suite: mos7.0-updates
Codename: mos7.0
Date: Mon, 16 Nov 2015 13:06:52 UTC
Architectures: amd64 i386
Components: main restricted
EOF

for type in $types
do
	echo ${type}: >> ${workdir}/Release
	for file in $filelists
	do
		case $type in
			MD5Sum) echo ""  $(md5sum $file | cut -d" " -f1) $(wc -c $file) >> ${workdir}/Release;;
			SHA1) echo "" $(sha1sum $file | cut -d" " -f1) $(wc -c $file) >> ${workdir}/Release;;
			SHA256) echo "" $(sha256sum $file | cut -d" " -f1) $(wc -c $file) >> ${workdir}/Release;;
			*) ;;
		esac 
	done
done

mv ${workdir}/Release ${repodir}/dists/mos7.0-updates
chmod 755 ${repodir}/dists/mos7.0-updates/Release
echo "repository indexes update done!"
