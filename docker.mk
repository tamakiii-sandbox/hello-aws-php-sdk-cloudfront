.PHONY: help build login clean

NAME := hello-aws-php-sdk-cloudfront

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build -t $(NAME) .

login:
	docker run -it --rm -v $(realpath .):/local/$(NAME) -w /local/$(NAME) $(NAME) bash

clean:
	docker image rm $(NAME)
