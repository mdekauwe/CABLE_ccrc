#!/bin/bash
#
# Edit the Makefile so that this compiles whatever machine we are on.
# There are three stages to this...
#
# author: Martin De Kauwe
# date: 24th July 2018
#

fname=build.ksh
repo_name="CMIP6-MOSRS"
HOST_MACH=`uname -n | cut -c 1-4`
ARCH=$(uname -s)

if [ $ARCH == "Linux" ]
then
    #module add intel-fc/15.0.3.187
    #module add netcdf/4.3.0
    SED=sed
    #nc_path="/usr/local/netcdf/intel/4.3.0"
    fc="ifort"
else
    nc_path="/opt/local"
    fc="gfortran"
    SED=gsed
fi

cd $repo_name/offline

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
./build.ksh
cd ../../
