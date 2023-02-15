FROM nginx:latest
LABEL maintainer="Venkatesh Chaluvadhi"
ARG VER= "1.1.5"
ENV Environmnet="Prod"
RUN apt update \
 && apt install -y jq net-tools unzip
COPY index.html /usr/share/nginx/html/index.html
COPY style.css /usr/share/nginx/html/style.css
COPY scorekeeper.js /usr/share/nginx/html/scorekeeper.js
ADD https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip terraform_${VER}_linux_amd64.zip
RUN unzip terraform_${VER}_linux_amd64.zip && mv terraform /usr/local/bin && terraform version
EXPOSE 80 8080 8000
CMD ["nginx","-g","daemon off;"]
