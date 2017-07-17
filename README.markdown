# Vim Config

Vim configuration files.

## Installation

Clone this repo in your home directory:

```bash
$ git clone https://github.com/rukbotto/vim-config.git ~/.vim
```

## Usage

Link `.vimrc` file to your home directory:

```bash
$ ln -svf ~/.vim/.vimrc ~/.vimrc
```

If you use MacVim, you may want to link `.gvimrc` file too:

```bash
$ ln -svf ~/.vim/.gvimrc ~/.gvimrc
```

Create a `.vimrc.local` file so you can overwrite variables, setup color scheme,
setup statusline or add spelling settings:

```bash
$ touch ~/.vimrc.local
$ vim ~/.vimrc.local
```
