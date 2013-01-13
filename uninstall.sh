#!/bin/bash

echo -ne "\x1B[00;34m\nBye bye!\n"
echo -ne "This will uninstall fbeeper's MacVim package from your system! \x1B[00m\n"
echo -ne "***************************************************************\n\n"

rm -rf /Applications/MacVim.app
rm -rf /usr/local/bin/mvim
rm -rf $HOME/.vimrc
rm -rf $HOME/.vim
rm -rf $HOME/Library/Fonts/Menlo-ForPowerline.ttc

echo -ne " \x1B[00;32mDONE\x1B[00m\n"

