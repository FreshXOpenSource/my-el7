#!/bin/bash
set -e 

SCRIPTPATH=`echo $(dirname $(readlink -f $0))`
cd "${SCRIPTPATH}"

mkdir upstream output

SRC_ISO="http://ftp.redhat.com/redhat/rhel/beta/7/source/iso/rhel-everything-7.0-beta-1-source-dvd.iso"
BIN_ISO="http://ftp.redhat.com/redhat/rhel/beta/7/x86_64/iso/rhel-everything-7.0-beta-1-x86_64-dvd.iso"

BIN_PATH="${SCRIPTPATH}/upstream/rhel-everything-7.0-beta-1-x86_64-dvd"
SRC_PATH="${SCRIPTPATH}/upstream/rhel-everything-7.0-beta-1-source-dvd"

cp "${SCRIPTPATH}/addons/RPMS/*.rpm" "${SCRIPTPATH}/output/"

cd "${SCRIPTPATH}/upstream"

wget -c "${SRC_ISO}" "${BIN_ISO}"

7z x rhel-everything-7.0-beta-1-source-dvd.iso -o"${SRC_PATH}"
7z x rhel-everything-7.0-beta-1-x86_64-dvd.iso -o"${BIN_PATH}"

cd "${SCRIPTPATH}"

sudo cp epel-7-x86_64.cfg /etc/mock

sudo sed -i 's@RHEL7BETA@'${BIN_PATH}'@' /etc/mock/epel-7-x86_64.cfg
sudo sed -i 's@OUTPUT@'${SCRIPTPATH}'/output@' /etc/mock/epel-7-x86_64.cfg

