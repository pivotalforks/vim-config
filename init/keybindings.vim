" Keybindings
" -----------

let mapleader = ","
let maplocalleader = ";"

" Gracefully handle holding shift too long after : for common commands
cabbrev W w
cabbrev Q q
cabbrev Wq wq
cabbrev Tabe tabe
cabbrev Tabc tabc

"set pastetoggle keybinding
set pastetoggle=<F2>

" Make Y consistent with D and C
map Y           y$

" Search
nmap <leader>s  :%s/
vmap <leader>s  :s/

" Split screen
map <leader>v   :vsp<CR>

" Move between screens
map <leader>w   ^Ww
map <leader>=   ^W=
map <leader>j   ^Wj
map <leader>k   ^Wk
nmap <C-j>      <C-w>j
nmap <C-k>      <C-w>k
nmap <C-h>      <C-w>h
nmap <C-l>      <C-w>l

" Open .vimrc file in new tab. Think Command + , [Preferences...] but with Shift.
map <D-<>       :tabedit ~/.vimrc<CR>

" Reload .vimrc
map <leader>rv  :source ~/.vimrc<CR>

" Undo/redo - Doesn't MacVim already have this?
map <D-z>       :earlier 1<CR>
map <D-Z>       :later 1<CR>

" Auto-indent whole file
nmap <leader>=  gg=G``
map <silent> <F7> gg=G`` :delmarks z<CR>:echo "Reformatted."<CR>

" Jump to a new line in insert mode
imap <D-CR>     <Esc>o

" Fast scrolling
nnoremap <C-e>  3<C-e>
nnoremap <C-y>  3<C-y>

" File tree browser
map \           :NERDTreeToggle<CR>

" File tree browser showing current file - pipe (shift-backslash)
map \|          :NERDTreeFind<CR>

" Previous/next quickfix file listings (e.g. search results)
map <M-D-Down>  :cn<CR>
map <M-D-Up>    :cp<CR>

" Previous/next buffers
map <M-D-Left>  :bp<CR>
map <M-D-Right> :bn<CR>

"indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

" FuzzyFinder and switchback commands
map <leader>e   :e#<CR>
map <leader>bb   :FufBuffer<CR>
map <leader><C-N> :FufFile **/<CR>
map <D-e> :FufBuffer<CR>
map <leader>n :FufFile **/<CR>
map <D-N> :FufFile **/<CR>

" Tab in insert mode should just indent
autocmd VimEnter * iunmap <tab>

" Command-T
map <D-N>       :CommandTFlush<CR>:CommandT<CR>
map <leader>F   :CommandTFlush<CR>:CommandT<CR>
map <leader>f   :CommandT<CR>

" ctags again with gemhome added
map <leader>rt :!/usr/local/bin/ctags -R --exclude=.git --exclude=log * `rvm gemhome`/*<CR>
map <leader>rT :!rdoc -f tags -o tags * `rvm gemhome` --exclude=.git --exclude=log

" Control P
let g:ctrlp_cmd = 'CtrlPMRU'

" Git blame
map <leader>g   :Gblame<CR>

" Comment/uncomment lines
map <leader>/   <plug>NERDCommenterToggle
map <D-/>       <plug>NERDCommenterToggle
imap <D-/>      <Esc><plug>NERDCommenterToggle i

" In command-line mode, <C-A> should go to the front of the line, as in bash.
cmap <C-A> <C-B>

" Copy current file path to system pasteboard
map <silent> <D-C> :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>
map <leader>C :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>

" Run tests
map <leader>t :wa<CR>:RunTestLine<CR>
map <leader>T :wa<CR>:RunTest<CR>
map <leader>tt :wa<CR>:RunTestAgain<CR>

map <F12> :write<CR>:RunTest<CR>
imap <F12> <ESC><F12>
map <F11> :write<CR>:RunTestLine<CR>
imap <F11> <ESC><F11>
map <F10> :write<CR>:RunTestAgain<CR>
imap <F10> <ESC><F10>
map <F9> :write<CR>:RunTestPrevious<CR>
imap <F9> <ESC><F9>

" Disable middle mouse button, F1
map <MiddleMouse>   <Nop>
imap <MiddleMouse>  <Nop>
map <F1>            <Nop>
imap <F1>           <Nop>

" Easy access to the shell
map <Leader><Leader> :!

" AckGrep current word
map <leader>a :call AckGrep()<CR>
" AckVisual current selection
vmap <leader>a :call AckVisual()<CR>

" Recalculate diff when it gets messed up.
nmap du :diffupdate<CR>

" Gundo.vim
map <leader>u :GundoToggle<CR>
