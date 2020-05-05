if [ -z "$DOCKER_HOST" ]; then
   echo "ERROR: no DOCKER_HOST defined"
   exit 1
fi

# set the definitions
INSTANCE=scheduled-action
NAMESPACE=uvadave

docker stop $INSTANCE
docker rm -f $INSTANCE

CONTAINERFS=/mnt/crontab-runner
#HOSTFS="$(pwd)/example/crontab-runner"
HOSTFS="/home/dpg3k/crontab-runner"

VOLUME_MAP="-v $HOSTFS:$CONTAINERFS"

# environment attributes
DOCKER_ENV="$VOLUME_MAP"

docker run --name $INSTANCE \
   $DOCKER_ENV \
   $NAMESPACE/$INSTANCE
