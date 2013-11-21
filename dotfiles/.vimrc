scriptencoding utf-8

"Initialize
if has('vim_starting')
  filetype plugin off
    filetype indent off
  execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
  endif
  call neobundle#rc(expand('~/.vim/bundle'))

if filereadable(expand('~/.vim_neobundle'))
	source ~/.vim_neobundle
endif

" Enable backspace
set backspace=indent,eol,start

"バックアップ系
set nowritebackup
set nobackup
set noswapfile

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
"検索後の強調表示をCtrl+Lで解除
nnoremap <C-L> :nohl<CR><C-L>
nnoremap <C-O> :VimFiler -split -simple -winwidth=35 -no-quit<CR><C-L>
" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" undo
nnoremap <C-U> :undo<CR><C-U>
nnoremap <C-R> :redo<CR><C-Y>

"行数表示
set number
"括弧のシンタックス表示
set showmatch matchtime=1
"タブサイズを4に
set ts=4
set tabstop=2
set shiftwidth=2
set autoindent
set title

set cmdheight=2
set laststatus=2

set showcmd

set display=lastline

"set tags = tags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"  "ctagsのコマンド
let Tlist_Show_One_File = 1  " 現在表示中のファイルのみのタグしか表示しない
let Tlist_Use_Right_Window = 1 "右側にtag listのウインドうを表示する
let Tlist_Exit_OnlyWindow = 1 "taglistのウインドウだけならVimを閉じる
nnoremap <C-K> :TlistToggle<CR><C-K> "Ctrl+Kでtaglistウインドウを開いたり閉じたり出来るショートカット

" statusline
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" statusのカラースキーマ
augroup InsertHook
	autocmd!
    autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
    autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

compiler ruby
let ruby_space_errors=1

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

let g:previm_open_cmd = 'firefox'

"nobeep
set visualbell t_vb=
set noerrorbells

syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_termtrans=0
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
"highlight Normal ctermbg=none

