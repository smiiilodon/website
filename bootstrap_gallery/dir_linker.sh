#!/bin/bash

# Make the pattern match on ls *.jpg case insensitive
shopt -s nocaseglob

symlink_dir() {
    ln -s /home/smilodon/public_html/bootstrap_gallery/img img
    ln -s /home/smilodon/public_html/bootstrap_gallery/css css
    ln -s /home/smilodon/public_html/bootstrap_gallery/js js
    ln -s /home/smilodon/public_html/bootstrap_gallery/index_template.php index.php
}

has_photos() {
    photo_ct=$(ls *.jpg | wc -l)
    if [ "$photo_ct" -gt "0" ]; then
        return 0
    else
        return 1
    fi
}

has_photos
if [ "$?" -eq 0 ]; then
    symlink_dir
fi
