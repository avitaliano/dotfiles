" my custom function for opening up new lines without leaving normal mode
" as a bonus, the cursor point is unchanged
" TODO: I sequester the `z` mark. Maybe there's a better way to do this?
function! s:blankUp()
  execute "normal mzO\<esc>`z"
  silent! call repeat#set("\<Plug>(blankUp)", 1)
endfunction
nnoremap <Plug>(blankUp) :<C-u>call <SID>blankUp()<CR>
function! s:blankDown()
  execute "normal mzo\<esc>`z"
  silent! call repeat#set("\<Plug>(blankDown)", 1)
endfunction
nnoremap <Plug>(blankDown) :<C-u>call <SID>blankDown()<CR>
