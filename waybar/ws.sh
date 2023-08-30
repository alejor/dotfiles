#!/bin/bash
NUM_OUTPUTS=$(swaymsg -t get_outputs | jq '.| length')
CUR_OUTPUT=$(swaymsg -t get_outputs | jq -r ".[] | select(.focused).name")
CUR_WORKSPACE=$(swaymsg -t get_workspaces | jq -r ".[] | select(.focused).num")
WORKSPACE_CUR_OUT=$(swaymsg -t get_workspaces | jq -r ".[] | select(.output == \"$CUR_OUTPUT\").num " | sort -n )
WORKSPACE_OTH_OUT=$(swaymsg -t get_workspaces | jq -r ".[] | select(.output != \"$CUR_OUTPUT\").num " | sort -n )

TO_WORKSPACE=$CUR_WORKSPACE

if [ $1 == "next" ]; then
	while echo $WORKSPACE_CUR_OUT | grep -q $TO_WORKSPACE &> /dev/null ||
	      echo $WORKSPACE_OTH_OUT | grep -q $TO_WORKSPACE &> /dev/null
	do
	    echo exists
            TO_WORKSPACE=$(expr $TO_WORKSPACE + $NUM_OUTPUTS)
	    echo $TO_WORKSPACE
    done
fi
if [ $1 == "prev" ]; then
	while echo $WORKSPACE_CUR_OUT | grep -q $TO_WORKSPACE &> /dev/null ||
	      echo $WORKSPACE_OTH_OUT | grep -q $TO_WORKSPACE &> /dev/null
	do
	    echo exists
            TO_WORKSPACE=$(expr $TO_WORKSPACE - $NUM_OUTPUTS)
	    echo $TO_WORKSPACE
    done
fi

swaymsg workspace number $TO_WORKSPACE
