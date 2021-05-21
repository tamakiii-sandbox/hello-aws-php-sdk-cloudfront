.PHONY: help setup requirements build clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	requirements

requirements:
	which openssl

build: \
	dist/private_key.pem \
	dist/public_key.pem

dist/private_key.pem: | dist
	openssl genrsa -out $@ 2048

dist/public_key.pem: dist/private_key.pem | dist
	openssl rsa -pubout -in $< -out $@

dist:
	-mkdir $@

clean:
	rm -rf dist
