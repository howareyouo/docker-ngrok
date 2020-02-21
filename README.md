# DOCKER NGROK IMAGE

## BUILD IMAGE

```linux
git clone https://github.com/howareyouo/ngrok-docker.git
cd docker-ngrok
docker build -t backflow/ngrok .
```

## RUN
* you must mount your folder (E.g `/opt/ngrok`) to container `/ngrok/bin`
* if it is the first run, it will generate the binaries file and CA in your folder `/opt/ngrok`

```linux
docker run -idt --name ngrok-server \
-v /opt/ngrok:/ngrok/bin \
-e domain='ngrok.hunan.fit' backflow/ngrok /bin/sh /server.sh
```
