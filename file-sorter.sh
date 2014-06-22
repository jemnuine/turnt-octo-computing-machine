#!/usr/bin/env bash
scan_dir="/home/masterlei/testing1"
function fext {
    local path=$1
    cd $scan_dir
    local new_dir="$scan_dir/../${PWD##*/}""_2/"
    local new_file=$new_dir"${path##*.}"
    if [ ! -d $new_dir ]; then
        mkdir $new_dir
    fi
    if [ ! -d $new_file ]; then
        mkdir $new_file
    fi
    cp -v $path $new_file
}

FILES=$(find $scan_dir -type f )
for FILE in $FILES; do
    fext $FILE
done
