FROM alpine:latest
RUN apk add --no-cache \
        bash           \
        httpie         \
        py3-pip        \
        jq &&          \
        which bash &&  \
        which http &&  \
        which jq
RUN python3 -m venv ~/.local --system-site-packages
RUN ~/.local/bin/pip install -U httpie-jwt-auth
COPY entrypoint.sh /entrypoint.sh
#RUN http --version
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
