
" Perform an arbitrary command on a match in the quickfix list.
" 
" Example: the following will replace matches of foo with bar, and save the file
" if there has been a modification.
"
" :Cdo execute 's/foo/bar/ | update'
"
function! s:Cdo(command)
  crewind
  let error_count = len(getqflist())
  let i = 0
  while i < error_count
    let i = i + 1
    exe "cc ".i
    exe a:command
  endwhile
endfunction

" Perform the Cdo operation, but also do an 'update' to the file after its done.
"
" Example: the following will replace matches of foo with bar, and save the file
" if there has been a modification.
"
" :CdoUpdate s/foo/bar/
"
function! s:CdoUpdate(command)
  call s:Cdo("execute '". a:command ." | update'")
endfunction


function! s:Ldo(command)
  lrewind
  let error_count = len(getloclist(0))
  let i = 0
  while i < error_count
    let i = i + 1
    exe "ll ".i
    exe a:command
  endwhile
endfunction

" Perform the Ldo operation, but also do an 'update' to the file after its done.
"
" Example: the following will replace matches of foo with bar, and save the file
" if there has been a modification.
"
" :LdoUpdate s/foo/bar/
"
function! s:LdoUpdate(command)
  call s:Ldo("execute '". a:command ." | update'")
endfunction

command! -nargs=1 Cdo :call s:Cdo(<q-args>)
command! -nargs=1 Ldo :call s:Ldo(<q-args>)
command! -nargs=1 CdoUpdate :call s:CdoUpdate(<q-args>)
command! -nargs=1 LdoUpdate :call s:LdoUpdate(<q-args>)
