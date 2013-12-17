#!/bin/bash
SCRIPTPATH=`echo $(dirname $(readlink -f $0))`
cd "${SCRIPTPATH}"

ADDONS_SRC_PATH="${SCRIPTPATH}/addons/SRPMS"
SRC_PATH="${SCRIPTPATH}/upstream/rhel-everything-7.0-beta-1-source-dvd/Packages"
DST_PATH="${SCRIPTPATH}/output/"

for PKG in "${ADDONS_SRC_PATH}"/*.src.rpm "${SRC_PATH}"/*.src.rpm
do
    cd "${DST_PATH}"
    createrepo .
    mock -D '%rhel 7' -D '%dist .el7' -D '%el7 1' --root=epel-7-x86_64 --resultdir="${DST_PATH}" "${PKG}"

done
