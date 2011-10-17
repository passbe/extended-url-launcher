#!/bin/bash
BROWSERS=( firefox chromium )

#checks DEPENDENCIES exist
function deps() {
    DEPENDENCIES="wmctrl awk grep"
    deps_ok=YES
    for dep in $DEPENDENCIES
    do
        if ! which $dep &>/dev/null; then
            echo -e "This script requires $dep to run but is not installed"
            deps_ok=NO
        fi
    done
    if [[ "$deps_ok" == "NO" ]]; then
        echo -e "Unmet dependencies ^"
        echo -e "Aborting!"
        exit 1
    else
        return 0
    fi
}

#check dependencies
deps

#get workspace number
id=`wmctrl -d | awk '$2 == "*" { print $1; exit }'`

#go through browsers checking if they exists in this workspace
for b in ${BROWSERS[@]}
do
    #check for browser
    bool=`wmctrl -l | awk '$2 == "'$id'" { print; }' | grep -ci "$b"`
    if [ $bool -gt 0 ]; then

        #execute with first argument as URL
        prog="$b $1"
        $prog
        exit
    fi
done

#executes first browser (assumed default) with first argument as URL
prog="${BROWSERS[0]} $1"
$prog
exit
