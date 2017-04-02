#!/bin/bash

for i in "$@" ; do
  if [[ $i == "--YCM-clang" ]] ; then
    YCM_CLANG=true
  elif [[ $i == "--YCM-install-libs" ]] ; then
    YCM_LIB=true
    break
  fi
done

if [ "$YCM_LIB" = true ] ; then
  # These are only necessary for YouCompleteMe to support support
  # for C-family languages:
  echo "Installing library necessary for YouCompleteMe"
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # The OS is Mac OSX
    # Install/update brew if necessary
    which -s brew
    if [[ $? != 0 ]] ; then
      # Install Homebrew
      # https://github.com/mxcl/homebrew/wiki/installation
      /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
    else
      brew update
    fi

    # Install pre-requisit for YouCompleteMe
    brew install cmake && brew install vim
    brew install macvim --with-override-system-vim
    brew link macvim
    xcode-select --install
    sed -i 's/colorscheme solarized/colorscheme industry/g' vimrc

  elif [[ "$OSTYPE" == "linux"* ]]; then
    # The OS is Ubuntue
    # Install pre-requisit for YouCompelteMe
    sudo apt-get install build-essential cmake
    sudo apt-get install python-dev python3-dev
  fi
fi

mkdir backup
mv ~/.vim ~/.vimrc ~/.gvimrc backup
# Linke required files for vim setup
mkdir vim
mkdir vim/bundle
ln -s $PWD/vim ~/.vim
ln -s $PWD/Vundle.vim $PWD/vim/bundle/Vundle.vim
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/gvimrc ~/.gvimrc

# Install vim plugings
vim +PluginInstall +qall

# Install YouCompleteMe
cd vim/bundle/YouCompleteMe
if [ "$YCM_CLANG" = true ] ; then
  ./install.py --clang-completer
else
  ./install.sh
fi

