#!/usr/bin/env bash

# define the crontab we can load
CRONTAB=/mnt/crontab-runner/crontab

# if we have a crontab available, load it
if [ -f $CRONTAB ]; then
   # load the cron table
   crontab -u root $CRONTAB
fi

#
# start the cron daemon and run in the forground
#
crond -f -l 8

#
# end of file
#
