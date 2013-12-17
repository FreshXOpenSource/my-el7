#!/bin/bash
SCRIPTPATH=`echo $(dirname $(readlink -f $0))`
cd "${SCRIPTPATH}"

ADDONS_SRC_PATH="${SCRIPTPATH}/addons/SRPMS/"
SRC_PATH="${SCRIPTPATH}/upstream/rhel-everything-7.0-beta-1-source-dvd/Packages/"
DST_PATH="${SCRIPTPATH}/output/"

ADDONS_SRC_COUNT=`ls -1 "${ADDONS_SRC_PATH}"/*.src.rpm| wc -l`
SRC_COUNT=`ls -1 "${SRC_PATH}"/*.src.rpm| wc -l`
DST_COUNT=`ls -1 "${DST_PATH}"/*.src.rpm| wc -l`

echo "Number of addon SRPMS: ${ADDONS_SRC_COUNT}"
echo "Number of upstream SRPMS: ${SRC_COUNT}"
echo "Number of rebuilt  SRPMS: ${DST_COUNT}"

echo "Percentage done: $(( 100/(${ADDONS_SRC_COUNT}+${SRC_COUNT})*${DST_COUNT} ))"
