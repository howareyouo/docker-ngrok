FROM golang:alpine
MAINTAINER backflow <hunan.me@gmail.com>

RUN apk add --no-cache git make openssl
RUN git clone https://github.com/tutumcloud/ngrok.git /ngrok

ADD *.sh /
RUN chmod +x /*.sh

ENV domain **none**
ENV tunnelAddr :4443
ENV httpAddr :80
ENV httpsAddr :443

EXPOSE 4443
EXPOSE 443
EXPOSE 80

CMD /bin/sh
