#
# Dockerfile for the cron runner container
#

FROM alpine:3.13

# Add necessary packages
RUN apk --update add bash tzdata ca-certificates curl mariadb-client postgresql-client sed gawk jq openjdk11 maven aws-cli libxml2-utils docker-cli make git coreutils apache-ant file diffutils

# Create python symlink
RUN ln -s /usr/bin/python3 /usr/bin/python

# set the timezone appropriatly
ENV TZ=America/New_York
RUN cp /usr/share/zoneinfo/US/Eastern /etc/localtime && echo $TZ > /etc/timezone

# Specify home 
ENV APP_HOME /scheduled-action
WORKDIR $APP_HOME

# install the app
COPY . $APP_HOME

# define startup script
CMD scripts/entry.ksh

# move in the profile
COPY data/container_bash_profile /root/.profile

#
# end of file
#
