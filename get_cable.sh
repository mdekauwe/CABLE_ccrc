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
# date: 24th July 2018
#

# Default behaviour is to get the head of the trunk
your_repo_name="CABLE_trunk"

# if you change either of these options (both false by default), you need to
# edit below in the if statements too
trunk=false
someones_branch=false
share_branch=true
tag_version=false

root="https://trac.nci.org.au/svn/cable"
user="mgk576"
msg="\"setup repo\""

# Grab someone else's branch?
if [ "$someones_branch" == true ]
then
    trunk=false
    someones_branch=true
    share_branch=false
    tag_version=false

    other_user="mrd561"
    their_branch="CMIP6-GM2"
    your_repo_name="CABLE-"$their_branch
# Grab the shared branch?
elif [ "$share_branch" == true ]
then
    trunk=false
    someones_branch=false
    share_branch=true
    tag_version=false

    branch="CMIP6-MOSRS"
    your_repo_name=$branch
# Grab a tagged version?
elif [ "$tag_version" == true ]
then
    trunk=false
    someones_branch=false
    share_branch=false
    tag_version=true
    tag=""
    your_tag_name=""
fi

if [ ! .svn ]
then
    rm -rf .svn
fi

if [ "$trunk" == true ]
then
    # NB tag here doesn't mean the tagged version! See above
    svn copy $root/trunk $root/branches/Users/$user/$your_repo_name -m "$msg"
    svn checkout $root/branches/Users/$user/$your_repo_name
elif [ "$someones_branch" == true ]
then
    svn copy $root/branches/Users/$other_user/$their_branch \
             $root/branches/Users/$user/$your_repo_name -m "$msg"
    svn checkout $root/branches/Users/$user/$your_repo_name
elif [ "$share_branch" == true ]
then
    svn copy $root/branches/Share/$branch \
              $root/branches/Users/$user/$your_repo_name -m "$msg"
    svn checkout $root/branches/Users/$user/$your_repo_name
elif [ "$tag_version" == true ]
then
    svn copy $root/tags/$tag $root/branches/Users/$user/$your_tag_name -m "$msg"
    svn checkout $root/branches/Users/$user/$your_tag_name
fi

if [ ! -d "CABLE-AUX" ]
then
    svn checkout $root/branches/Share/CABLE-AUX CABLE-AUX
fi
