#version: 1.0.1
FROM ubuntu:16.04
MAINTAINER Dmitry Yevtushenko  <d.evtushenko@unicanova.com>
RUN apt-get update && apt-get install -y openvpn
COPY ./pipelines/scripts/start_openvpn.sh /
WORKDIR /
ENTRYPOINT ["/start_openvpn.sh"]
