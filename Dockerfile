FROM alpine

RUN apk add --no-cache \
        bash           \
        httpie         \
        jq &&          \
        which bash &&  \
        which http &&  \
        which jq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
