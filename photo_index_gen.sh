#!/usr/bin/env bash
# Links the css, js, and img files required for the bootstrap gallery template
# into every photo directory.
cd /data/www/photos
find . -maxdepth 4 -type d -exec bash -c \
    'cd "{}" && /data/www/bootstrap_gallery/dir_linker.sh && cd -' ';'
