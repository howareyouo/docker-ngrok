#!/bin/sh
set -ex
cd /ngrok

if [ "${domain}" == "**none**" ]; then
    echo "Please set 'domain' parameter, eg: '-domain=abc.com'"
    exit 1
fi

if [ ! -f "/ngrok/ca.pem" ]; then
    openssl genrsa -out ca.key 2048
    openssl req -new -x509 -nodes -key ca.key -days 9999 -subj "/CN=${domain}" -out ca.pem
    openssl genrsa -out device.key 2048
    openssl req -new -key device.key -subj "/CN=${domain}" -out device.csr
    openssl x509 -req -in device.csr -CA ca.pem -CAkey ca.key -CAcreateserial -days 9999 -out device.crt
fi
cp -r ca.pem assets/client/tls/ngrokroot.crt

make release-server
GOOS=darwin GOARCH=386 make release-client
GOOS=darwin GOARCH=amd64 make release-client
GOOS=linux GOARCH=386 make release-client
GOOS=linux GOARCH=arm make release-client
GOOS=linux GOARCH=amd64 make release-client
GOOS=windows GOARCH=386 make release-client
GOOS=windows GOARCH=amd64 make release-client

echo "build ok !"