FROM alpine:3.20

RUN apk add --no-cache unzip ca-certificates

ADD https://ganigeorgiev.com/meta/pocketbase/pocketbase/download/v0.41.1/pocketbase_0.41.1_linux_amd64.zip /tmp/pb.zip

RUN unzip /tmp/pb.zip -d /pb/ && rm /tmp/pb.zip

RUN mkdir -p /pb/pb_migrations /pb/pb_hooks /pb/pb_public

COPY entrypoint.sh /pb/entrypoint.sh

RUN chmod +x /pb/entrypoint.sh

VOLUME /pb/pb_data

EXPOSE 8090

ENTRYPOINT ["/pb/entrypoint.sh"]
