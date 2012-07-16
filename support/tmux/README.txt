OVERVIEW

This adds Vim auto-saving support when running within tmux.
When any command is run on the command line, be it `ls` or 
even just hitting ENTER, all Vim sessions running within
this tmux session will be written.


INSTALL

Add the following to your .bash_profile, .bashrc, or .profile

  source ~/.vim/support/tmux/autowrite-vim.sh

ACKNOWLEDGEMENTS

Thanks go out to the Casecommons team for developing this 
autosave solution. Please see the original files at
https://github.com/Casecommons/vim-config
and 
https://github.com/Casecommons/casecommons_workstation
