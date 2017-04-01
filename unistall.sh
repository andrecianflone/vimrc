#!/bin/bash

rm -r ~/.vim 2> /dev/null
rm ~/.vimrc 2> /dev/null
rm ~/.gvimrc 2>  /dev/null
rm -rf vim/* 2> /dev/null

mv backup/.vim ~/ 2> /dev/null
mv backup/.vimrc ~/ 2> /dev/null
mv backup/.gvimrc ~/ 2> /dev/null

