INSTALLATION:

    git clone https://github.com/rthrmt/dotfiles ~/.dotfiles

CREATE SYMLINKS:

    run create_symlink.sh

DOWNLOAD SUBMODULES:

    cd ~/.dotfiles
    git submodule update --init --recursive
    # --recursive because of jedi inside of jedi-vim
    
    # for updating
    git submodule foreach git pull origin master


INSTALL FONTS:
(installs powerline patched fonts)

    .cd ~/.dotfiles
    .setup_fonts.sh
