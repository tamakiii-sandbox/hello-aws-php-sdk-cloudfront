.PHONY: help build login clean

NAME := tamakiii-sandbox/hello-aws-php-sdk-cloudfront

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build -t $(NAME) .

login:
	docker run -it --rm $(NAME) bash

clean:
	docker image rm $(NAME)
