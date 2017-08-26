# Vim Config

Vim configuration files.

## Installation

Clone this repo in your home directory:

```bash
$ git clone https://github.com/rukbotto/vim-config.git ~/.vim
```

Then install [fzf][3]:

```
$ brew install fzf
```

Next setup [Vundle][4]:

```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Finally install all plugins by running `:PluginInstall` from within Vim.

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

## Color Schemes

The `.vimrc` file included in this repo enables Vim's 24-bit color support,
making it possible to use color schemes for MacVim (or GVim) inside terminal
Vim.

This repo currently ships with a single color scheme called
[Base2Tone_SpaceDark][1] by [Braam de Haan][2]. It's not set by default, but if
you want to give it a try, place the following lines in your `.vimrc.local`
file:

```vim
set background=dark
colorscheme Base2Tone_SpaceDark
```

[1]: https://github.com/atelierbram/Base2Tone-vim
[2]: https://github.com/atelierbram/
[3]: https://github.com/junegunn/fzf
[4]: https://github.com/VundleVim/Vundle.vim
