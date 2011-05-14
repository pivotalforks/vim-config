"pathogen setup
filetype off "This is to get around a bug
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"see vim-rails plugin doc [rails.txt]
set nocompatible  "Remove compatibility with vi
syntax on "Syntax highlighting
filetype plugin indent on

"ack current word in command mode
function! AckGrep()
  let command = "ack ".expand("<cword>")
  cexpr system(command)
  cw
endfunction

function! AckVisual()
  normal gv"xy
  let command = "ack ".@x
  cexpr system(command)
  cw
endfunction

" SHORTCUT KEY MAPPINGS """""""""""""""""""

"prev/next in quickfix file listing (e.g. search results)
map <M-D-Down> :cn<CR>
map <M-D-Up> :cp<CR>

"opt-cmd-arrows [next & previous open files]
map <M-D-Left> :bp<CR>
map <M-D-Right> :bn<CR>

"indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

"Undo/Redo using undo tree with cmd-z/cmd-shift-z
"Doesn't MacVim already have this?
map <D-z> :earlier 1<CR>
map <D-Z> :later 1<CR>

" File tree browser - backslash
map \ :NERDTreeToggle<CR>

" File tree browser showing current file - pipe (shift-backslash)
map \| :NERDTreeFind<CR>

"strip trailing whitespace on save for code files
"cocoa
autocmd BufWritePre *.m,*.h,*.c,*.mm,*.cpp,*.hpp :%s/\s\+$//e
"rails
autocmd BufWritePre *.rb,*.yml,*.js,*.json,*.css,*.less,*.sass,*.html,*.xml,*.erb,*.haml :%s/\s\+$//e
"misc
autocmd BufWritePre *.java,*.php,*.feature :%s/\s\+$//e

"highlight JSON files as javascript
autocmd BufRead,BufNewFile *.json set filetype=javascript

"highlight jasmine_fixture files as HTML
autocmd BufRead,BufNewFile *.jasmine_fixture set filetype=html

"highlight some other filetypes as ruby
au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile *.god set filetype=ruby
au BufRead,BufNewFile Gemfile* set filetype=ruby
au BufRead,BufNewFile Vagrantfile set filetype=ruby
au BufRead,BufNewFile soloistrc set filetype=ruby
" SETTINGS """"""""""""""""""""""""""""""""
"set t_Co=256
colorscheme vividchalk
colorscheme solarized
set background=dark

"Show whitespace, utf8 thing for trailing whitespace, and show tabs
set list
set listchars=tab:▸\ ,trail:.

"Don't make noise
set visualbell

"Allow the cursor to display plast the line one char
set virtualedit=onemore

"No swap or backup files
set noswapfile
set nobackup
set nowritebackup

"no toolbar
set guioptions-=T

"Search should be case sensitive only to uppercase chars
set ignorecase
set smartcase

"no gui tab bar
set guioptions-=e

"no scrollbars
set guioptions-=rL

"font
set guifont=Inconsolata:h24 "Huge and not always there ...
set guifont=Monaco:h18

"history size
set history=1024

"incremental search
set incsearch

"no wrapping
set nowrap

"line numbers
set number

"always show statusline
set laststatus=2

"show matching brackets
set showmatch

"tab settings
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab


" Rayban & Peter
let mapleader = ","

" FuzzyFinder and switchback commands
map <leader>e :e#<CR>
map <leader>b :FufBuffer<CR>
map <leader>f <Plug>PeepOpen
map <leader><C-N> :FufFile **/<CR>
map <D-e> :FufBuffer<CR>
map <D-N> :FufFile **/<CR>

" search
nmap <leader>s :%s/
vmap <leader>s :s/

" Split screen vertically and move between screens.
map <leader>v :vsp<CR>
map <leader>w ^Ww
map <leader>= ^W=

" Move between horizontally split screens.
map <leader>j ^Wj
map <leader>k ^Wk

" Add new windows towards the right and bottom.
set splitbelow splitright

" AckGrep current word
map <leader>a :call AckGrep()<CR>
" AckVisual current selection
vmap <leader>a :call AckVisual()<CR>

" set question mark to be part of a VIM word. in Ruby it is!
autocmd FileType ruby set iskeyword=@,48-57,_,?,!,192-255
autocmd FileType scss set iskeyword=@,48-57,_,-,?,!,192-255

" Insert ' => '
autocmd FileType ruby imap  <Space>=><Space>

" reload .vimrc
map <leader>rv :source ~/.vimrc<CR>

" refresh the FuzzyFinder cache
map <leader>rf :FufRenewCache<CR>

" ctags again with gemhome added
map <leader>t :!/usr/local/bin/ctags -R --exclude=.git --exclude=log * `rvm gemhome`/*<CR>
map <leader>T :!rdoc -f tags -o tags * `rvm gemhome` --exclude=.git --exclude=log

" git blame
map <leader>g :Gblame<CR>

" F7 reformats the whole file and leaves you where you were (unlike gg)
map <silent> <F7> mzgg=G'z :delmarks z<CR>:echo "Reformatted."<CR>

" Write all writeable buffers when changing buffers or losing focus.
autocmd FocusLost * silent! wall
set autowriteall

" Let unsaved buffers exist in the background.
set hidden

" Show typed command prefixes while waiting for operator.
set showcmd

" In insert mode, use Cmd-<CR> to jump to a new line in insert mode, a la
" TextMate.
imap <D-CR> <ESC>o


" Change background color when inserting.
let g:insert_mode_background_color = "#18434E"

" Find unused cucumber steps.
command! CucumberFindUnusedSteps :call CucumberFindUnusedSteps()
function! CucumberFindUnusedSteps()
  let olderrorformat = &l:errorformat
  try
    set errorformat=%m#\ %f:%l
    cexpr system('bundle exec cucumber --no-profile --no-color --format usage --dry-run features \| grep "NOT MATCHED BY ANY STEPS" -B1 \| egrep -v "(--\|NOT MATCHED BY ANY STEPS)"')
    cwindow
  finally
    let &l:errorformat = olderrorformat
  endtry
endfunction

" Open .vimrc file.  (Think Cmd-, [Preferences...] but with Shift.)
map <D-<> :tabedit ~/.vimrc<CR>

" Make command completion act more like bash
set wildmode=list:longest

" Start scrolling when the cursor is within 3 lines of the edge.
set scrolloff=3

" Scroll faster.
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Pad comment delimeters with spaces.
let NERDSpaceDelims = 1

" Comment/uncomment lines.
map <leader>/ <plug>NERDCommenterToggle

" Copy current file path to system pasteboard.
map <silent> <D-C> :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>

" Disable middle mouse button (which is easy to hit by accident).
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

" Make Y consistent with D and C.
map Y y$

" Don't time out during commands.
set notimeout

" Turn off <F1>
map <F1> <Nop>
imap <F1> <Nop>

" Don't prompt for file changes outside MacVim
set autoread

" Highlight current row.
set cursorline

" Use paste mode when replacing. (Work in progress.)
" vmap <silent> <C-K> :<C-U>call InPasteMode("<Plug>ReplaceVisual")<CR>
" function! InPasteMode(command)
  " let oldpaste = &l:paste
  " try
    " set paste
    " execute "normal" "gv".a:command
  " finally
    " let &l:paste = oldpaste
  " endtry
" endfunction

" Command-T
let g:CommandTMaxHeight=20
map <D-N> :CommandTFlush<CR>:CommandT<CR>

" Easy access to the shell.
map <Leader><Leader> :!

" (Keep this at the end.)
" Machine-local vim settings.
silent source ~/.vimrc.local

