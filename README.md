INSTALLATION:

    git clone https://github.com/rthrmt/dotfiles ~/.dotfiles

CREATE SYMLINKS:

    run create_symlink.sh

DOWNLOAD SUBMODULES:

    cd ~/.dotfiles
    git submodules update --init --recursive
    # --recursive because of jedi inside of jedi-vim

NOTES:

    Install patched fonts for vim-airline:
        https://github.com/powerline/fonts
