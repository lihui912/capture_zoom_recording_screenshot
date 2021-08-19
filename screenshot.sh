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

check_video_file_exists () {
        if [ ! -f "$1" ];
        then
                echo "Video file not found: $1."
                echo "Exit with error."
                exit 255
        fi
}

print_execute_result () {
        if [ $1 -eq 0 ];
        then
                echo "Written $2"
        else
                echo "Error $1. Writing $2 error."
        fi
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
check_video_file_exists "${video_file}"

START_FILENAME="${prefix}"_screenshot_start.jpg
END_FILENAME="${prefix}"_screenshot_end.jpg

echo "Generating ${prefix}_screenshot_start.jpg"
ffmpeg -y -ss 100 -i "${video_file}" -q:v 5 -frames:v 1 "${PWD}"/"${START_FILENAME}" -hide_banner -loglevel quiet
print_execute_result $? "${START_FILENAME}"

echo "Generating ${prefix}_screenshot_end.jpg"
ffmpeg -y -sseof -100 -i "${video_file}" -q:v 5 -frames:v 1 "${PWD}"/"${END_FILENAME}" -hide_banner -loglevel quiet
print_execute_result $? "${END_FILENAME}"
