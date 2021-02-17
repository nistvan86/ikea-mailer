## ikea-mailer

This is quickly hacked together very simple Docker image based tool which periodically checks the availability of some IKEA items and sends the results and forecasts to you in an email.

It uses the [ikea-availability-checker](https://github.com/Ephigenia/ikea-availability-checker) tool written by Ephigenia.

You need a registered GMail account. The tool is hardcoded to only send to your own email address, and can only use the GMail SMTP server for this.

Example docker-compose entry to make this run as long as you don't stop it explicitly (assuming this repository is checked out at `./images/ikea-mailer`):

    version: '3'
    services:
    ikea-mailer:
        restart: unless-stopped
        build:
        context: ./images/ikea-mailer
        environment:
        - CHECK_AT
        - GMAIL_ADDRESS
        - GMAIL_PASSWD
        - STORES
        - ITEMS

Then you can use a `.env` file to configure it:

    CHECK_AT="9:00"
    GMAIL_ADDRESS="<your_gmail_address>"
    GMAIL_PASSWD="<an_app_password_created_in_your_account>"
    STORES="<comma_seperated_store_ids>"
    ITEMS="<space separated item ids>"

You can find out the store IDs needed with the `ikea-availability-checker tool`, check it's documentation. Item IDs are shown on their IKEA pages and also at the end of each item page's URL.