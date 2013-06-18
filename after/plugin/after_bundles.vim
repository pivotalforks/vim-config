" You can make commands run after plugins are loaded from the .vimrc (and
" init/ directory) like so:
"
"   autocmd User AfterBundles SomePluginCommand
"
" This lets you use commands defined in plugins, which haven't been created at
" .vimrc-time.

doautocmd User AfterBundles
