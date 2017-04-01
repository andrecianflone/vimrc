" VIM settings

set nocompatible              " be iMproved, required
filetype off                  " required

" =============================================================================
" PLUGINS
" =============================================================================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" SOLARIZED THEME
" opens file tree in new left pane, shortcut: F7 (see remap section)
Plugin 'altercation/vim-colors-solarized'

" FIXWHITESPACE
" Get rid of white spaces
" usage: :FixWhitespace
Plugin 'bronson/vim-trailing-whitespace'

" TAGBAR
" get overview of file structure by listing tags
Plugin 'majutsushi/tagbar'

" TABULAR
" align stuff easily!
" See the screen cast on gihub for quick tutorial.
" See shortcut below
Plugin 'godlygeek/tabular'

" Syntax for Markdown
Plugin 'plasticboy/vim-markdown'

" Syntastic, syntax checking
Plugin 'vim-syntastic/syntastic'

" CODE SNIPPETS
" Adds code snippets
" Eg write "for" and tab and you'll get a sample for loop"
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" VIM STARTIFY
Plugin 'mhinz/vim-startify'

" EASY MOTION
Plugin 'easymotion/vim-easymotion'

" INCSEARCH
" Incsearch --> incremental, fuzzy, search
" with easymotion integration
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'

" NERDTREE
" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'

" NERD COMMENTER
" to comment: <leader>cc
" uncomment : <leader>cu
Plugin 'scrooloose/nerdcommenter'

" GIT
" defacto git plugin
Plugin 'tpope/vim-fugitive'

" VIM SESSION
" Easy vim session management
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'

" YouCompleteMe
" Adding auto-complete feature, use <TAB> to complete an expression
Bundle 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" =============================================================================
" PLUGIN OPTIONS
" =============================================================================

" SOLARIZED
set background=dark
" config for proper displaying of colors in Screen
let g:solarized_termcolors=16
se t_Co=16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" automatic checking disabled
let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": ["ruby", "php"],
        \ "passive_filetypes": ["puppet"] }

" VIM MARKDOWN
" Disable folding in Markdown
let g:vim_markdown_folding_disabled = 1

" VIM-SESSION
let g:session_autoload = 'no' "don't autoload default session
let g:session_autosave_periodic = 'yes' "autosave while working

" Don't save hidden buffers with session
set sessionoptions-=buffers

" VIM STARTIFY
" Tell Startify where to find sessions
let g:startify_session_dir = '~/.vim/sessions'
" Order of startify startup
let g:startify_list_order = [
        \ ['Sessions'],
        \ 'sessions',
        \ ['MRU (file)'],
        \ 'files',
        \ ['MRU (dir)'],
        \ 'dir',
        \ ['Bookmarks'],
        \ 'bookmarks',
        \ ]

" EASYMOTION
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)

" Easymotion, Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>l <Plug>(easymotion-overwin-line)

" Easymotion, Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

" Auto turn-off highlight after search
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" CONQUETERM
" ConqueTerm options
let g:ConqueTerm_ReadUnfocused = 1 "continue updating when in other window
let g:ConqueTerm_FastMode = 1
let g:ConqueTerm_InsertOnEnter = 1 "automatically go into insert mode
let g:ConqueTerm_CWInsert = 1 "allow window switch in insert mode

" ConqueTerm function, load conque on to right
"
" ConqueTerm function, load last commad
function! SendConque()
  "get most recent created conque terminal
  let my_term = conque_term#get_instance()
  call my_term.focus()
  call feedkeys("\<Up>\<CR>")
endfunction

" Switch to previous window in insert mode
function! SwitchToPrev()
  :exe "normal \<C-w>p"
endfunction

nnoremap <silent> <F5> :w<CR>:call SendConque()<CR>
inoremap <silent> <F5> <Esc> :call SwitchToPrev()<CR>

" =============================================================================
" GENERAL SETTINGS
" =============================================================================

" Display Line numbers
set number

" Make sure no undo issues
set undofile
set undodir=/home/andre/.vimundo/

" Tab stuff
" see: http://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
au FileType python setl sw=2 sts=2 et

" Fix backspace key issue
set backspace=indent,eol,start

" syntax colouring
syntax on

" highlight searches
set hlsearch
set ignorecase " ignore case when searching

" detect file type
filetype on
" See 80th column
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=0
endif

" Set .md as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" =============================================================================
" KEY REMAP
" =============================================================================

nmap <F7> :NERDTreeToggle<CR>
" remap jk to escape insert mode
inoremap JK <Esc>
inoremap jk <Esc>

" Tabularize in normal or visual mode
map tt :Tabularize /

" Show tagbar
nmap <F8> :TagbarToggle<CR>

" Launch the explorer
map <F2> :Explore<CR>

" insert new lines without insert mode
nnoremap <S-Enter> O<Esc>
nnoremap <Enter> o<Esc>
" Backspace when in normal mode, used to delete lines
nnoremap <BS> i<BS><Esc>

" toggle :set paste and :set nopaste.
" Allows pasting code from outside without auto-indent
set pastetoggle=<F12>

" Clear highlights after searching
nnoremap <F4> :noh<CR>
inoremap <F4> :noh<CR>

" Generate TO DO lists, uses quickfix feature with custom error (TO DO)
noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.py<CR>:cw<CR>

" Shortcut to go to next and previous error in TO DO list
map <C-j> :cn<CR>
map <C-k> :cp<CR>

" Scroll wheel settings
:map <ScrollWheelUp> <C-Y>
:map <S-ScrollWheelUp> <C-U>
:map <ScrollWheelDown> <C-E>
:map <S-ScrollWheelDown> <C-D>
:nmap <ScrollWheelUp> <C-Y>
:nmap <S-ScrollWheelUp> <C-Y>
:nmap <C-ScrollWheelUp> <C-Y>
:nmap <ScrollWheelDown> <C-E>
:nmap <S-ScrollWheelDown> <C-E>
:nmap <C-ScrollWheelDown> <C-E>
:nmap <ScrollWheelLeft> <C-Y>
:nmap <S-ScrollWheelLeft> <C-Y>
:nmap <C-ScrollWheelLeft> <C-Y>
:nmap <ScrollWheelRight> <C-E>
:nmap <S-ScrollWheelRight> <C-E>
:nmap <C-ScrollWheelRight> <C-E>

" =============================================================================
" FUNCTIONS
" =============================================================================


" Matlab set breakpoint
function! Matbreak()
   return 'dbstop in '.expand("%:t:r").' at '.line(".")
endfunction
:imap <F3> <C-R>=Matbreak()<CR> 
:command! Matbreak :call Matbreak()

" Send everything in buffer to clipboard, requires xclip
command! Clip w !xclip -i -sel clip

" Incsearch
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" Easymotion + Incsearch/ fuzzy word
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" Switch to window number
" usage: /[window number]
let i = 1
while i <= 9
	execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
	let i = i + 1
endwhile

" Display window number in status line
function! WindowNumber()
	let str=tabpagewinnr(tabpagenr())
	return str
endfunction

set laststatus=2
set statusline=[%{WindowNumber()}]\ %f\ [line:%4l]
