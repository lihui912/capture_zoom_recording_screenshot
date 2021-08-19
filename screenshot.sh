#!/bin/bash

#########################
# Written by Chin Li Hui
# for the sake of ease to submit teaching claim
#########################

PWD="$(pwd)"

print_help () {
        echo "Usage: $0 -p <output_prefix> -f <path_to_video_file>"
}

while getopts f:p: flag
do
        case "${flag}" in
                f) video_file=${OPTARG};;
                p) prefix=${OPTARG};;
                h) print_help ; exit;;
        esac
done

echo "Input video file: $video_file"

echo "Generating ${prefix}_screenshot_start.jpg"
ffmpeg -y -ss 100 -i "${video_file}" -q:v 5 -frames:v 1 "${PWD}"/"${prefix}"_screenshot_start.jpg -hide_banner -loglevel quiet

echo "Generating ${prefix}_screenshot_end.jpg"
ffmpeg -y -sseof -100 -i "${video_file}" -q:v 5 -frames:v 1 "${PWD}"/"${prefix}"_screenshot_end.jpg -hide_banner -loglevel quiet
