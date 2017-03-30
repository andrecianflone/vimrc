## My vimrc

This is my entire vimrc (vim settings) file. I have tried many plugins over the years and I feel the current setup is quite ideal. I've also added some custom vim functions and shortcuts.

## Installation
### 1. Download
You can simply download the `.vimrc` file to your local `~/.vimrc`. To keep your file in sync with mine or with your own repo, clone the repo and hardlink `~/.vimrc` to the `./vimrc` file in the repo:

``` bash
cd ~/Downloads
git clone git@github.com:proximacent/vimrc.git
cd ~
ln ~/Downloads/vimrc/.vimrc .vimrc # hardlink
```

### 2. Setup Vundle and Plugins
Before opening .vimrc, install Vundle:

``` bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Now launch `vim` and run `:PluginInstall`, and you're all set.


## The file is organized in the following sections:
1. Plugins: all plugins organized by Vundle
2. Plugin options: customize your plugins here
3. General settings: vim settings, such as tabs, syntax color, etc
4. Key remap: useful shortcuts, such as <kbd>F7</kbd> to launch NERDTree
5. Functions: my own Vim functions

## Custom features
Checkout the plugins' respective git page for info on the plugins. Here I highlight a few functions and feature which I wrote and find handy.

Note, your <kbd>leader</kbd> key is probably the backspace, <kbd>\</kbd>

### Switch Window function
This function is a huge timesaver. After splitting your views vertically with <kbd>CTRL-w</kbd><kbd>v</kbd>, you'll notice the windows are numbered. To switch to window `[2]`, simply type <kbd>\</kbd><kbd>2</kbd>.


### Todo lists
Pressing <kbd>leader</kbd><kbd>t</kbd> will generate a to-do list in a quickfix window. Jump to the next item in the list with <kbd>CTRL-j</kbd> and the previous with <kbd>CTRL-k</kbd>.

### Copy to clipboard
In normal mode, type `:Clip` and the entire buffer is copied to the clipboard. This requires `xclip` on Linux.

### Useful Remaps
Some key remaps I can't live without

- <kbd></kbd>
