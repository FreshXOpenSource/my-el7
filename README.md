my-el7
======

scripts to rebuild el7


requires:

* mock
* wget
* p7zip-plugins
* a lot of time

run setup.sh for the initial setup, then buildall.sh

Tipp : 

If you have plenty of RAM, mount a ramdisk on the mock temp folder /var/lib/mock
This increased build time a lot while decreasing I/O load, i.e. add to fstab (uid/gid should be to ones of the mockbuilder), size is the Ramdisk size (here 5.5GB) :

/dev/shm 		/var/lib/mock/	tmpfs	 noauto,size=5600m,mode=700,uid=1000,gid=135 0 0



