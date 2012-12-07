#!/bin/bash


# Get the prerequisites
sudo apt-get install cvs libalut-dev g++ libgl1-mesa-dev freeglut3-dev libplib-dev libalut-dev libvorbis-dev libxmu-dev libxxf86vm-dev git libxi-dev libxrender-dev libxrandr-dev libz-dev libpng-dev build-essential

# Get the Torcs code version 1.3.1
#cvs -z3 -d:pserver:anonymous@torcs.cvs.sourceforge.net:/cvsroot/torcs co -r r1-3-1 -P torcs
# Or if cvs is blocked by firewall 
if [ ! -f  torcs-1.3.1.tar.bz2 ]
then
	wget http://sourceforge.net/projects/torcs/files/all-in-one/1.3.1/torcs-1.3.1.tar.bz2
fi


# Get the server patch
if [ ! -f  scr-linux-patch.tgz ]
then
	wget 'http://sourceforge.net/projects/cig/files/SCR Championship/Server Linux/1.0/scr-linux-patch.tgz'
fi

# unpack and Patch the code
# unless it is already there
if [ ! -d torcs-1.3.1 ]
then
	tar xvf torcs-1.3.1.tar.bz2
	cd torcs-1.3.1/	
	tar xvf ../scr-linux-patch.tgz
	cd scr-patch/
	./do_patch.sh
fi

# Configure
cd ../
./configure

# Make
make

# Install
sudo make install
sudo make datainstall



