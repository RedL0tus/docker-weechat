FROM        ubuntu:14.04
MAINTAINER  Joe Eli McIlvain <joe.eli.mac@gmail.com>

RUN apt-key update && apt-get update
RUN apt-get install -y weechat
RUN apt-get install -y dtach

RUN mkdir -p /.weechat
VOLUME /.weechat
ENV DTACH_FILE /.weechat/weechat.dtach
CMD ["bash","-c","rm -f $DTACH_FILE; dtach -c $DTACH_FILE /usr/bin/weechat"]
