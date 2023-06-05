.SECONDARY:
.PHONY: __hxfscompile run mount archive clean

SOURCES := $(wildcard src/*.c)
HXDIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

run: mount
	../build/ish -f build/hxfs /bin/login -f root

mount: archive
	../build/tools/fakefsify build/archive/rootfs.tar.gz build/hxfs

archive: clean
	mkdir -p build/archive
	@echo $(HXDIR) > hxfs/var/hxdata/.hxdir
	cd hxfs; tar -zcf ../build/archive/rootfs.tar.gz *

updatefs:
	test -d build/hxfs/data && (rm -rf hxfs; mkdir hxfs; cp -arf build/hxfs/data/* hxfs)

clean:
	test ! -d build || rm -rf build

# To be run inside the iSH fake-fs
__hxfscompile:
	$(CC) -Isrc $(SOURCES) -o /root/hxpwn