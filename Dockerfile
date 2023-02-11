# mkdir /opt/jekyll
# cd /opt/jekyll
# vim Dockerfile
 

FROM nginx
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY conf /etc/nginx
VOLUME /usr/share/nginx/html
VOLUME /etc/nginx

ENV REFRESHED_AT 2023-02-10
 
RUN apt-get -yqq update
RUN apt-get -yqq install ruby ruby-dev make nodejs
RUN gem install --no-rdoc --no-ri jekyll
 
COPY docs /data
WORKDIR /data

RUN jekyll build --destination=/usr/share/nginx/html