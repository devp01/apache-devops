FROM httpd:2.4
COPY html/ /usr/local/apache2/htdocs/
COPY apache-status.conf /usr/local/apache2/conf/extra/status.conf
RUN echo "Include conf/extra/status.conf" >> /usr/local/apache2/conf/httpd.conf
EXPOSE 80
