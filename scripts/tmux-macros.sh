#!/usr/bin/env bash

set -x

plugin_dir=$1

pane_id=$(tmux display-message -p '#S:#{window_index}.#{pane_index}')

tmux split-window "$plugin_dir/scripts/list-macros.sh $plugin_dir $pane_id"
