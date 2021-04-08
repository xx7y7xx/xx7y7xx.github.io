#!/bin/bash
set -e

#wget --retry-connrefused --no-check-certificate http://yar.fruct.org/attachments/download/362/plantuml_7707-1_all.deb
#sudo dpkg -i plantuml_7707-1_all.deb
#rm -rf plantuml_7707-1_all.deb

wget --retry-connrefused --no-check-certificate https://launchpad.net/ubuntu/+source/plantuml/8024-1/+build/7673699/+files/plantuml_8024-1_all.deb
sudo dpkg -i plantuml_8024-1_all.deb
rm -rf plantuml_8024-1_all.deb
