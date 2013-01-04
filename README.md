fMacVim 
=======

== Introduction

Briefly, I don't see this as another collection of dotfiles, but a selection of
the best plugins and configs for those willing to enjoy the power of Vim on
their Mac.

**Simple**. I tried to have this in mind while I was building this "package".

Somehow I was inspired by [YADR](https://github.com/skwp/dotfiles), but I did
not wanted to have such a big package, I wanted to keep way simpler. I packed it
based on my own preferences, but I'm sharing it because someone may be
interested on my approach :)


== Installation

I provide you with tho options

=== 1) Easiest install: Drag and drop

I took MacVim, included all plugins and configs for you to Drag and Drop it into
your Applications directory.  

[Download](https://github.com/fbeeper/fMacVim)

=== 2) Easy install: Bash script

Another option is to clone this repo and execute the install script

``` git clone http://github.com/fbeeper/fMacVim.vim ./fvim.sh ``` 

Besides the oportunity of recustomization, this installation includes terminal
support for the customized Vim.


== Details details details!

* The best .vimrc I've been able to create. Even though I didn't kept it
  minimal, I've made an effort to organize and comment everything. You should
  take a look at it!

* A personal selection of essential vim plugins:

	* [pathogen.vim](http://github.com/tpope/vim-pathogen) (super easy plugin
	  management) by Tim Pope

	* [fugitive.vim](http://github.com/tpope/vim-fugitive) (nice git integration)
	  by Tim Pope

	* [Gitv](http://github.com/gregsexton/gitv) ('gitk clone' plugin for
	  fugitive) by Greg Sexton

	* [Solarized](http://github.com/altercation/vim-colors-solarized) (pleasant
	  colorscheme) by Ethan Schoonover

	* [NERDTree](https://github.com/scrooloose/nerdtree) (useful file system
	  explorer) by Martin Grenfell

	* [NERDCommenter](http://github.com/scrooloose/nerdcommenter) (comment your
	  code easily ,cl ,cu) by Martin Grenfell

	* [Powerline](http://github.com/Lokaltog/vim-powerline) (cool statusline
	  replacement) by Kim Silkebækken

	* [Signature](http://github.com/kshenoy/vim-signature) (pimped marks and
	  signs) by kshenoy

	* [Clang complete](http://github.com/Rip-Rip/clang_complete) (C/C++
	  completion using clang) by Xavier Deguillard

	* [Supertab](http://github.com/ervandew/supertab) (handy addition for text
	  completion) by Eric Van Dewoestine

	* [SnipMate](git clone http://github.com/garbas/vim-snipmate) (snippets
	  gallore!) originally by Michael Sanders but current package (and
	  dependencies) by Rok Garbas (Tom Link, Marc Weber, Honza Pokorny)

	* [Gundo](http://github.com/sjl/gundo.vim) (Looking for Lion's file
	  versioning?) by Steve Losh

	* [OpenGL and GLSL syntax hl](http://github.com/beyondmarc) (the missing
	  highlighting) by Marc Costa

* Key bindings:

Quick access to useful commands:

	* ``F1`` Toggle Gundo, navigate and use the history tree of your editions
	* ``F2`` Toggle NERDTree, navigate your FS right from Vim
	* ``F3`` Toggle PASTE mode, paste without breaking indentation 
	* ``F4`` Toggle Gitv, explore git history right from Vim 
	* ``F5``/``F6`` Change theme mode Dark/Light
	* ``F7`` Toggle invisibles
	* ``F8`` Run make
	* ``F9`` Activate auto-closing brackets
	* ``F10`` De-activate auto-closing brackets

Safari-like tab switching

	* ``Ctrl`` ``Tab``/``Ctrl`` ``Shift`` ``Tab`` Circle back and forth
	* ``Cmd`` ``1-9`` Go to specific tabs

Markers (powered by Signature)

	* ``m`` ``a-z`` Add local markers to the file (will display automatically
	  thanks to Signature) 
	* ``m`` ``A-Z`` Add global markers to the file (will display automatically
	  thanks to Signature)
	* ``\``` ``a-Z`` Jump to a local or global marker

Search

	* ``#`` and ``\*`` To search back and forth (working for visual selections
	  too!)
	* ``,`` ``Enter`` To remove search highlighting

Other remarked bindings

	* ``,cl``/``,cu`` Comment/uncomment lines thanks to NERDCommenter
	* ``zf``/``zd`` Create/Delete folds (configured to work manually and will be
	  preserved between sessions)
	* ``Space`` Will toggle folds in normal mode
	* ``,n`` Toggle line numbering mode in normal mode


== What's the future of fMacVim?

This is nowhere near to be perfect, so I expect to bring future updates.

* I should build .vimrc and .gvimrc separatedly to avoid having some warnings
  I'm getting right now :S
* I should consider splitting the .vimrc to make it easier to mantain

