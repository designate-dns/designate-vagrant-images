all: packer

build:
	packer build template.json

qemu:
	packer build -only=qemu-xenial -on-error=ask  template.json

vbox:
	packer build -only=vbox-xenial -on-error=ask  template.json

debug: packer
	packer build -debug template.json

.PHONY: all