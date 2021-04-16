#!/bin/sh
CUR_OUTPUT=$(swaymsg -t get_outputs | jq -r ".[] | select(.focused).name")
echo $CUR_OUTPUT

CUR_WORKSPACE=$(swaymsg -t get_workspaces | jq -r ".[] | select(.focused).num")
echo $CUR_WORKSPACE

WORKSPACE_CUR_OUT=$(swaymsg -t get_workspaces | jq -r ".[] | select(.output == \"$CUR_OUTPUT\").num " | sort -n )
WORKSPACE_OTH_OUT=$(swaymsg -t get_workspaces | jq -r ".[] | select(.output != \"$CUR_OUTPUT\").num " | sort -n )

echo $WORKSPACE_CUR_OUT
echo $WORKSPACE_OTH_OUT
TO_WORKSPACE=$CUR_WORKSPACE

if [ $1 == "next" ]; then
	while echo $WORKSPACE_CUR_OUT | grep -q $TO_WORKSPACE &> /dev/null ||
	      echo $WORKSPACE_OTH_OUT | grep -q $TO_WORKSPACE &> /dev/null
	do
	    echo exists
            TO_WORKSPACE=$(expr $TO_WORKSPACE + 1)
	    echo $TO_WORKSPACE
    done
fi
if [ $1 == "prev" ]; then
	while echo $WORKSPACE_CUR_OUT | grep -q $TO_WORKSPACE &> /dev/null ||
	      echo $WORKSPACE_OTH_OUT | grep -q $TO_WORKSPACE &> /dev/null
	do
	    echo exists
            TO_WORKSPACE=$(expr $TO_WORKSPACE - 1)
	    echo $TO_WORKSPACE
    done
fi

swaymsg workspace number $TO_WORKSPACE
