#!/bin/bash

cd `dirname $0`
DSTDIR=$1

if [ -z "$DSTDIR" ]
then
    echo "Usage: $0 <sources dir>"
    exit 1
fi

red=$(tput setaf 1) # Red
grn=$(tput setaf 2) # Green
txtrst=$(tput sgr0) # Reset

echo "${grn}Applying nfc patch${txtrst}"
cat patches/1.nfc.patch | patch -d $DSTDIR/packages/apps/Nfc -p1 -N -r -

echo "${grn}Applying camera patch${txtrst}"
cat patches/2.camera.patch | patch -d $DSTDIR/frameworks/base/ -p1 -N -r -

echo "${grn}Applying relocs patch${txtrst}"
cat patches/3.relocs.patch | patch -d $DSTDIR/bionic/ -p1 -N -r -
#cd $DSTDIR

#find . -name '*.orig' -delete

