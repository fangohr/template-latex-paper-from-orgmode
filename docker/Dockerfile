FROM ubuntu:19.10

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y python3 python3-pip \
  emacs texlive-xetex

RUN pip3 install pygments

RUN mkdir -p /io
WORKDIR /io
CMD ["/bin/bash"]
