# To Install

(Re)move ~/.vim and ~/.vimrc if you have them already, and run:

    mkdir -p ~/.vim
    cd ~/.vim
    git clone git://github.com/pivotal/vim-config.git .
    git submodule update --init
    ln -s ~/.vim/vimrc ~/.vimrc

# Updating

As long as your checkout is kept clean, you can easily update, rebase your local changes and update submodules with:

    cd ~/.vim && git pull --rebase ; git submodule update ; cd -

# Optional Extras

See the `support/` directory for optional extras and installation instructions. Currently: 

* support/tmux: adds auto-saving support when running in tmux
