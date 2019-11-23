FROM python:3

LABEL AUTHOR Jacob White <jake@jwhite.network>

ARG BUILD_DATE
ARG VCS_REF

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/Cyb3r-Jak3/html5validator-docker.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc1"

RUN apt-get -qq update && \
    apt-get install -y git python3-pip default-jre && \
    pip3 install setuptools


RUN git clone https://github.com/Cyb3r-Jak3/html5validator.git && cd html5validator && python setup.py install