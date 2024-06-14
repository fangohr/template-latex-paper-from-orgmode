PYTHON?=python3

docker-build:
		docker build -t orgmode2paper -f docker/Dockerfile .

docker-paper.pdf:
		docker run -v `pwd`:/io orgmode2paper make paper.pdf

docker-bash:
		docker run -ti -v `pwd`:/io orgmode2paper bash

paper.pdf:
		cd paper && make paper.pdf

force:
		cd paper && make force
