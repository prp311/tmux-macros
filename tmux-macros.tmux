#!/usr/bin/env bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $current_dir/scripts/tmux-utils.sh

key=$(get_tmux_option tmux_macros_key "F1")

macros_dir=$(get_tmux_option '@tmux_macros_dir' "$HOME/.tmux-macros/")

tmux unbind-key -n $key 

tmux bind-key -n $key run-shell "$current_dir/scripts/tmux-macros.sh $current_dir"
