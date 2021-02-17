#!/bin/bash

function sleep_until {
  while [ $(date +%H:%M) != "$*" ]; do sleep 1; done
}

while true
do
    (
        echo -e "Cc: $GMAIL_ADDRESS\nFrom: $GMAIL_ADDRESS"
        cat header.txt
        ikea-availability stock --store=$STORES $ITEMS
        cat footer.txt
    ) | curl -s \
    --upload-file - \
    --url 'smtps://smtp.gmail.com:465' \
    --ssl-reqd \
    --mail-from "$GMAIL_ADDRESS" \
    --mail-rcpt "$GMAIL_ADDRESS" \
    --user "$GMAIL_ADDRESS:$GMAIL_PASSWD"

    sleep_until $CHECK_AT
done
