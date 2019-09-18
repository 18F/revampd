#!/bin/sh

set -e

# derive WEB_HOST
# https://stackoverflow.com/questions/2497215/extract-domain-name-from-url#comment80168192_11385736
export WEB_HOST=$(echo $WEB_BASE_URL | awk -F/ '{print $3}')
# inject into the nginx configuration
envsubst '${WEB_HOST} ${PORT}' < /tmp/nginx.template.conf > /etc/nginx/nginx.conf

nginx