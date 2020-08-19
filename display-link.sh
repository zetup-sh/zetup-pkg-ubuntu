# 

curl -L -O "http://assets.displaylink.com/live/downloads/software/f1576_DisplayLink%20USB%20Graphics%20Software%20for%20Ubuntu%205.3.1.zip?AWSAccessKeyId=AKIAJHGQWPVXWHEDJUEA&Expires=1597860538&Signature=rHCCE9lfslaTmTw9KNoRxH3h4hQ%3D"
curl -L -O "http://assets.displaylink.com/live/downloads/software/f1597_DisplayLink%20XServer%20Patch%2020.04.zip?AWSAccessKeyId=AKIAJHGQWPVXWHEDJUEA&Expires=1597861215&Signature=795H%2Ba%2FIdki94Mg%2Bd%2F8iovr9ovs%3D"
unzip *.zip
chmod +x *.run
sudo *.run
sudo dpkg -i xserver-xorg-core_1.20.8-2ubuntu2_amd64.deb
