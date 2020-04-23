#!/usr/bin/env bash

# source the helper...
DIR=$(dirname $0)
. $DIR/helpers.ksh

# validate the environment
if [ -z "$SCHEDULED_TIME" ]; then
   error_and_exit "no SCHEDULED_TIME; please define your scheduled time, aborting"
fi

if [ -z "$SCHEDULED_ACTIVITY" ]; then
   error_and_exit "no SCHEDULED_ACTIVITY; please define your scheduled activity, aborting"
fi

# we assume the scheduled activity is an executable thingy
if [ ! -x $SCHEDULED_ACTIVITY ]; then
   error_and_exit "SCHEDULED_ACTIVITY is not readable or executable, aborting"
fi

# the time we want the action to occur
# this is specified in localtime
export ACTION_TIME=$SCHEDULED_TIME
export ACTION_TIMEZONE="America/New_York"

# helpful message...
banner_message "Scheduled $SCHEDULED_ACTIVITY: starting up..."

# forever...
while true; do

   # sleeping message...
   banner_message "Scheduled $SCHEDULED_ACTIVITY: sleeping until $ACTION_TIME ($ACTION_TIMEZONE)..."
   sleep_until $ACTION_TIME $ACTION_TIMEZONE

   # status message
   banner_message "Scheduled $SCHEDULED_ACTIVITY: starting sequence"

   # do the activity
   $SCHEDULED_ACTIVITY
   res=$?
   if [ $res -ne 0 ]; then
      banner_message "ERROR: returned $res during activity sequence; abandoning further processing"
      sleep 60
      continue
   fi

   # ending message
   banner_message "Scheduled $SCHEDULED_ACTIVITY: sequence completes successfully"

   # sleep for another minute
   sleep 60

done

# never get here

#
# end of file
#
