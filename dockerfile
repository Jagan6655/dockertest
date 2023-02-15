FROM nginx:latest
RUN apt update
COPY index.html /usr/share/nginx/html/index.html
