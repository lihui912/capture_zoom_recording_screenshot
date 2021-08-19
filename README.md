A simple Bash script to capture screenshots from 100th seconds and 100th seconds from the end of the video for submitting the claim.

## Requirement: ##

This script uses FFMpeg to generate the screenshots. Run `apt install ffmpeg` if your computer hasn't had one yet.

## Usage: ##

`./screenshot.sh -f <input_file> -p <prefix>` 

### Example: ###

`./screenshot.sh -f zoom_0.mp4 -p 20210819`

`./screenshot.sh -f "Path with space/zoom_0.mp4" -p 20210819`

The above command will write `20210819_screenshot_start.jpg` and `20210819_screenshot_end.jpg` in the current working directory.
