# Vim Config

Vim configuration files.

## Included plugins

### Color schemes

- [Rainglow colorscheme](https://github.com/rainglow/vim)

### Additional file type support

- [Dotenv](https://github.com/tpope/vim-dotenv)

### Code/file navigation

- [FZF](https://github.com/junegunn/fzf.vim)
- [Unimpaired](https://github.com/tpope/vim-unimpaired)
- [Vinegar](https://github.com/tpope/vim-vinegar)

### Snippets

- [Ultisnips](https://github.com/SirVer/ultisnips)
- [Honza's snippet collection](https://github.com/honza/vim-snippets)

### Utilities

- [Case convert](https://github.com/chiedo/vim-case-convert)
- [Commentary](https://github.com/tpope/vim-commentary)
- [Obsession](https://github.com/tpope/vim-obsession)
- [Surround](https://github.com/tpope/vim-surround)

### Version control

- [Git gutter](https://github.com/airblade/vim-gitgutter)

### Writing

- [Goyo](https://github.com/junegunn/goyo.vim)
- [Limelight](https://github.com/junegunn/limelight.vim)

## Installation

Install FZF. (<https://github.com/junegunn/fzf#installation>)

Clone this repo in your home directory:

```
$ git clone --recursive https://github.com/rukbotto/vim-config.git ~/.vim
```

## Usage

Link `vimrc` file to your home directory:

```
$ ln -svf ~/.vim/vimrc ~/.vimrc
```

Link `gvimrc` file to your home directory:

```
$ ln -svf ~/.vim/gvimrc ~/.gvimrc
```

Create a `.local.vimrc` file so you can activate optional plugins, setup the color scheme or add spelling settings:

```
$ touch ~/.local.vimrc
$ vim ~/.local.vimrc
```
