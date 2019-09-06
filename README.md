#Basic Bro Container
Repo is a container containing bro and broctl.  Running the image will start bro with ports 7000 - 7100 published on the host system.

## Building
`./build.sh` will build the container

## Running
`./run.sh` will run the container, mounting the scripts and log directories to the correct paths inside the container.  Container will be destroyed upon exit.


## broctl
`install`
`start`

Bro is now up and running.

`stop`

## Notes
The scripts can be updated edited on the host system while the container is running, but bro is not.  New bro scripts must be loaded in `root.bro`.

You may see the error message:
```
Error: error running post-terminate for bro: mv: cannot move '/var/spool/bro/bro' to '/var/spool/bro/tmp/post-terminate`: Device or resource busy
```

This is due to the log path being mounted in the container.  Bro is unable to move the directory to rotate logs.  The log output does not appear to be affected.

