# https://www.displaylink.com/downloads/file?id=1576
# https://www.displaylink.com/downloads/file?d=310
unzip *.zip
chmod +x ./displaylink-driver-5.3.1.34.run
sudo displaylink-driver-5.3.1.34.run
cd DisplayLinkXServerPatch
sudo dpkg -i xserver-xorg-core_1.20.8-2ubuntu2_amd64.deb
