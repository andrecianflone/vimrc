
Welcome to Vim! Hello speedcoding, goobye pain.

If you want to skip the niceties, checkout a list of useful Vim commands [here](https://drive.google.com/file/d/0ByV7wn2NzevOeGR6SzMxdFhEQWc/view?usp=sharing), and copy/paste a fullblown `~/.vimrc` config file [here](https://github.com/andrecianflone/vimrc/blob/master/vimrc)



# Vim bindings
The key to Vim are the keystrokes! No more mouse

[Under Construction!]. For now, a list of [useful commands]( https://drive.google.com/file/d/0ByV7wn2NzevOeGR6SzMxdFhEQWc/view?usp=sharing)

# Plugins
Vim plugins can turn this minimalist text-editor into any application you want. Here we explore some useful Vim plugins to add IDE functionalities to Vim. Carefully choose plugins which don't slow down Vim. For example, below we recommend `gutentags` to manage tags which doesn't affect Vim, whereas other tag manager can slow Vim considerably.

## Installing plugins
The best way to manage Vim plugins is with an plugin manager. We recommend [Vundle](https://github.com/VundleVim/Vundle.vim). Installing Vundle is as simple as running:

```shell
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Now adding new plugins is as easy as adding the following line to `~/.vimrc`:
```
Plugin 'kshenoy/vim-signature'
```
And running the command `:PluginInstall` in Vim. Deleting the line and running the same command will delete the plugin!

## Tags in Vim
So IDEs use tag engines in the background, which you can also use with Vim.
First, you need to install the tag engine, If you have `sudo` access, try `sudo apt-get exuberant-ctags`. Otherwise download and compile the popular [Exuberant Ctags](https://github.com/fdinoff/exuberant-ctags).

When I use Vim, I like to toggle a side-window which shows all tags. To do that, add this plugin to `~/.vimrc` and install in the usual way:
```
Plugin `majutsushi/tagbar`
```

Now it would be nice if we can press a hotkey and toggle the tag sidebar! I chose <kbd>F8</kbd>. Add the following to `~/.vimrc`:
```
nmap <F8> :TagbarOpenAutoClose<CR>
```

Now the tag engine is setup and displaying the tags is easy. The final problem is automatically generating the tags! We don't want to call `ctags` in the terminal every time we want new tags.
The nifty `gutentag` plugin will automatically generate tags everytime you save you file, nice! Add the plugin to `~/.vimrc`:
```
Plugin `ludovicchabant/vim-gutentags`
```

Some technical details about `gutentags` (you can safely skip). So how `gutentags` works is that it looks at the current directory structure for clues to a "root" directory.
If the current directory or parent directory contains ".git", then it will start watching the whole structure for file changes and automatically update the `tags` file in the root directory. Vim also automatically watches the `tags` file for changes. Gutentag is a no-latency tag generator. It does not generate the whole file every time, it only adds new tags as needed as you code. You don't even notice it
