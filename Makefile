# VERSION = $(git describe --tags --long)

# all: packer

# build:
# 	packer build template.json

# qemu:
# 	packer build -var=version=${VERSION} -only=qemu-xenial -on-error=ask  template.json

# vbox:
# 	packer build -var=version=${VERSION} -only=vbox-xenial -on-error=ask  template.json

# debug: packer
# 	packer build -debug template.json

# .PHONY: all

VERSION = $(shell git describe --tags --long)
BUILD_FLAGS =
TEMPLATE =

qemu: BUILD_FLAGS = "-only=qemu-xenial"
qemu: TEMPLATE = "template.json"
qemu:
	packer build -var 'version=$(VERSION)' $(BUILD_FLAGS) $(TEMPLATE)

vbox: BUILD_FLAGS = "-only=vbox-xenial"
vbox: TEMPLATE = "template.json"
vbox:
	packer build -var 'version=$(VERSION)' $(BUILD_FLAGS) $(TEMPLATE)

lxc: BUILD_FLAGS = "-only=lxc-xenial"
lxc: TEMPLATE = "template.json"
lxc:
	packer build -var 'version=$(VERSION)' $(BUILD_FLAGS) $(TEMPLATE)

clean:
	rm\