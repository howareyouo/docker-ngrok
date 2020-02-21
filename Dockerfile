FROM golang:1.7.1-alpine
MAINTAINER hteen <i@hteen.cn>

RUN apk add --no-cache git make openssl

RUN git clone https://github.com/tutumcloud/ngrok.git /ngrok

ADD *.sh /

ENV domain **None**
ENV tunnelAddr :4443
ENV httpAddr :80
ENV httpsAddr :443

EXPOSE 4443
EXPOSE 80
EXPOSE 443

CMD /bin/sh
