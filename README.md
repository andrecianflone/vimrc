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


## Custom features
Checkout the plugins' respective git page for info on the plugins. Here I highlight a few functions and feature I wrote.

**Switch Window**

This function is a huge timesaver. After splitting your views vertically with <kbd>CTRL+w<kbd> + <kbd>v<kbd>, you'll notice the windows are numbered. To switch to window `[2]`, simply type `leader` + `2`.
