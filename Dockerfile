FROM envoyproxy/envoy-alpine:v1.18.2

ENV CONSUL_HTTP_ADDR=http://localhost:8500

#ENV CONSUL_VERSION=${CONSUL_VERSION}
RUN apk add -u bash curl && \
    wget https://releases.hashicorp.com/consul/1.10.0-beta3/consul_1.10.0-beta3_linux_amd64.zip \
	-O /tmp/consul.zip && \
    unzip /tmp/consul.zip -d /tmp && \
    mv /tmp/consul /usr/local/bin/consul && \
    rm -f /tmp/consul.zip

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]