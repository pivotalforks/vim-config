" ----------
" Vim Config
" ----------
"
"
" How this works:
"
" This file is minimal.  Most of the vim settings and initialization is in
" several files in .vim/init.  This makes it easier to find things and to
" merge between branches and repos.
"
" Please do not add configuration to this file, unless it *really* needs to
" come first or last, like Pathogen and sourcing the machine-local config.
" Instead, add it to one of the files in .vim/init, or create a new one.

set nocompatible

execute pathogen#infect()

syntax on
filetype plugin indent on

runtime! init/**.vim

if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

au BufRead,BufNewFile *.hamlc set ft=haml

