.PHONY: all

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

lxc-debug: BUILD_FLAGS = -only=lxc-xenial -on-error=ask
lxc-debug: TEMPLATE = "template.json"
lxc-debug:
	packer build $(BUILD_FLAGS) -var 'version=$(VERSION)' $(TEMPLATE)


clean:
	rm\