# Vim Config

Rukbotto's Vim configuration files. It offers the following features:

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

```
$ ln -svf ~/.vim/.vimrc ~/.vimrc
```

If you use MacVim, you may want to link `.gvimrc` file too:

```
$ ln -svf ~/.vim/.gvimrc ~/.gvimrc
```

Create a `.vimrc.local` file so you can overwrite variables, setup color scheme,
setup statusline or add spelling settings:

```
$ touch ~/.vimrc.local
$ vim ~/.vimrc.local
```

## Color schemes

After installing all plugins, you will be able to use any of the color schemes
provided by [base16 plugin][13]. To figure out the available themes, you can
run the following command inside vim:

```
:colorscheme base16<Tab>
```

The autocompletion feature will show you the available _base16_ color schemes.

To apply a color scheme, just add the following to your `.vimrc` file:

```vim
colorscheme base16-circus
```

## Credits

+ [David Hodder][5] for authoring [django.vim][6].
+ [Bruno Michel][7], [Bruno Sutic][8] and [Juvenn Woo][9] for authoring [vim-mustache-handlebars][10].
+ [Braam de Haan][2] for authoring [Base2Tone_SpaceDark][1] color scheme.
+ [John-Paul Bader][12] for authoring [smyck][11] color scheme.

[1]: https://github.com/atelierbram/Base2Tone-vim
[2]: https://github.com/atelierbram/
[3]: https://github.com/junegunn/fzf
[4]: https://github.com/VundleVim/Vundle.vim
[5]: https://vim.sourceforge.io/account/profile.php?user_id=9589
[6]: https://vim.sourceforge.io/scripts/script.php?script_id=1487
[7]: http://github.com/nono
[8]: http://github.com/bruno-
[9]: http://github.com/juvenn
[10]: https://github.com/mustache/vim-mustache-handlebars
[11]: https://github.com/hukl/Smyck-Color-Scheme/
[12]: https://github.com/hukl
[13]: https://github.com/chriskempson/base16-vim
