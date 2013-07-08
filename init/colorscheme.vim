set background=dark
colorscheme solarized

if colors_name == 'solarized'
  if has('gui_macvim')
    set transparency=0
  endif

  if !has('gui_running') && $TERM_PROGRAM == 'Apple_Terminal'
    let g:solarized_termcolors = &t_Co
    let g:solarized_termtrans = 1
    colorscheme solarized
  endif

  call togglebg#map("<F2>")
endif
