FROM alpine:latest

ENV GMAIL_ADDRESS=
ENV GMAIL_PASSWD=
ENV STORES=
ENV ITEMS=
ENV CHECK_AT=

RUN apk add curl nodejs npm && rm -rf /var/cache/apk/*
RUN npm install -g ikea-availability-checker

ADD run.sh /run.sh
RUN chmod +x /run.sh

ADD footer.txt /footer.txt
ADD header.txt /header.txt

WORKDIR /

CMD ["/bin/sh", "/run.sh"]
