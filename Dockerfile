FROM alpine
RUN apk add --no-cache \
        bash           \
        httpie         \
        httpie-jwt-auth \
        jq &&          \
        which bash &&  \
        which http &&  \
        which jq
#RUN pip install -U httpie-jwt-auth
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
