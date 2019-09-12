# Basic Bro Container
Project will launch a tmux session with 3 containers configured as a router and two clients on differing subnets.

Bro is installed on container serving as the router in this configuration.

## Building
`./build.sh` will build the containers and isntall dependencies if needed.

## Running
`./run.sh` will run the containers, mounting the scripts and log directories to the correct paths inside the container for bro to use them.  

A fourth tmux pane will be present in the lower right corner.  This pane runs a script configuring iptables to allow the two docker subnets to communicate.  Root access is required.

The tmux session can be exited with `<TMUX_PREFIX> &`.  All containers created will be destroyed upon exit.  The iptables configuration is not automatically restored upon exit due to the root access requirement.  iptables rules can be restored with the command `iptables-restore < .iptables_config`.

## Notes
The scripts can be updated edited on the host system while the container is running, but bro is not.  New bro scripts must be loaded in `root.bro`.

You may see the error message:
```
Error: error running post-terminate for bro: mv: cannot move '/var/spool/bro/bro' to '/var/spool/bro/tmp/post-terminate`: Device or resource busy
```

This is due to the log path being mounted in the container.  Bro is unable to move the directory to rotate logs.  The log output does not appear to be affected.
