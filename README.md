# tmux-macros - plugin for tmux

tmux-macros helps us execute frequently used tasks and texts retrieved easily. Macros are texts stored in files.
Each macro is stored in separate file under macros_dir directory(~/.macros_dir/ by default). Macros can be used 
to execute repeatable command set or frequenly reused text. Commands can be send to the active tmux pane shell.
Text can be send to currently open editor window.

This plugin also offers editing the macro and or selecting certain texts only.  It has two modes, 

    * direct-paste - sends the entire content of macro in one go
    * vim-edit     - opens the macro in a text editor and then user can press enter on the line that
                     need to be send to the active pane


# Installation Procedure

## Dependencies
    * fzf (should be available in PATH)
    * vim (should be available in PATH)
    * bash

## Using Tmux Plugin Manager

Add plugin to the list of TPM plugins in .tmux.conf:

    `set -g @plugin 'tmux-plugins/tmux-macros'`

Install the Plugin using TPM <Prefix> I
   
## Manual Installation

Clone the Plugin Code


```
mkdir -p $HOME/.tmux-plugins/tmux-macros/

git clone https://github.com/prp311/tmux-macros.git $HOME/.tmux-plugins/tmux-macros/ 
```

Add below line to $HOME/.tmux.conf

```
run-shell $HOME/.tmux-plugins/tmux-macros/
```
run command

```
tmux source $HOME/.tmux.conf
```

## Modifying default configuration, if needed

add lines to tmux.conf with modified values, if different directory and shortcut key is used

    `set -g @tmux_macros_dir '$HOME/.tmux-macros/'` 

    `set -g @tmux_macros_key 'F1'`

## set up macro directory

    create @tmux_macros_dir and add your macro files there

## Use the plugin

    Use @tmux_macros_key to access the plugin

    A new pane in opened with a listing of macro file names

    Select a file using arrow keys and press enter

    The selected files contents will be pasted on the active window.

## selecting partial text from macro file  

    In fzf pane, you can press ctrl-e to toggle between vim-edit mode and direct page mode
    After selectin vim-edit mode, press enter
    macro content will be opened in vim
    you can send desired lines to active pane, by pressing enter
    You can also edit the macro, here without affecting the original macro

