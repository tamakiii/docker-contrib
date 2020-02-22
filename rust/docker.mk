.PHONY: install clean

NAME := docker-contrib-rust
CUR_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
WORK_DIR := /workdir
VOLUMES := $(CUR_DIR):$(WORK_DIR)
ENVIRONMENT := $(shell grep ^ENVIRONMENT= .env | awk -F= '{ print $$2 }')

install: \
	.env \
	build

build:
	docker build --target $(ENVIRONMENT) -t $(NAME) .

run:
	docker run -it --rm $(foreach v,$(VOLUMES),-v=$v) -w $(WORK_DIR) $(NAME) bash

.env:
	touch $@
	echo "ENVIRONMENT=production-pseudo" >> $@

clean:
	rm .env