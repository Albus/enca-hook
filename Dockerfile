FROM ubuntu
WORKDIR /tmp
RUN apt-get update && apt-get install -qq -y git tar enca
ADD https://github.com/adnanh/webhook/releases/latest/download/webhook-linux-amd64.tar.gz /tmp
RUN tar -xf /tmp/webhook-linux-amd64.tar.gz && rm /tmp/webhook-linux-amd64.tar.gz \
    && git clone -- https://github.com/Albus/enca-hook.git
CMD ["/tmp/webhook-linux-amd64/webhook","-hooks","/tmp/enca-hook/hooks.json"]
USER daemon
EXPOSE 9000