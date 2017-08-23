" Plugin:      easydir.vim
" Description: A simple to create, edit and save files and directories.
" Version:     1.1
" Last Change: 2017 Aug 23
" Maintainer:  Doug Yun | <doug.yun@dockyard.com>
"              DockYard, LLC 2013 | http://dockyard.com
" License:     MIT License (MIT) | Copyright 2013

if exists('loaded_easydir')
  finish
endif
let loaded_easydir = 1

augroup easydir
  au!
  au BufWritePre,FileWritePre * call <SID>create_and_save_directory()
augroup END

function <SID>create_and_save_directory()
  let s:directory = expand('<afile>:p:h')
  if s:directory !~# '^\(scp\|ftp\|dav\|fetch\|ftp\|http\|rcp\|rsync\|sftp\|file\):'
  \ && !isdirectory(s:directory)
    call mkdir(s:directory, 'p')
  endif
endfunction
