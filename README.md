## Setup CABLE on a MAC or a Linux machine

The setup_cable.sh script has the options to: (i) grab the head of the trunk; (ii) grab the latest tag (assuming you tell it what that is); or (iii) grab someone else's branch (you need to set the user & branch).

This works for me on both a Mac and Linux box. NB. on a mac you need to install gsed, I've no idea why sed works differently on macs.

### Netcdf stuff

If you're on a mac, you need to make sure the netcdf version compiled matches the gfortran you are using

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
