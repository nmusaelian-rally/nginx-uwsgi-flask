FROM ubuntu:18.10

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev && \
    apt-get install -y nginx uwsgi uwsgi-plugin-python3

COPY ./requirements.txt /requirements.txt
COPY ./nginx.conf /etc/nginx/nginx.conf

WORKDIR /

RUN pip3 install -r requirements.txt

COPY . /

RUN adduser --disabled-password --gecos '' nginx\
  && chown -R nginx:nginx /app \
  && chmod 777 /run/ -R \
  && chmod 777 /run/ -R

ENTRYPOINT [ "/bin/bash", "/launcher.sh"]