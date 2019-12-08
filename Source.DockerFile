FROM python:3

LABEL AUTHOR Jacob White <jake@jwhite.network>

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/Cyb3r-Jak3/html5validator-docker.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc1"

RUN apt-get -q update && \
    apt-get install -y git python3-pip default-jre && \
    pip3 install setuptools

RUN git clone https://github.com/svenkreiss/html5validator.git && cd html5validator && python setup.py install