#!/bin/bash
#
# Merge latest changes from trunk/someones branch/shared branch/tag
#
# author: Martin De Kauwe
# date: 24th July 2018
#

root="https://trac.nci.org.au/svn/cable"

trunk=false
someones_branch=false
share_branch=true
tag_version=false

# change if taking from someone's branch
other_user="mrd561"
their_branch="CMIP6-GM2"

# change if taking from the shared branch
shared_branch="CMIP6-MOSRS"

# change if taking from the tagged branch
tagged_branch=""

# Update from the trunk
if [ "$trunk" == true ]
then

    cd $tagged_branch
    svn update
    svn merge $root/trunk
    cd ..

# Update from someone else's branch
elif [ "$someones_branch" == true ]
then

    cd $their_branch
    svn update
    svn merge $root/branches/Users/$other_user/$their_branch
    cd ..

# Update from the shared branch?
elif [ "$share_branch" == true ]
then
    cd $shared_branch
    svn update
    svn merge $root/branches/Share/$shared_branch
    cd ..

# Update from a tagged version?
elif [ "$tag_version" == true ]
then
    cd $tagged_branch
    svn update
    svn merge $root/tags/$tagged_branch
    cd ..
fi
