FROM ubuntu:latest

ENV MAIL_NAME "postfix postfix/mailname string container.alemayhu.com"
ENV MAIL_TYPE "postfix postfix/main_mailer_type string 'Internet Site'"
ENV DEBIAN_FRONTEND noninteractive

LABEL maintainer Alexander Alemayhu

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
      apt-get update && \
      apt-get install -y sudo git vim make ruby curl locales nodejs npm && \
      echo $MAIL_NAME | debconf-set-selections && \
      echo $MAIL_TYPE | debconf-set-selections && \
      curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*
