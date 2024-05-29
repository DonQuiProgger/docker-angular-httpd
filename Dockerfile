# syntax=docker/dockerfile:1

FROM httpd:2.4-alpine
MAINTAINER Matthias Lucas Jaros

# enable rewrite engine
RUN sed -i 's/^#\(LoadModule.*rewrite.*\)/\1/' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/<Directory "\/usr\/local\/apache2\/htdocs">/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /usr/local/apache2/conf/httpd.conf

COPY ./.htaccess /usr/local/apache2/htdocs/

EXPOSE 80
