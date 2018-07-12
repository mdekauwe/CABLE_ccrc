#!/bin/bash
#
# Merge latest changes from branch we branched off...
#
# author: Martin De Kauwe
# date:   13th July 2018
#

branch="CMIP6-MOSRS"
root="https://trac.nci.org.au/svn/cable"

cd $branch
svn update
svn merge $root/branches/Share/$branch
cd ..
