.PHONY: init build
any: build
init:
	git submodule init
	git submodule update
build: init
	docker build -t nuc980 .

