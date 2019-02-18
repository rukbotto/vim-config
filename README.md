# Vim Config

Vim configuration files. It offers the following features:

+ Support for HTML5, Jinja, mustache, pug and Haxe files
+ Improved support for Django template files
+ Support for vim sessions
+ Fuzzy finder
+ Snippets
+ Customizable

## Installation

Clone this repo in your home directory:

```
$ git clone https://github.com/rukbotto/vim-config.git ~/.vim
```

Then install [fzf](https://github.com/junegunn/fzf):

```
$ brew install fzf
```

## Usage

Link `.vimrc` file to your home directory:

```
$ ln -svf ~/.vim/vimrc ~/.vimrc
```

If you use MacVim, you may want to link `.gvimrc` file too:

```
$ ln -svf ~/.vim/gvimrc ~/.gvimrc
```

Create a `.local.vimrc` file so you can overwrite variables, setup color scheme, setup statusline or add spelling settings:

```
$ touch ~/.local.vimrc
$ vim ~/.local.vimrc
```

## Color schemes

After installing all plugins, you will be able to use any of the color schemes provided by [base16 plugin](https://github.com/chriskempson/base16-vim). To figure out the available themes, you can run the following command inside vim:

```
:colorscheme base16<Tab>
```

The autocompletion feature will show you the available _base16_ color schemes.

To apply a color scheme, just add the following to your `.local.vimrc` file:

```vim
colorscheme base16-circus
```

## Credits

+ [David Hodder](https://vim.sourceforge.io/account/profile.php?user_id=9589) for authoring [django.vim](https://vim.sourceforge.io/scripts/script.php?script_id=1487).
+ [Bruno Michel](http://github.com/nono), [Bruno Sutic](http://github.com/bruno-) and [Juvenn Woo](http://github.com/juvenn) for authoring [vim-mustache-handlebars](https://github.com/mustache/vim-mustache-handlebars).
