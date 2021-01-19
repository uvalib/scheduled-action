#
# Dockerfile for the cron runner container
#

FROM alpine:3.13

# Add necessary packages
RUN apk --update add bash tzdata ca-certificates curl mariadb-client postgresql-client sed gawk jq openjdk11 maven aws-cli libxml2-utils docker-cli make git coreutils apache-ant file

# install Phantom.js (see: https://gist.github.com/vovimayhem/6437c2f03b654e392ccf3e9903eba6af)
RUN cd /tmp && curl -Ls https://github.com/dustinblackman/phantomized/releases/download/2.1.1/dockerized-phantomjs.tar.gz | tar xz && \
    cp -R lib lib64 / && \
    cp -R usr/lib/x86_64-linux-gnu /usr/lib && \
    cp -R usr/share /usr/share && \
    cp -R etc/fonts /etc && \
    curl -k -Ls https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 | tar -jxf - &&\
    cp phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && \
    rm -fr /tmp/phantomjs-2.1.1-linux-x86_64

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
