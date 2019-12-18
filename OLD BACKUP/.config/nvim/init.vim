" Nvim is based on Vim by Bram Moolenaar.
" If you are new to Vim see |help.txt|, or type ":Tutor".
" If you already use Vim see |nvim-from-vim| for a quickstart.

" ==============================================================================

" Transitioning from Vim				*nvim-from-vim*
" To start the transition, create ~/.config/nvim/init.vim with these contents:
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc

" Program to use for evaluating Python code. Setting this makes startup faster.
" Also useful for working with virtualenvs
  let g:python_host_prog   = '/usr/local/bin/python2'
  let g:python3_host_prog  = '/usr/local/bin/python3'
  let g:python3_host_skip_check = 1

" The |'ttymouse'| option, for example, was removed from Nvim (mouse support should work without it). If you use the same |vimrc| for Vim and Nvim, consider guarding |'ttymouse'| in your configuration like so:
    if !has('nvim')
        set ttymouse=xterm2
    endif

" Conversely, if you have Nvim specific configuration items, you could do this:
    if has('nvim')
        tnoremap <Esc> <C-\><C-n>
    endif

" ==============================================================================
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"  let g:deoplete#enable_at_startup = 1
"  let g:deoplete#sources = {}
"  let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
"  let g:tern#command = ['tern']
"  let g:tern#arguments = ['--persistent']
"  let g:tern_request_timeout = 1
"  let g:SuperTabClosePreviewOnPopupClose = 1
