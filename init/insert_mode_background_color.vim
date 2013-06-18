" Change background color when inserting.
" (Broken in terminal Vim: Solarized has a bug which makes it reload poorly.)
" http://www.reddit.com/r/vim/comments/ggbcp/solarized_color_scheme/
if has("gui_running")
  " Commented out to support vim-powerline
  " let g:insert_mode_background_color = "#18434E"
end
