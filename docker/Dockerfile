FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y python3 python3-pip emacs
# # This is a big one. The missing executable was 'xelatex':
# RUN apt-get install -y texlive-xetex
RUN apt-get install -y texlive-xetex

RUN pip3 install pygments

RUN mkdir -p /io
WORKDIR /io
CMD ["/bin/bash"]
