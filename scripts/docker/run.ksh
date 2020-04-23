#if [ -z "$DOCKER_HOST" ]; then
#   echo "ERROR: no DOCKER_HOST defined"
#   exit 1
#fi

# set the definitions
INSTANCE=scheduled-action
NAMESPACE=uvadave

docker stop $INSTANCE
docker rm -f $INSTANCE

SCHEDULED_ACTIVITY=/mnt/activity/say-hi.ksh
HOSTFS="$(pwd)/tmp/say-hi.ksh"

VOLUME_MAP="-v $HOSTFS:$SCHEDULED_ACTIVITY"

# environment attributes
DOCKER_ENV="-e SCHEDULED_TIME=$SCHEDULED_TIME -e SCHEDULED_ACTIVITY=$SCHEDULED_ACTIVITY $VOLUME_MAP"

docker run --name $INSTANCE \
   $DOCKER_ENV \
   $NAMESPACE/$INSTANCE
