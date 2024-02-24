# My VIM / NeoVim Settings
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

## NeoVim Installation
1. Clone the repository

```console
$ git clone https://github.com/ervinpm/vim-settings.git
```

2. Copy neovim folder to `.config/nvim`

```console
$ cp -r vim-settings/nvim ~/.config
```

3. Create the undo folder

```sh
$ mkdir ~/.config/nvim/undodir
```

4. Install `xclip` to enable copy and pasting from system

```sh
$ sudo pacman -Syu xclip
```
