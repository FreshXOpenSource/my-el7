#!/bin/bash

PKG=$1

if [ -z $PKG ]; then
  echo "Usage : $0 <xxx.src.rpm>"
  exit 1
fi

SCRIPTPATH=`echo $(dirname $(readlink -f $0))`
cd "${SCRIPTPATH}"

ADDONS_SRC_PATH="${SCRIPTPATH}/addons/SRPMS"
SRC_PATH="${SCRIPTPATH}/upstream/rhel-everything-7.0-beta-1-source-dvd/Packages"
DST_PATH="${SCRIPTPATH}/output/"

echo Building : $PKG
if [ -f $DST_PATH/`basename $PKG` ]; then
    echo "Package $DST_PATH/$i already exists. Skipping"
else
	cd "${DST_PATH}"
	createrepo . >/dev/null
	mock -D '%rhel 7' -D '%dist .el7' -D '%el7 1' --root=epel-7-x86_64 --resultdir="${DST_PATH}" "${PKG}"
fi
