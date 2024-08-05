# syntax=docker/dockerfile:1

FROM httpd:2.4-alpine

# enable rewrite engine
RUN sed -i 's/^#\(LoadModule.*rewrite.*\)/\1/' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/<Directory "\/usr\/local\/apache2\/htdocs">/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /usr/local/apache2/conf/httpd.conf
RUN sed -i 's/ServerTokens Full/ServerTokens Prod/' /usr/local/apache2/conf/extra/httpd-default.conf

COPY ./.htaccess /usr/local/apache2/htdocs/

EXPOSE 80
