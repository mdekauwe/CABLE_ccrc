## Setup CABLE on the CCRC storm servers

## Get latest tagged version

This obviously relies on your stating which tag you want, look at
https://trac.nci.org.au/svn/cable/tags/

Then run the following scripts - you will need to edit the top of these to set
branch names, tag you want, etc.

```bash
$ ./setup_cable.sh
$ ./create_build_file.sh
$ ./build.ksh
```
