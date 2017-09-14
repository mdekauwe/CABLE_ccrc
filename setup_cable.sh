#!/bin/bash
#
# Get the CABLE code: check out either the trunk, or a specific tag and make a
# new branch
# -> https://trac.nci.org.au/svn/cable/tags/CABLE-2.3.4/
#
# author: Martin De Kauwe
# date:   11 September 2017
#

root="https://trac.nci.org.au/svn/cable"
user="mgk576"
tag="CABLE-2.3.4"
branch="test"
msg="\"setup test repo\""
cleanup=true
trunk=false

if [ ! .svn ]
then
    rm -rf .svn
fi

if [ "$trunk" = true ]
then
    svn copy $root/trunk $root/branches/Users/$user/$tag"_trunk" -m "$msg"
    svn checkout $root/branches/Users/$user/$tag"_trunk" $tag"_trunk"
else
    svn copy $root/tags/$tag $root/branches/Users/$user/$tag"_"$branch -m "$msg"
    svn checkout $root/branches/Users/$user/$tag"_"$branch $tag"_"$branch
fi

if [ ! -d "../CABLE-AUX" ]
then
    svn checkout $root/branches/Share/CABLE-AUX CABLE-AUX
    if [ "$cleanup" = true ]
    then
        mv CABLE-AUX ../.
    fi
fi
