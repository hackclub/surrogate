FROM debian:jessie

# Let's install nginx from source!

# Setup build
WORKDIR /tmp/nginx
RUN apt-get -y update && apt-get -y install build-essential

# Get nginx's and ngx_http_substitutions_filter_module's source
ADD http://nginx.org/download/nginx-1.9.5.tar.gz nginx-1.9.5.tar.gz
ADD https://github.com/yaoweibin/ngx_http_substitutions_filter_module/archive/v0.6.4.tar.gz ngx_http_substitutions_filter_module-0.6.4.tar.gz
RUN tar xzf nginx-1.9.5.tar.gz
RUN tar xzf ngx_http_substitutions_filter_module-0.6.4.tar.gz

# Install extra build dependencies
RUN apt-get -y install libpcre3-dev libssl-dev zlib1g-dev

# Compile and install!
WORKDIR /tmp/nginx/nginx-1.9.5
RUN ./configure \
      --with-http_ssl_module \
      --add-module=../ngx_http_substitutions_filter_module-0.6.4 \
      && make install
RUN ln -s /usr/local/nginx/sbin/nginx /usr/local/bin/nginx

# Clean up the build
RUN rm -rf /tmp/nginx

# Let's replace the default configuration with ours
WORKDIR /
COPY conf /usr/local/nginx/conf

# And we should be good to go!
CMD ["nginx"]
