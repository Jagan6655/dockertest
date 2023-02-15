FROM nginx:latest
RUN apt update \
 && apt install -y jq net-tools unzip
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80 8080 9000
CMD ["nginx","-g","daemon off;"]
