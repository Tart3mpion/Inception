#image created from
FROM debian:buster 

#use the nginx conf instead of the default
COPY srcs/nginx.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/ \
&& rm -rf /etc/nginx/sites-enabled/default

#ssl protocol
RUN mkdir /etc/nginx/ssl/ \
&& openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=IledeFrance/L=LParis/O=Ecole/OU=42 Department/CN=www.localhost.com"

#launch nginx
CMD ["nginx", "-g", "daemon off;"]
