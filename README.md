# My VIM Settings
My default vim settings

## Installation
1. Install Vim Plug first
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
2. Copy `.vimrc` file to your home directory
3. Create undo folder
```sh
mkdir ~/.vim/undodir
```

## NeoVim
1. Install Vim Plug in the neovim config folder

```console
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

2. Copy neovim folder to `.config/nvim`
3. Create the undo folder

```sh
$ mkdir ~/.config/nvim/undodir
```

4. Install `xclip` to enable copy and pasting from system

```sh
$ sudo pacman -Syu xclip
```
