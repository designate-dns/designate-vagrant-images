all: packer

build:
	packer build template.json

debug: packer
	packer build -debug template.json

.PHONY: all