#!/bin/bash

#########################
# Written by Chin Li Hui
# for the sake of ease to submit teaching claim
#########################

PWD="$(pwd)"
TIMESTAMP="$(date +%Y%m%d%H%M%S)"

while getopts f: flag
do
        case "${flag}" in
                f) filename=${OPTARG};;
        esac
done

echo "Filename: $filename";

echo "Generating start.jpg"
ffmpeg -y -ss 100 -i "${filename}" -q:v 5 -vframes 1 ${PWD}/"${TIMESTAMP}"screenshot_start.jpg -hide_banner -loglevel quiet

echo "Generating end.jpg"
ffmpeg -y -sseof -100 -i "${filename}" -q:v 5 -vframes 1 ${PWD}/"${TIMESTAMP}"screenshot_end.jpg -hide_banner -loglevel quiet
