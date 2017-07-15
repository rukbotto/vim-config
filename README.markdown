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

Create a `.vimrc.local` file so you can overwrite variables, setup color scheme
/ airline theme and add spelling settings:

```bash
$ touch ~/.vimrc.local
$ vim ~/.vimrc.local
```

## Color Scheme / Airline Theme Combinations

This is a suggested list of color schemes / airline themes that play nice with
each other:

|Color Scheme|Airline Theme|
|------------|-------------|
|alduin|hybridline|
|badwolf|base16_chalk|
|badwolf|base16_default|
|cabin|badcat|
|cabin|jellybeans|
|cabin|fairyfloss|
|evening|base16_grayscale|
|itg_flat|hybridline|
|sierra|hybridline|
|xoria256|base16_pop|
|xoria256|qwq|
|xoria256|term|
|xoria256|wombat|
