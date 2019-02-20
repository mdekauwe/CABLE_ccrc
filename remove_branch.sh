#!/bin/bash
#
# Delete branch
#
# author: Martin De Kauwe
# date: 24th July 2018
#

branch="CMIP6-GM2"

root="https://trac.nci.org.au/svn/cable"
user="mgk576"
msg="\"deleting branch\""

svn rm $root/branches/Users/$branch -m "$msg"
