#!/bin/bash

function set_mode
{
    echo $2 > $1
}

export -f set_mode

function get_mode
{
    cat "$1"
}

export -f get_mode

function toggle_mode 
{
    opt=$(get_mode $1)

    if [[ $opt == "direct" ]]; then
        status="vim-edit option selected"
        set_mode $1 vim
    elif [[ $opt == "vim" ]]; then
        status="direct-paste option selected"
        set_mode $1 direct 
    fi

    tmux set-option display-time 1500
    tmux display -t "$2" "$status"
}

export -f toggle_mode

function main
{
    plugin_home=$1

    pane_id=$2

    source $plugin_home/scripts/tmux-utils.sh

    macros_dir=$(get_tmux_option '@tmux_macros_dir' "$HOME/.tmux-macros/")

    pipe="/tmp/tm-pipe.$$"

    set_mode $pipe direct

    sel_macro_file=$(ls $macros_dir | sed "s;$macros_dir;;" | fzf --preview "cat $macros_dir/{}" --preview-window=right:80% \
                --bind "ctrl-e:execute(toggle_mode $pipe $pane_id)" )

    opt=$(get_mode $pipe)

    rm -f "$pipe"

    if [[ $opt == "vim" ]]; then

        vim -u $plugin_home/scripts/vim-to-tmux.vimrc $macros_dir/$sel_macro_file

        exit 0;
    else

        first_iter=true

        while IFS= read -r line; do

            $first_iter || tmux send-keys -t "$pane_id" Enter

            tmux send-keys -t "$pane_id" "$line" 

            first_iter=false

        done < $macros_dir/$sel_macro_file
    fi
}

main "$@"
