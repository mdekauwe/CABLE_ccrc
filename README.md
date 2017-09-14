## Setup CABLE on the CCRC storm servers

Grab a copy of CABLE - either a specific tag or someone else's branch & create the build file.

You will need to edit the top of these to set: branch name, NETCDF lib paths, tag you want, etc.

```bash
$ ./setup_cable.sh
$ ./create_build_file.sh
$ ./build.ksh
```

NB. to self, deleta a branch:

```bash
$ svn rm https://trac.nci.org.au/svn/cable/branches/Users/mgk576/CABLE-2.3.4_testing -m "Deleting test branch"
```
