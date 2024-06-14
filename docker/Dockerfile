FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y python3 python3-pip python3-pygments \
    emacs texlive-xetex latexmk

RUN mkdir -p /io
WORKDIR /io
CMD ["/bin/bash"]
