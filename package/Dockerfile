#
# Dockerfile for the cron runner container
#

FROM alpine:3.11

# Add necessary packages
RUN apk --update add bash tzdata ca-certificates curl

# set the timezone appropriatly
ENV TZ=UTC
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Specify home 
ENV APP_HOME /scheduled-action
WORKDIR $APP_HOME

# install the app
COPY . $APP_HOME

# define startup script
CMD scripts/entry.ksh

# move in the profile
COPY data/container_bash_profile /home/docker/.profile

#
# end of file
#
