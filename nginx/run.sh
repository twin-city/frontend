#!/bin/sh
#
# configuration nginx
#
#
set -e

SED_REPLACE=`env | sed -e 's#\([^=]*\)=\(.*\)\s*$#s\#<\1>\#\2\#g;#'| tr '\n' ' ' | sed 's/$/\n/'`

[ -z "${APP}" ] && echo "missing some env var" && exit 1


(
sed "${SED_REPLACE}" < /etc/nginx/nginx.template > /etc/nginx/nginx.conf
sed "${SED_REPLACE}" < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf
) && echo "nginx conf:" && cat /etc/nginx/nginx.conf && echo "default conf:" && cat /etc/nginx/conf.d/default.conf && nginx -g "daemon off;"
