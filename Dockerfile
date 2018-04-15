FROM        debian:sid
MAINTAINER  KayMW <redl0tus@noreply.github.com>

RUN apt-get update && apt-get dist-upgrade ca-certificates apt-transport-https gnupg -y
RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E
RUN echo "deb https://weechat.org/debian sid main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y weechat-devel
RUN apt-get install -y dtach

RUN mkdir -p /.weechat
VOLUME /.weechat
ENV DTACH_FILE /.weechat/weechat.dtach
CMD ["bash","-c","rm -f $DTACH_FILE; dtach -c $DTACH_FILE /usr/bin/weechat"]
