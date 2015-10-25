FROM phusion/baseimage:0.9.17
MAINTAINER Tim Soethout, github@timmybanker.nl

RUN apt-get update -qq && apt-get install -qqy wget

COPY assets/init.sh /app/init.sh
RUN chmod 755 /app/init.sh

VOLUME /opt/sonar/extensions/

CMD ["/app/init.sh"]
