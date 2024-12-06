FROM jasonish/suricata:latest AS suricata

# Install necessary libraries
RUN dnf update -y && dnf install -y nginx firewalld jq \
  && dnf clean all \
  && rm -rf /var/cache/dnf

# Set build argument for hostname
ARG HOSTNAME=localhost

# make sure output directory exists
RUN mkdir -p /etc/nginx/ssl

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf
COPY sites-enabled /etc/nginx/sites-enabled

# Validate Nginx configuration
RUN nginx -t
RUN nginx
