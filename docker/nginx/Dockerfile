FROM jasonish/suricata:latest AS suricata

# Install necessary libraries
RUN dnf update -y && dnf install -y nginx firewalld jq \
  && dnf clean all \
  && rm -rf /var/cache/dnf

# RUN iptables -I INPUT -j NFQUEUE
# RUN iptables -I OUTPUT -j NFQUEUE

# RUN systemctl enable firewalld
# RUN systemctl start firewalld

# RUN firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT 1 -j NFQUEUE
# RUN firewall-cmd --permanent --direct --add-rule ipv4 filter OUTPUT 1 -j NFQUEUE

# RUN firewall-cmd --permanent --direct --add-rule ipv6 filter INPUT 1 -j NFQUEUE
# RUN firewall-cmd --permanent --direct --add-rule ipv6 filter OUTPUT 1 -j NFQUEUE

# RUN firewall-cmd --reload

# Set build argument for hostname
ARG HOSTNAME=localhost

# make sure output directory exists
RUN mkdir -p /etc/nginx/ssl

# Generate self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/CN=${HOSTNAME}"

# generate dhparam file
RUN openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf
COPY sites-enabled /etc/nginx/sites-enabled

# Validate Nginx configuration
RUN nginx -t
RUN nginx
