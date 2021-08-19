#!/bin/bash

#########################
# Written by Chin Li Hui
# for the sake of ease to submit teaching claim
#########################

PWD="$(pwd)"
FFMPEG="$(which ffmpeg)"

print_help () {
        echo "Usage: $0 -p <output_prefix> -f <path_to_video_file>"
}

check_required_inputs () {
        if [ -z "$video_file" ];
        then
                echo "Video file not provided. exit."
                print_help
                exit 255
        fi

        return 0
}

while getopts f:p: flag
do
        case "${flag}" in
                f) video_file=${OPTARG};;
                p) prefix=${OPTARG};;
                h) print_help ; exit;;
                *) print_help ; exit 1;;
        esac
done

if [ -z "$FFMPEG" ];
then
        echo "ffmpeg not found. Exit with error."
        exit 255
fi

check_required_inputs "${video_file}"

echo "Input video file: $video_file"

echo "Generating ${prefix}_screenshot_start.jpg"
ffmpeg -y -ss 100 -i "${video_file}" -q:v 5 -frames:v 1 "${PWD}"/"${prefix}"_screenshot_start.jpg -hide_banner -loglevel quiet

echo "Generating ${prefix}_screenshot_end.jpg"
ffmpeg -y -sseof -100 -i "${video_file}" -q:v 5 -frames:v 1 "${PWD}"/"${prefix}"_screenshot_end.jpg -hide_banner -loglevel quiet
