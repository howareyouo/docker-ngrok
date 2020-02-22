#!/bin/sh
set -ex

if [ "${domain}" == "**none**" ]; then
    echo "Please set 'domain' parameter, eg: '-domain=abc.com'"
    exit 1
fi

if [ ! -f "/ngrok/bin/ngrokd" ]; then
    echo "ngrokd is not built, building it now..."
    /bin/sh /build.sh
fi

/ngrok/bin/ngrokd -tlsKey=/ngrok/device.key -tlsCrt=/ngrok/device.crt -domain="${domain}" -httpAddr=${httpAddr} -httpsAddr=${httpsAddr} -tunnelAddr=${tunnelAddr}
