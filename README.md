A simple Bash script to capture screenshot from 100th seconds and 100th seconds from end of video for submitting claim.

Usage:

`./screenshot.sh -f <input_file> -p <prefix>` 

Example:

`./screenshot.sh -f zoom_0.mp4 -p 20210819`

`./screenshot.sh -f "Path with space/zoom_0.mp4" -p 20210819`

The above command will write `20210819_screenshot_start.jpg` and `20210819_screenshot_end.jpg` in current working directory.
