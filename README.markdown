# Extended URL Launcher

This is a simple bash script I wrote that switches between browsers when clicking on a link inside a terminal. For example if you have a terminal + chromium open on workspace 4 and click a link inside that terminal, it will open a tab in chromium on workspace 4 instead of firefox on workspace 1 (your default browser). It works by searching your current workspace for matching browsers you've defined, if found it opens the link, otherwise it uses your first browser entry. 

## Dependencies

* wmctrl 
* awk
* grep

## How to use

1. Open the script and edit the `BROWSERS` array to your liking. `BROWSERS=( firefox chromium )`
2. Modify your terminal client to use this script. For example I use urxvt thus I modified my `.Xdefaults` file as follows: `URxvt.urlLauncher: /your/path/to/this/script.sh`
