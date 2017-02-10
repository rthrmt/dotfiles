### Installation

    git clone https://github.com/rthrmt/dotfiles ~/.dotfiles

### Create Symlinks:

    run create_symlink.sh

### Download and install vim-plug

For vim:

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

For neovim:

    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
### Install Fonts:
(installs powerline patched fonts)

    .cd ~/.dotfiles
    .setup_fonts.sh
