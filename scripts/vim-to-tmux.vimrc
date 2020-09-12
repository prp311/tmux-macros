set nocompatible

function! MySendLineToOtherPane()
    let line=getline('.')
    execute ":silent !tmux send-keys -t '.{last}' '" . line . "' Enter"
    execute ":redraw!"
    normal j
endfunction

function! MySendVisualSelectionToOtherPane() range
	let [line_start, column_start] = getpos("'<")[1:2]
	let [line_end, column_end] = getpos("'>")[1:2]

	let index = line_start

	while index <= line_end 
	    let line=getline(index)
	    execute ":silent !tmux send-keys -t '.{last}' '" . line . "' Enter"
	    let index += 1
	endwhile

	execute ":redraw!"
endfunction

noremap  <enter> :call MySendLineToOtherPane()<CR>
vnoremap <enter> :call MySendVisualSelectionToOtherPane()<CR>
