.PHONY: help setup requirements build clean

export CLOUDFRONT_DOMAIN ?=
export CLOUDFRONT_KEY_PAIR_ID ?=

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	requirements \
	.env

requirements:
	which openssl

build: \
	dist/private_key.pem \
	dist/public_key.pem

dist/private_key.pem: | dist
	openssl genrsa -out $@ 2048

dist/public_key.pem: dist/private_key.pem | dist
	openssl rsa -pubout -in $< -out $@

.env:
	echo "CLOUDFRONT_DOMAIN=$(CLOUDFRONT_DOMAIN)" > $@
	echo "CLOUDFRONT_KEY_PAIR_ID=$(CLOUDFRONT_KEY_PAIR_ID)" >> $@

dist:
	-mkdir $@

clean:
	rm -rf dist
