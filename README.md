
fMacVim 
=======

[MacVim](https://github.com/b4winckler/macvim) + essential plugins + my custom
.vimrc


**I don't know if this works at the moment. Download it at your own risk :P**

Introduction 
------------

I don't see this as another collection of dotfiles, but a selection of
the best plugins and configs for those willing to enjoy the power of Vim on
their Mac.

Somehow I was inspired by [YADR](https://github.com/skwp/dotfiles) and
[spf13-vim](https://github.com/spf13/spf13-vim), but I did not wanted to have
such a big package, I wanted to **keep it simpler**. 

<br />
Installation
------------

I provide you with two options:

### 1) Easy install

Another option is to clone this repo and execute the installation script

	git clone git://github.com/fbeeper/fMacVim.git 
	cd fMacVim 
	./fvim.sh

Besides the oportunity of re-customization, this installation includes terminal
support for the customized Vim.

### 2) Easiest install

I took [MacVim](https://github.com/b4winckler/macvim), included all plugins and
configs for you to drag and drop it into your /Applications directory:

[Download](https://github.com/fbeeper/fMacVim)

<br />
Details  
------------------------

fMacVim includes:

* The best .vimrc I've been able to curate (no blogger/githubber was harmed on
  this process :P).  Even though I didn't kept it minimal, I've made an effort
  to organize and comment everything. You should take a look at it!

* A personal selection of essential vim plugins:

 * [Pathogen.vim](http://github.com/tpope/vim-pathogen) (super easy plugin
   management) by Tim Pope

 * [Solarized](http://github.com/altercation/vim-colors-solarized) (pleasant
   colorscheme) by Ethan Schoonover

 * [Powerline](http://github.com/Lokaltog/vim-powerline) (cool statusline
   replacement) by Kim Silkebækken

 * [NERDTree](https://github.com/scrooloose/nerdtree) (useful file system
   explorer) by Martin Grenfell

 * [NERDCommenter](http://github.com/scrooloose/nerdcommenter) (comment your
   code easily ,cl ,cu) by Martin Grenfell

 * [Signature](http://github.com/kshenoy/vim-signature) (pimped marks and signs)
   by kshenoy

 * [Clang complete](http://github.com/Rip-Rip/clang_complete) (C/C++ completion
   using clang) by Xavier Deguillard

 * [Supertab](http://github.com/ervandew/supertab) (handy addition for text
   completion) by Eric Van Dewoestine

 * [SnipMate](git clone http://github.com/garbas/vim-snipmate) (snippets
   gallore!) originally by Michael Sanders but current package by Rok Garbas

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

 * ``,`` is mapped as Vim's ``<leader>`` (just in case you need it)
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

* The installer could be improved, an updater would be really cool!
* I should build .vimrc and .gvimrc separatedly
* I should consider splitting the .vimrc to make it easier to maintain
* I will consider creating a custom Toolbar/Menu
* A better documentation of changes will be interesting, don't you think?

I'd be pleased to hear any comments, ideas, code, questions or whatever you may
want to say!

You'll easily find me at: [github.com/fbeeper](https://github.com/fbeeper) or
[@fbeeper](http://twitter.com/fbeeper)

<br /> 
License 
------- 

JIC anybody asks, the Vim licence seems a good fit ;)

