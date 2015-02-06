#!/bin/bash

# install oracle java 7 (REALLY recomended for eclipse)
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer -y


# eclipse (copied from pascal gohl)  (merci)
filename=eclipse-cpp-luna-SR1a-linux-gtk-x86_64.tar.gz
wget http://mirror.switch.ch/eclipse/technology/epp/downloads/release/luna/SR1a/$filename
tar -zxvf $filename
sudo mv eclipse /opt
sudo chown $USER -R /opt/eclipse/
sudo ln -sf /opt/eclipse/eclipse /usr/sbin/eclipse
rm $filename
# setup unity link
cat > eclipse.desktop << "EOF"
[Desktop Entry]
Name=Eclipse
Type=Application
Exec=eclipse
Terminal=false
Icon=eclipse
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE;
Name[en]=Eclipse
EOF
sudo mv eclipse.desktop /opt/eclipse/
sudo desktop-file-install /opt/eclipse/eclipse.desktop
sudo cp /opt/eclipse/icon.xpm /usr/share/pixmaps/eclipse.xpm

