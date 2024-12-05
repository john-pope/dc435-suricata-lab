#!/bin/bash

docker run --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_NICE \
  -p 43580:80 -p 43543:443 \
  -v ./docker/nginx/nginx.conf:/etc/nginx/nginx.conf \
  -v ./docker/nginx/sites-enabled:/etc/nginx/sites-enabled \
  -v ./docker/nginx/suricata/rules:/var/lib/suricata/rules/custom \
  -v ./app:/usr/share/nginx/html \
  -e NGINX_HOST=nginx.localhost \
  -e NGINX_PORT=80 \
  dc435-preso-nginx -i eth0