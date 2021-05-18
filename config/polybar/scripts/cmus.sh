#!/bin/bash

prepend_zero() {
        seq -f "%02g" $1 $1
}

artist=$(echo -n $(cmus-remote -C status | grep "tag artist" | cut -c 12-))

if [[ $artist = *[!\ ]* ]]; then
        track=$(echo -n $(cmus-remote -C status | grep tracknumber | cut -c 17-))
        song=$(echo -n $(cmus-remote -C status | grep title | cut -c 11-))
        album=$(echo -n $(cmus-remote -C status | grep album | cut -c 11-))
        echo -n "$track. $song - $artist - $album"
else
        echo
fi
