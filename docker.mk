.PHONY: help build login run clean

NAME := hello-aws-php-sdk-cloudfront

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build -t $(NAME) .

login:
	docker run -it --rm -v $(realpath .):/local/$(NAME) -w /local/$(NAME) --env-file=.env $(NAME) bash

run:
	docker run -it --rm -v $(realpath .):/local/$(NAME) -w /local/$(NAME) --env-file=.env $(NAME) php main.php

clean:
	docker image rm $(NAME)
