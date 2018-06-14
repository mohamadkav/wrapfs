WRAPFS_VERSION="0.1"
WRAPFS_SUPER_MAGIC=0xb550ca10

EXTRA_CFLAGS += -DWRAPFS_VERSION=\"$(WRAPFS_VERSION)\" -DWRAPFS_SUPER_MAGIC=$(WRAPFS_SUPER_MAGIC)


obj-m += wrapfs.o

wrapfs-y := dentry.o file.o inode.o main.o super.o lookup.o mmap.o


all:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) clean
