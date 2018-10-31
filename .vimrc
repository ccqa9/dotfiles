" vim-plug

" Note: Skip initialization for vim-tiny or vim-small
if 0 | endif

if has('vim_starting')
    set rtp+=~/.vim/plugged/vim-plug
    if !isdirectory(expand('~/.vim/plugged/vim-plug'))
        echo 'install vim-plug...'
        call system('mkdir -p ~/.vim/plugged/vim-plug')
        call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
    end
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-scripts/taglist.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-expand-region'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-eunuch'
Plug 'mattn/emmet-vim'

call plug#end()


"----------------------------------------------------
" color scheme
"----------------------------------------------------
colorscheme gruvbox
set background=dark
set t_Co=256            " gruvboxをカラースキーマにするときに必要！
let g:ligthline = { 'colorscheme': 'gruvbox' }


"----------------------------------------------------
" keymap
"----------------------------------------------------
let mapleader = "\<Space>"
" open new file
nnoremap <Leader>o :CtrlP<CR>
" change to visual mode with <Space><Space>
nmap <Leader><Leader> V
" select 1 charactor>word>line with v
vmap v <Plug>(expand_region_expand)
" back to previous selected area with <C-v>
vmap <C-v> <Plug>(expand_region_shrink)

" ----------------------------------------------------
" vim-trailing-whitespace
" ----------------------------------------------------
let g:extra_whitespace_ignored_filetypes = ['unite']

" ----------------------------------------------------
" nerdtree
" ----------------------------------------------------
" automatically open nerdtree when vim is opened
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" open nerdtree
nmap <n> :NERDTreeToggle<CR>

" close vim when no tab opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" show dotfiles
let NERDTreeShowHidden=1

" set window width
let g:NERDTreeWinSize=50

"----------------------------------------------------
" ctags, taglist
"----------------------------------------------------
" Fixme: set tags = tagsするとvimの起動で一旦止まる
set tags = tags
let Tlist_Ctags_Cmd        = "/usr/local/bin/ctags"  " ctagsのコマンド
let Tlist_Show_One_File    = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow  = 1
" open/close taglist  with \l
map <silent> <leader>l :TlistToggle<CR>

"----------------------------------------------------
" encoding
"----------------------------------------------------
let &termencoding = &encoding
set encoding=utf-8

"----------------------------------------------------
" general
"----------------------------------------------------
set t_Co=256                    "256 color
set history=100                 "record commands
set fileformats=unix,dos,mac    "recognize new line code
" enable to change other window while editing
set hid
" automatically read file when updated
set autoread


syntax enable
set background=dark
let g:color_name = "ChocolateLiquor"

"----------------------------------------------------
""searching
"----------------------------------------------------

set ignorecase        "do not distinguish capital letter
set smartcase         "distinguish capital letter when capital letter included
set wrapscan          "back to the first after the last of search results
set noincsearch       "ignore search results while inputing words in search
"delete highlight with Esc+Esc in search
let g:color_name = "ChocolateLiquor"

"----------------------------------------------------
""searching
"----------------------------------------------------

set ignorecase        "do not distinguish capital letter
set smartcase         "distinguish capital letter when capital letter included
set wrapscan          "back to the first after the last of search results
set noincsearch       "ignore search results while inputing words in search
"delete highlight with Esc+Esc in search
set wrapscan          "back to the first after the last of search results
set noincsearch       "ignore search results while inputing words in search
"delete highlight with Esc+Esc in search
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"----------------------------------------------------
" highlight
"----------------------------------------------------
set number            "show line number
set title             "show title on window
set ruler             "show currect position of cursor
set nolist            "do not show tab and new line
set showcmd           "show commands at status
set showmatch         "highlight corresponding blacket
set wildmenu          "show candidates
set wildmode=list:longest
set laststatus=2
set laststatus=2      "show always status line
syntax on             "enable syntax highlight
set hlsearch          "enable highlight of search results
"show encoding and new line charactor at status line
if winwidth(0) >= 120
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=%l,%c%V%8P
else
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=%l,%c%V%8P
endif

"----------------------------------------------------
" editing
"----------------------------------------------------
set backspace=indent,eol,start
set autoindent              "indent automatically
"set smartindent            "smart indent
set tabstop=2               "tab length
set shiftwidth=2
set softtabstop=0
set expandtab               "replace tab to blank

"----------------------------------------------------
" file
"----------------------------------------------------
set nobackup                "delete backup file

"----------------------------------------------------
" definition of map
"----------------------------------------------------
map <Left> :bp<CR>
map <Right> :bn<CR>

"----------------------------------------------------
"autocmd
"----------------------------------------------------
if has("autocmd")
  filetype plugin on
  autocmd FileType text setlocal textwidth=78
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
  filetype indent on

  autocmd FileType * setlocal formatoptions-=ro
  autocmd FileType html :set indentexpr=
  autocmd FileType xhtml :set indentexpr=

  " Indent
  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 noet
  autocmd FileType diff       setlocal sw=2 sts=2 ts=2 noet
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType jade       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scss       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescript setlocal sw=2 sts=2 ts=2 et
endif " has("autocmd")

"----------------------------------------------------
"Unite
"----------------------------------------------------
nnoremap    [unite]   <Nop>
nmap    f [unite]

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]u  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]l  :<C-u>Unite colorscheme<CR>
nnoremap  [unite]f  :<C-u>Unite source<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " Overwrite settings.
endfunction

let g:unite_source_file_mru_limit = 200
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

" For vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
nnoremap <silent> <Leader>e :<C-u>VimFilerBufferDir<CR>

" For optimize.
let g:unite_source_file_mru_filename_format = ''

"----------------------------------------------------
"Nginx
"----------------------------------------------------
au BufRead,BufNewFile /etc/nginx/* set ft=nginx

"----------------------------------------------------
" NRDTree
"----------------------------------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"----------------------------------------------------
" do not overwrite paste buffer when pasting
"----------------------------------------------------
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()


