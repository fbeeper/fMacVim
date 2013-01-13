fMacVim 
=======

[MacVim](https://github.com/b4winckler/macvim) + essential plugins + my custom
.vimrc


Introduction 
------------

I don't see this as another collection of dotfiles, but a practical selection 
of the best plugins and configs for those willing to enjoy the power of Vim on
their Mac. I was inspired by [YADR](https://github.com/skwp/dotfiles) and
[spf13-vim](https://github.com/spf13/spf13-vim), but I did not wanted to have
such a big package, I wanted to **keep it even simpler**. 

If you don't like the idea of the complete package, **I strongly encourage you 
to scrabble and take anything you may like in here**! But I expect you to (at 
least) say hi if you like it :P This includes GNU/Linux users, because most of 
the code in here must work as well for you.


<br />
Installation
------------

I provide you with two options (the easy or the easiest):

### 1) Easy install

Another option is to clone this repositoty and execute the installation script:

	git clone git://github.com/fbeeper/fMacVim.git 
	cd fMacVim 
	./install.sh

Besides the opportunity of re-customization, this installation includes terminal
support for the customized Vim, including the Solarized theme.

### 2) Easiest install

I took [MacVim](https://github.com/b4winckler/macvim), included all plugins and
configs in the package for you to drag and drop it into your /Applications 
directory:

[Download and enjoy!](https://www.dropbox.com/s/258ayi5tmkddypb/fMacVim.dmg)

<br /> 
Details  
-------

fMacVim includes:

* The best .vimrc I've been able to curate (no blogger/githubber was harmed on
  this process :P). Even though I didn't kept it minimal, I've made an effort
  to organize and comment everything. You should take a look at it!

* A personal selection of essential vim plugins:

 * [Pathogen.vim](http://github.com/tpope/vim-pathogen) (super easy plugin
   management) by Tim Pope

 * [Solarized](http://github.com/altercation/vim-colors-solarized) (pleasant
   colorscheme) by Ethan Schoonover

 * [Powerline](http://github.com/Lokaltog/vim-powerline) (cool statusline
   replacement) by Kim Silkebækken

 * [Menlo patched for powerline](http://gist.github.com/1627888) (nice font
   with support for Powerline coolness) by Steve Losh

 * [NERDTree](https://github.com/scrooloose/nerdtree) (useful file system
   explorer) by Martin Grenfell

 * [NERDCommenter](http://github.com/scrooloose/nerdcommenter) (comment your
   code easily ,cl ,cu) by Martin Grenfell

 * [Signature](http://github.com/kshenoy/vim-signature) (easy marks and signs)
   by kshenoy

 * [Clang complete](http://github.com/Rip-Rip/clang_complete) (C/C++ completion
   using clang) by Xavier Deguillard

 * [Supertab](http://github.com/ervandew/supertab) (handy addition for text
   completion) by Eric Van Dewoestine

 * [SnipMate](git clone http://github.com/garbas/vim-snipmate) (snippets
   galore!) originally by Michael Sanders but current package by Rok Garbas

 * [Fugitive.vim](http://github.com/tpope/vim-fugitive) (nice git integration)
   by Tim Pope

 * [Gitv](http://github.com/gregsexton/gitv) ('gitk clone' plugin for fugitive)
   by Greg Sexton

 * [Gundo](http://github.com/sjl/gundo.vim) (Missing Lion's file
   versioning at Vim? :P) by Steve Losh

 * [OpenGL and GLSL syntax hl](http://github.com/beyondmarc) (the missing
   highlighting) by Marc Costa


* Custom key bindings:

 *Quick access to useful commands:*

 * ``F1`` Toggle Gundo, navigate and use the history tree of your editions
 * ``F2`` Toggle NERDTree, navigate your FS right from Vim
 * ``F3`` Toggle PASTE mode, paste without breaking indentation 
 * ``F4`` Toggle Gitv, explore git history right from Vim 
 * ``F5``/``F6`` Change theme mode Dark/Light
 * ``F7`` Toggle invisibles
 * ``F8`` Run make
 * ``F9`` Activate auto-closing brackets
 * ``F10`` De-activate auto-closing brackets

 *Safari-like tab switching*

 * ``Ctrl``+``Tab``/``Ctrl``+``Shift``+``Tab`` Circle back and forth
 * ``Cmd``+``1-9`` Go to specific tabs

 *Search*

 * ``#`` and ``*`` To search back and forth (working for visual selections
   too!)
 * ``,`` ``Enter`` To remove search highlighting

 *Other bindings*

 * ``,`` is mapped as Vim's ``<leader>`` (just in case you look for it)
 * ``,`` ``cl``/``cu`` Comment/uncomment lines thanks to NERDCommenter
 * ``z`` ``f``/``d`` Create/Delete folds (configured to work manually and will
   be preserved between sessions)
 * ``Space`` Will toggle folds in normal mode
 * ``,`` ``n`` Toggle line numbering mode in normal mode
 * And a huge list of things Vim could do


Anyway, I strongly encourage you to have a look at my .vimrc to discover what
changes/customizations I've done! :D

<br />
What's the future of fMacVim?
-----------------------------

This is nowhere near to be perfect, so I expect to bring future updates.

* I don't like my own installer, I'm thinking what to do with that...
* An updater would be really necessary!
* I should build .vimrc and .gvimrc separately.
* I should consider splitting the .vimrc to make it easier to navigate/maintain.
* I will consider creating a custom Toolbar/Menu.
* A better documentation would be interesting, wouldn't it?
* I've got some shortcuts/functions I haven't added to this release I might add
  in the future. Or not... because it would mean not keeping this simple.
* I really want to make this package compatible for Linux too, with gtk-vim 
  instead :)

I'd be pleased to hear any comments, ideas, code, questions, or whatever you may
want to say!

You'll easily find me at: [github.com/fbeeper](https://github.com/fbeeper), or
[@fbeeper](http://twitter.com/fbeeper).

<br /> 
License 
------- 

JIC anybody asks, the Vim licence seems a good fit for any of the "work" I've
done packing this ;) For any other concerns about licensing, take a look at:

	:help license

