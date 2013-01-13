#!/bin/bash

echo -ne "\x1B[00;34m\nWelcome!\n"
echo -ne "This will install fbeeper's MacVim package in your system! \x1B[00m\n"
echo -ne "***************************************************************\n\n"
current_path="`pwd`"

confirm () {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case $response 
		in [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}





################################################################################
#										Check for MacVim, install if missing.  #
#										Via Homebrew or compiling it...		   #
################################################################################

brew_cmd=`which brew`
ruby_cmd=`which ruby`
clng_cmd=`which clang`
mvim_cmd=`find /Applications -name "MacVim.app" -maxdepth 1`
mvim_internals="/Applications/MacVim.app/Contents/Resources/vim"

echo -ne "Checking for installed MacVim..."
if [[ ! -d $mvim_cmd ]]
then
	echo -ne " \x1B[00;31mNO\x1B[00m\n"
	

	#echo -ne "Checking for Homebrew..."
	#if [[ ! -f $brew_cmd ]]
	#then
		
	#    echo -ne " \x1B[00;31mNO\n\x1B[00;34m"

	#    if confirm "Do you want to install Homebrew packet manager now? [y/N]" 
	#    then

	#        echo -ne "\x1B[00m"
	#        if [[ -f $ruby_cmd ]]
	#        then
	#            echo -ne "Installing Homebrew..."
	#            ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
	#            echo -ne " \x1B[00;32mDONE\x1B[00m\n"
	#            echo -ne "Installing MacVim (by Björn Winckler)..."
	#            $brew_cmd install macvim
	#            ln -s /usr/local/Cellar/macvim/7.3-65/MacVim.app /Applications
	#            echo -ne " \x1B[00;32mDONE\x1B[00m\n"
	#        else
	#            echo -ne "\x1B[00;31mYou need either XCode or Ruby on your system to proceed. Leaving!\n\x1B[00m"
	#            exit -1
	#        fi

	#    else

			echo -ne "\x1B[00m"
			if [[ -f $clng_cmd ]]
			then
				echo -ne "Compiling MacVim (by Björn Winckler)"
				git clone git://github.com/b4winckler/macvim.git /tmp/macvim
				cd /tmp/macvim/src
				CC=clang ./configure --with-features=huge \
					--with-tlib=ncurses \
					--enable-multibyte \
					--enable-perlinterp \
					--enable-pythoninterp \
					--enable-rubyinterp \
					--with-ruby-command=/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby \
					--enable-cscope \
					--with-macarchs=`uname -m` $@
				echo -ne "\nKeep Calm! this will take a while..."
				make
				cd MacVim/build/Release
				cp -R MacVim.app /Applications/MacVim.app
				rm -rf /tmp/macvim
				echo -ne " \x1B[00;32mDONE\x1B[00m\n"
			else
				echo -ne "\x1B[00;31mYou need XCode command line tools installed to proceed. Leaving!\n\x1B[00m"
				exit -1
			fi

	#    fi

	#else
	#    echo -ne " \x1B[00;32mYES\x1B[00m\n"
	#    echo -ne "Installing MacVim (by Björn Winckler)..."
	#    $brew_cmd install macvim
	#    echo -ne " \x1B[00;32mDONE\x1B[00m\n"
	#fi

else

	echo -ne " \x1B[00;32mYES\x1B[00m\n"
	echo -n "Backing up your previous configs..."
	for i in $mvim_internals/runtime/bundle $mvim_internals/runtime/autoload/pathogen.vim $mvim_internals/vimrc $mvim_internals/gvimrc; 
	do 
			[ -e $i ] && mv $i $i.old; 
	done
	echo -ne " \x1B[00;32mDONE\x1B[00m\n"
fi





################################################################################
#										Download and install confs and plugins #
################################################################################

echo -e "\n0) \x1B[00;34mInstalling Solarized Terminal theme\x1B[00m"
echo "   (by Ethan Schoonover + Tomislav Filipčić)"
echo "   Includes some personal customizations:"
echo -e "\t- Menlo patched for powerline (by Steve Losh)"
echo -e "\t- Shortcut to go to line ends fn + <- / ->"
echo -e "\t- Only visual bell alert"
echo "   *** Vim needs this to render the theme properly on the Terminal"
git clone git://gist.github.com/1627888.git /tmp/menlofp
unzip /tmp/menlofp/Menlo-ForPowerline.ttc.zip
mv Menlo-ForPowerline.ttc ~/Library/Fonts/Menlo-ForPowerline.ttc
rm -rf /tmp/menlofp
open "$current_path"/fSolarized.terminal
osascript -e 'tell application "Terminal"' -e 'close front window' -e 'end tell'
osascript -e 'tell application "Terminal" to set default settings to settings set "fSolarized"'
osascript -e 'tell application "Terminal" to set current settings of front window to settings set "fSolarized"'
echo -ne "   \x1B[00;32mDONE\x1B[00m\n"


echo -e "\n1) \x1B[00;34mMacVim has all config files in the bundle, but most Vim"
echo -e "   users come from Linux, so I've added some handy symlinks:\x1B[00m"
echo -e "\t/Applications/MacVim.app/"
echo -e "\t\tContents/Resources/vim/runtime/ <-- ~/.vim/"
echo -e "\t\tContents/Resources/vim/runtime/vimrc <-- ~/.vimrc"
ls -s $mvim_internals/runtime/ ~/.vim
ln -s $mvim_internals/vimrc ~/.vimrc
echo -ne "   \x1B[00;32mDONE\x1B[00m\n"


echo -e "\n2) \x1B[00;34mInstall plugins:\x1B[00m\n"
mkdir -p ~/.vim/autoload ~/.vim/bundle
echo -e "   * \x1B[00;36mpathogen.vim\x1B[00m (super easy plugin management)"
echo "     by Tim Pope"
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
##cd /tmp/
##git clone git://github.com/tpope/vim-pathogen.git
##cp /tmp/autoload/pathogen.vim ~/.vim/autoload/
##rm -rf /tmp/auto
echo -ne "     \x1B[00;32mDONE\x1B[00m\n"

cd ~/.vim/bundle
echo -e "\n   * \x1B[00;36mfugitive.vim\x1B[00m (nice git integration)"
echo "     by Tim Pope"
git clone git://github.com/tpope/vim-fugitive.git
echo -ne "     \x1B[00;32mDONE\x1B[00m\n"

echo -e "\n   * \x1B[00;36mGitv\x1B[00m ('gitk clone' plugin for fugitive)"
echo "     by Greg Sexton"
git clone git://github.com/gregsexton/gitv.git
echo -ne "     \x1B[00;32mDONE\x1B[00m\n"

echo -e "\n   * \x1B[00;36mSolarized\x1B[00m (pleasant colorscheme)"
echo "     by Ethan Schoonover"
git clone git://github.com/altercation/vim-colors-solarized.git
echo -ne "     \x1B[00;32mDONE\x1B[00m\n"

echo -e "\n   * \x1B[00;36mNERDTree\x1B[00m (useful file system explorer)" 
echo "     by Martin Grenfell" 
git clone git://github.com/scrooloose/nerdtree.git 
echo -ne " \x1B[00;32mDONE\x1B[00m\n"

echo -e "\n   * \x1B[00;36mNERDCommenter\x1B[00m (comment your code easily ,cl ,cu)"
echo "     by Martin Grenfell (again :P)"
git clone git://github.com/scrooloose/nerdcommenter.git
echo -ne "     \x1B[00;32mDONE\x1B[00m\n"

echo -e "\n   * \x1B[00;36mPowerline\x1B[00m (cool statusline replacement)"
echo "     by Kim Silkebækken"
git clone git://github.com/Lokaltog/vim-powerline.git
echo -ne "     \x1B[00;32mDONE\x1B[00m\n"

echo -e "\n   * \x1B[00;36mSignature\x1B[00m (pimped marks and signs)"
echo "     by kshenoy"
git clone git://github.com/kshenoy/vim-signature.git
echo -ne "     \x1B[00;32mDONE\x1B[00m\n"

echo -e "\n   * \x1B[00;36mClang complete\x1B[00m (C/C++ completion using clang)"
echo "     by Xavier Deguillard"
git clone git://github.com/Rip-Rip/clang_complete.git
echo -ne "     \x1B[00;32mDONE\x1B[00m\n"

echo -e "\n   * \x1B[00;36mSupertab\x1B[00m (handy addition for text completion)"
echo "     by Eric Van Dewoestine"
git clone git://github.com/ervandew/supertab.git
echo -ne "     \x1B[00;32mDONE\x1B[00m\n"

echo -e "\n   * \x1B[00;36mSnipMate\x1B[00m (snippets gallore!)"
echo "     originally by Michael Sanders but"
echo "     current package (and dependencies)"
echo "     by Rok Garbas (Tom Link, Marc Weber, Honza Pokorny)"
##git://github.com/msanders/snipmate.vim.git
git clone git://github.com/garbas/vim-snipmate.git
git clone git://github.com/tomtom/tlib_vim.git
git clone git://github.com/MarcWeber/vim-addon-mw-utils.git
git clone git://github.com/honza/snipmate-snippets.git
echo -ne "     \x1B[00;32mDONE\x1B[00m\n"

echo -e "\n   * \x1B[00;36mGundo\x1B[00m (Looking for Lion's file versioning?)"
echo "     by Steve Losh"
git clone http://github.com/sjl/gundo.vim.git
echo -ne "     \x1B[00;32mDONE\x1B[00m\n"

echo -e "\n   * \x1B[00;36mOpenGL and GLSL syntax hl\x1B[00m (the missing highlighting)"
echo "     by Marc Costa"
git clone git://github.com/beyondmarc/opengl.vim.git
git clone git://github.com/beyondmarc/glsl.vim.git
echo -ne "     \x1B[00;32mDONE\x1B[00m\n"


echo -e "\n3) \x1B[00;34mCustomizing vim\n\x1B[00m"

echo -e "   * \x1B[00;36mPatching MacVim tab-switching shortcuts\x1B[00m"
echo "     to switch tabs to browser-like Ctrl+Tab / Ctrl+Shift+Tab"
echo "     This is a workaround: mapping <C-t> in .vimrc is not working"
patch ~/.vim/menu.vim < "$current_path"/menu.patch

echo -e "\n   * \x1B[00;36mSetting up a pimped .vimrc\x1B[00m"
echo "     assembled by me (Ferran Poveda)"
mv -f "$current_path"/vimrc $mvim_internals/vimrc


echo -en "\n4) \x1B[00;34mCleaning cache, generating help tags, finishing...\x1B[00m"
vim +PowerlineClearCache +Helptags +q

cd "$current_path"
echo -ne " \x1B[00;32m100%! Enjoy!\x1B[00m\n"
echo -e "\n\x1B[00;33mMore info in the README file, or at \x1B[00;34mhttp://github.com/fbeeper/fMacVim\x1B[00m"
echo -e "\x1B[00;33mAll comments, ideas, code or/and cheers will be appreciated!\x1B[00m\n" 
