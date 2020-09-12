#!/bin/bash

function getCurPaneAbsId
{
    tmux display-message -p "#{session_id}:#{window_id}.#{pane_id}"
}

function getCurWindowAbsId
{
    tmux display-message -p "#{session_id}:#{window_id}"
}

function getWindowIdFromPaneAbsId
{
    echo "$1" | sed -nE 's/(.*)%.*/\1/p'
}

function get_tmux_option()
{
    local option=$1
    local default_value=$2
    local option_value=$(tmux show-option -gqv "$1")

    if [[ -z $option_value ]]; then
        option_value=$default_value
    fi

    echo $option_value
}

