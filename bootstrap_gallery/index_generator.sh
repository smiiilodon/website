#!/bin/bash

cd /home/smilodon/public_html/FamilyPhotos
find . -maxdepth 4 -type d -exec bash -c 'cd "{}" && /home/smilodon/public_html/bootstrap_gallery/dir_linker.sh && cd -' ';'
