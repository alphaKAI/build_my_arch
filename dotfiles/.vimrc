scriptencoding utf-8

set nocompatible

if has('vim_starting')
  filetype plugin off
    filetype indent off
  execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
  endif
  call neobundle#rc(expand('~/.vim/bundle'))

  NeoBundle 'git://github.com/kien/ctrlp.vim.git'
  NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
  NeoBundle 'git://github.com/scrooloose/nerdtree.git'
  NeoBundle 'git://github.com/scrooloose/syntastic.git'

set backspace=indent,eol,start

"バックアップ系
set nowritebackup
set nobackup

"クリップボードとか
set clipboard+=unnamed
set nrformats-=octal
set ambiwidth=double
set wildmenu

"マウス使えるように
if has('mouse')
  set mouse=a
endif

filetype plugin indent on
"検索系
set ignorecase
set smartcase

set wrapscan
set incsearch
set hlsearch

"行数表示
set number
"括弧のシンタックス表示
set showmatch matchtime=1
"タブサイズを4に
set ts=4
set autoindent
set title

set cmdheight=2
set laststatus=2

set showcmd

set display=lastline

syntax on

"NeoBunddle

NeoBundleLazy 'Shougo/neosnippet', {
\ 'autoload' : {
\ 'commands' : ['NeoSnippetEdit', 'NeoSnippetSource'],
\ 'filetypes' : 'snippet',
\ 'insert' : 1,
\ 'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
\ }}
 
NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
\ 'autoload' : {
\ 'insert' : 1,
\ }}
 
NeoBundleLazy 'edsono/vim-matchit', { 'autoload' : {
\ 'filetypes': 'ruby',
\ 'mappings' : ['nx', '%'] }}
 
NeoBundleLazy 'basyura/unite-rails', {
\ 'depends' : 'Shougo/unite.vim',
\ 'autoload' : {
\ 'unite_sources' : [
\ 'rails/bundle', 'rails/bundled_gem', 'rails/config',
\ 'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
\ 'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
\ 'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
\ 'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
\ 'rails/stylesheet', 'rails/view'
\ ]
\ }}
 
NeoBundleLazy 'alpaca-tc/neorspec.vim', {
\ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
\ 'autoload' : {
\ 'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
\ }}
 
NeoBundleLazy 'alpaca-tc/alpaca_tags', {
\ 'depends': 'Shougo/vimproc',
\ 'autoload' : {
\ 'commands': ['TagsUpdate', 'TagsSet', 'TagsBundle']
\ }}
 
NeoBundleLazy 'tsukkee/unite-tag', {
\ 'depends' : ['Shougo/unite.vim'],
\ 'autoload' : {
\ 'unite_sources' : ['tag', 'tag/file', 'tag/include']
\ }}

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-rsense'

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 20
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
" demiliter for function compl
if !exists('g:neocomplcache_delimiter_patterns')
    let g:neocomplcache_delimiter_patterns = {}
endif

let g:neocomplcache#sources#rsense#home_directory = '/opt/rsense-0.3'

NeoBundle 'mattn/emmet-vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
