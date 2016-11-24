FROM debian:jessie
MAINTAINER Andrew Maxwell

RUN apt-get update
RUN apt-get install -y nginx

# Setup the sites to be available
COPY default.conf /etc/nginx/sites-available/default
COPY default.conf /etc/nginx/sites-enabled/default


# Expose the ports that we want to use
EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
