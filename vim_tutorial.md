
Welcome to Vim! Hello speedcoding, goobye pain.

If you want to skip the niceties, checkout a list of useful Vim commands [here](https://drive.google.com/file/d/0ByV7wn2NzevOeGR6SzMxdFhEQWc/view?usp=sharing), and copy/paste a fullblown `~/.vimrc` config file [here](https://github.com/andrecianflone/vimrc/blob/master/vimrc)



# Vim bindings
The key to Vim are the keystrokes! No more mouse. Here we give an overview of the key topics to keep in mind. For a more complete list of useful commands, checkout [this list]( https://drive.google.com/file/d/0ByV7wn2NzevOeGR6SzMxdFhEQWc/view?usp=sharing)


## Modes
Vim has 3 common modes:
- **normal**: For navagation and selection. This is the default mode. Hit <kbd>ESC</kbd> to back to normal mode, or <kbd>jk</kbd> in my case
- **insert**: To insert new text. <kbd>i</kbd> shortcut. Also use keys such as <kbd>o</kbd> and <kbd>O</kbd>.
- **visual**: Block selection and editing. <kbd>v</kbd> and <kbd>CTRL-v</kbd>.


## Navigation
Basics:

```
h,j,k,l  basic movements, left/down/up/right
w,e,b    next word, end of word, previous word
5w       powered movement, move next 5th word
3fq      powered find "q" (find 3rd q)
%        when cursor on bracket or paren, go to matching
0,$      beginning,end of line
*, #     next, previous word under cursor
gg,G     go to beg,end of file
5G       go to line #, here 5th line
`.       Go to last position in change list.
g;       Go to [count] older position in change list.
g,       Go to [count] newer cursor position in change list.
gd       Go to function definition (under cursor)
```


## Navigating files
You can open a file from within Vim by typing <kbd>:e</kbd> followed by the file path. Eg relative path:
```
:e README.md
```

Or full path:
```
:e ~/.vimrc
```

To load files in your project, best to use a plugin such as NerTree, which I bind to key <kbd>F7</kbd>

## Visual
Block edit with <kbd>CTRL-v</kbd>
```
dfdfd
fdfd
fdfd
```

## Sessions
Save your sessions easily (Vim-Session plugin)
```
:SaveSession Name
```

Start Vim and choose previous session or file by typing `vim` directly in the shell.

## Window management
There are three common methods to manage current files being edited:
- **buffer**. Default method. Go to next buffer with <kbd>:bn</kbd>
- **windows**. Split vertically with <kbd>CTRL-w v</kbd> and horizontally with <kbd>CTRL-w s</kbd>
- **tabs**. New tab with <kbd>:tabedit</kbd>, switch tab with <kbd>gt</kbd>

## Align
Clean up your code by aligning multiple lines (requires Tabularize). For example:
```
def function():
    long_variable_name = 45
    short = 3
    medium_name = 99
```
With the cursor in the text, hit <kbd>tt</kbd>, and tell Tabularize along which char to align

## Commenting code
Use a plugin such as Nerd Commenter. Commenting is as easy as <kbd>\cc</kbd> and uncomment with <kbd>\cu</kbd>

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
