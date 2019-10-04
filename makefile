REPO := registry.gitlab.com/trivago:latest

build:
		docker build -t $(REPO) .

build_and_push: build
		docker push $(REPO)

build_and_enter: build
		docker run --privileged -it --rm -v $(shell pwd):/app -w /app $(REPO) /bin/bash --login

