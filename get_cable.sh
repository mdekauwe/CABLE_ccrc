#!/bin/bash
#
# Get the CABLE code and make a branch
#
# Options to:
#   - (i) check out the trunk
#   - (ii) a specific tag
#   - (iii)or someone else's branch
#
# -> https://trac.nci.org.au/svn/cable/tags/CABLE-2.3.4/
#
# author: Martin De Kauwe
# date:   23rd September 2017
#

# Default behaviour is to get the latest tag (noting that this link will be out
# of date). Tag
tag="CABLE"
branch="trunk"

# if you change either of these options (both false by default), you need to
# edit below in the if statements too
trunk=true
someones_branch=false

root="https://trac.nci.org.au/svn/cable"
user="mgk576"
msg="\"setup repo\""

# Grab someone else's branch?
if [ "$someones_branch" == true ]
then
    trunk=false
    other_user="mrd561"
    their_branch="CMIP6-GM2"
    tag="CABLE-"$their_branch
    branch="what"
fi

if [ ! .svn ]
then
    rm -rf .svn
fi

if [ "$trunk" == true ]
then
    # NB tag here doesn't mean the tagged version! See above
    svn copy $root/trunk $root/branches/Users/$user/$tag"_"$branch -m "$msg"
    svn checkout $root/branches/Users/$user/$tag"_"$branch $tag"_"$branch
elif [ "$someones_branch" == true ]
then
    svn copy $root/branches/Users/$other_user/$their_branch $root/branches/Users/$user/$tag"_"$branch -m "$msg"
    svn checkout $root/branches/Users/$user/$tag"_"$branch $tag"_"$branch
else
    svn copy $root/tags/$tag $root/branches/Users/$user/$tag"_"$branch -m "$msg"
    svn checkout $root/branches/Users/$user/$tag"_"$branch $tag"_"$branch
fi

if [ ! -d "../CABLE-AUX" ]
then
    svn checkout $root/branches/Share/CABLE-AUX CABLE-AUX
fi
