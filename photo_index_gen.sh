#!/bin/bash
# Links the css, js, and img files required for the bootstrap gallery template
# into every photo directory.
cd /home/smilodon/public_html/FamilyPhotos
find . -maxdepth 4 -type d -exec bash -c \
    'cd "{}" && /home/smilodon/public_html/bootstrap_gallery/dir_linker.sh && cd -' ';'
