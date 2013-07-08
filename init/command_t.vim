" Small default height for CommandT
let g:CommandTMaxHeight=20
let g:CommandTMaxFiles=20000

" Make ESC work in CommandT while in terminal Vim
if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap=['<ESC>']
end
