## My vimrc
This is my entire vimrc (vim settings) file. I have tried many plugins over the years and I feel the current setup is quite ideal. I've also added some custom vim functions and shortcuts. I would invite you to read through the file to learn about all its features.

## System Requirements for YouCompleteMe
1. You need to use the official python distrubutor in shell (avoid from [anaconda](https://github.com/Valloric/YouCompleteMe/issues/1241))
2. You need [update your vim](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source).

## Installation
cd ~/git
``` bash
git clone --recursive git@github.com:mjlaali/vimrc.git
./install.sh
```
or to install YouCompleteMe with CLang support:
``` bash
./install.sh --YCM-clang --YCM-install-libs
```

Now launch `vim` and enjoy! you're all set.

## The file is organized in the following sections:
1. `Plugins`: all plugins organized by Vundle
2. `Plugin options`: customize your plugins here
3. `General settings`: vim settings, such as tabs, syntax color, etc
4. `Key remap`: useful shortcuts, such as <kbd>F7</kbd> to launch NERDTree
5. `Functions`: my own Vim functions

## Plugin highlights
Here are a few plugins you absolutely need to know about, check `.vimrc` for the rest. Remember to checkout the plugins' respective github page for usage info on the plugins. In case you're not aware, if the plugin name is `godlygeek/tabular`, then the webpage is `https://github.com/godlygeek/tabular`.

- `Vim startify`: simply type `vim` in your CLI, look at the beautiful menu
- `Vim-easymotion`: most used plugin ever. Type <kbd>leader</kbd><kbd>w</kbd>, now every word in the buffer has a quick shortcut combination. You can do the same with lines and more.
- `NERDtree`: tree explorer for Vim. Shortcut: <kbd>F7</kbd>
- `Vim session`: a session manager for Vim. Saved sessions will also appear in `Vim startify`.
- `Tabular`: align things easily in Vim. Shortcut: <kbd>t</kbd><kbd>t</kbd>

## Custom features
I'll highlight a few functions and feature which I wrote and find handy.

Note, your <kbd>leader</kbd> key is probably the backspace key.

### Switch Window function
This function is a huge timesaver. After splitting your views vertically with <kbd>CTRL-w</kbd><kbd>v</kbd>, you'll notice the windows are numbered. To switch to window `[2]`, simply type <kbd>leader</kbd><kbd>2</kbd>.


### Todo lists
Pressing <kbd>leader</kbd><kbd>t</kbd> will generate a to-do list in a quickfix window. Jump to the next item in the list with <kbd>CTRL-j</kbd> and the previous with <kbd>CTRL-k</kbd>.

### Copy to clipboard
In normal mode, type `:Clip` and the entire buffer is copied to the clipboard. This requires `xclip` on Linux.

### Useful Remaps
Some key remaps I can't live without.

- <kbd>j-k</kbd>: switch to normal mode. No more searching for <kbd>ESC</kdb>!!!
- <kbd>F7</kbd>: Toggle NERDTree
- <kbd>tt</kbd>: Shortcut for `:Tabularize /`, the second most used plugin ever.
- <kbd>F8</kbd>: Opens a tag bar on the right. Assumes you ran `ctags`.
- <kbd>F12</kbd>: Toggles "pastemode" on and off. Required when pasting code from clipboard.

## Fix solarized theme
If the solarized theme is not displaying properly, you need to set it up for Terminal as well. Simply do the following.

```
wget --no-check-certificate https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-dark
mv dircolors.ansi-dark .dircolors
eval `dircolors ~/.dircolors`
git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./set_dark.sh
rm -Rf gnome-terminal-colors-solarized
```
