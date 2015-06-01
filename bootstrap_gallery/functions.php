<?php
function printArray($arr) {
    foreach ($arr as $item) {
        echo $item . "<br>";
    }
}

function getDirParts($dir) {
    return explode('/', $dir);
}

function photoToThumb($photo) {
    return ".thumb." . $photo;
}

function genThumb($photo, $thumbnails) {
    $thumbKey = photoToThumb($photo);
    if(in_array($thumbKey, $thumbnails)) {
        return;
    }

    $photoEscaped = str_replace(" ", "\ ", $photo);
    $thumbEscaped = photoToThumb($photoEscaped);
    shell_exec("convert -thumbnail 128x128 " . $photoEscaped . " " . $thumbEscaped);
}

function genAllThumbs($photos) {
    $thumbnails = glob('.thumb.*.[Jj][Pp][Gg]');
    foreach($photos as $photo) {
        genThumb($photo, $thumbnails);
    }
    $thumbnails = glob('.thumb.*.[Jj][Pp][Gg]');
    return $thumbnails;
}

function addPhotoWithThumb($photo, $thumb) {
echo <<<EOM
<a href="$photo" title="$photo" data-gallery>
<img height=128 weidth=128 src="$thumb" alt="$thumb">
</a>
EOM;
}

function addThumbsToGallery() {
    $photos = glob('*.[Jj][Pp][Gg]');
    $thumbnails = genAllThumbs($photos);
    foreach($photos as $photo) {
        addPhotoWithThumb($photo, ".thumb." . $photo);
    }
}
?>
