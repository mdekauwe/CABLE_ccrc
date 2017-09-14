#!/bin/bash
#
# Edit the Makefile so that this compiles whatever machine we are on.
# There are three stages to this...
#
# author: Martin De Kauwe
# date:   11 September 2017
#

fname=build.ksh
tag=CABLE-2.3.4
branch="tag"
HOST_MACH=`uname -n | cut -c 1-4`
ARCH=$(uname -s)

if [ $ARCH == "Linux" ]
then
    module add intel/15.0.3.187
    module add netcdf/4.2.1-intel
    SED=sed
    nc_path="/usr/local/netcdf/intel/4.1.3"
    fc="ifort"
else
    nc_path="/opt/local"
    fc="gfortran"
    SED=gsed
fi

cd $tag"_"$branch/offline

# you may want to uncomment this if you believe in safety
#cp $fname "backup_"build.ksh

# Step 1
gawk -v var="$HOST_MACH" '/   set/ {$0=$0" "var} 1' $fname > x.tmp
mv x.tmp $fname

# Step 2
$SED -i "8i\\
host_$HOST_MACH(){\\
    export NCDIR='$nc_path/lib/'\\
    export NCMOD='$nc_path/include/'\\
    export FC=$fc\\
    export CFLAGS='-O2'\\
    export LD='-lnetcdf -lnetcdff'\\
    export LDFLAGS='-L$nc_path/lib -O2'\\
    build_build\\
    cd ../\\
    build_status\\
}\\
" $fname

# Step 3
chmod +x build.ksh
