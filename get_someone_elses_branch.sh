#!/bin/bash
#
# Get someone else's branch and set CABLE up to run from this
#
# author: Martin De Kauwe
# date:   11 September 2017
#

root="https://trac.nci.org.au/svn/cable"
user="mgk576"
other_user="mrd561"
their_branch="CMIP6-GM2"
tag="CABLE-CMIP6-GM2"
branch="test"
msg="\"setup test repo\""

if [ ! .svn ]
then
    rm -rf .svn
fi

svn copy $root/tags/branches/Users/$other_user/$their_branch $root/branches/Users/$user/$tag"_"$branch -m "$msg"
svn checkout $root/branches/Users/$user/$tag"_"$branch $tag"_"$branch
svn checkout $root/branches/Share/CABLE-AUX CABLE-AUX
