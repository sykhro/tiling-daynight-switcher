#!/bin/sh
# Redshift hook to call the theme handler.
# You could honestly do all you need here,
# but this way cleanly integrates with other hooks.
# Just do whatever you like
case $3 in
    daytime)
        theme-handler.sh 0
        ;;
    night)
        theme-handler.sh 1
	;;
    transition)
        theme-handler.sh 1
	;;
esac

