#!/bin/bash
#
# Get latest CABLE tagged version setup on the CCRC storm servers
# -> https://trac.nci.org.au/svn/cable/tags/CABLE-2.3.4/
#
# author: Martin De Kauwe
# date:   11 September 2017
#
# NB. to deleta a branch:
# svn rm https://trac.nci.org.au/svn/cable/branches/Users/mgk576/CABLE-2.3.4_testing -m "Deleting test branch"


root="https://trac.nci.org.au/svn/cable"
user="mgk576"
tag="CABLE-2.3.4"
branch="test"
msg="setup test repo"

if [ ! .svn ]
then
    rm -rf .svn
fi

svn copy $root/tags/$tag $root/branches/Users/$user/$tag"_"$branch -m $msg
svn checkout $root/branches/Users/$user/$tag"_"$branch $tag"_"$branch
svn checkout $root/branches/Share/CABLE-AUX CABLE-AUX
