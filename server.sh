#!/bin/sh
set -e

if [ "${DOMAIN}" == "**None**" ]; then
    echo "Please set DOMAIN"
    exit 1
fi

if [ ! -f "/ngrok/bin/ngrokd" ]; then
    echo "ngrokd is not build,will be build it now..."
    /bin/sh /build.sh
fi

/ngrok/bin/ngrokd -tlsKey=/ngrok/device.key -tlsCrt=/ngrok/device.crt -domain="${domain}" -httpAddr=${httpAddr} -httpsAddr=${httpsAddr} -tunnelAddr=${tunnelAddr}
