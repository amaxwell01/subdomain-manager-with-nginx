FROM nginx
MAINTAINER Andrew Maxwell

COPY default.conf /etc/nginx/conf.d/
RUN nginx -s reload
EXPOSE 80
