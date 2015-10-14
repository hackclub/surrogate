FROM nginx

COPY nginx.conf /etc/nginx/nginx.conf

# Add our conf.d directory
RUN rm -rf /etc/nginx/conf.d
COPY conf.d /etc/nginx/conf.d
