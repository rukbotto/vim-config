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

This is a suggested list of color scheme / airline theme combinations that play
nice with each other.

|Color Scheme|Airline Theme|
|------------|-------------|
|TBD|base16_chalk|
|TBD|base16_default|
|TBD|base16_grayscale|
|TBD|base16_pop|
|alduin|hybridline|
|sierra|hybridline|
|TBD|qwq|
|TBD|understated|
|xoria256|wombat|
