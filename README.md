## Setup CABLE on a MAC or a Linux machine

Grab a copy of CABLE - either a specific tag or someone else's branch & create the build file. This should work for a MAC or a Linux box

### Netcdf stuff

If you're on a MAC, you need to make sure the netcdf version compiled matches the gfortran you are using

```bash
$ gfortran --version
GNU Fortran (MacPorts gcc5 6.4.0) 6.4.0
blah, blah
```

Then recompile netcdf libs with whatever version the above throws up, i.e.

```bash
sudo port install netcdf-fortran +gcc64
```

### To set CABLE up.

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
