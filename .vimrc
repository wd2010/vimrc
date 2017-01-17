syntax on                     " syntax highlighing
filetype plugin indent on     " required

" Basic configuration
set nocp                      " nocompatible
set ru                        " ruler
set nu                        " number
set hls                       " hlsearch
set ww=h,l                    " whichwrap
set enc=utf-8                 " encoding
set nowrap                    " nowrap

" Cursor
"set cul                      " cursorline
"set cuc                      " cursorcolumn

" Show a tab
"set list lcs=tab:——          " listchars

" Turn backup off
set nobk                      " nobackup
set nowb                      " nowritebackup
set noswf                     " noswapfile

" Statusline
set ls=2                      " laststatus
set stl=%F%m%r%h%w\ \[%v,%l]\ \[%p%%]\%{strftime(\"\ %Y-%m-%d\ %H:%M\")}  "statusline

" Smart way to move
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use tab to indent
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

" Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

" Automatic double quotes,parenthesis etc
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap （ （）<ESC>i
inoremap 【 【】<ESC>i

" Filetype
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Set tabstop shiftwidth expandtab
autocmd FileType *  set ts=2 | set sw=2 | set et
autocmd FileType go set ts=4 | set sw=4 | set noet

" Leader
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" =========================================================
call plug#begin('~/.vim/bundle')          " Specify a directory for plugins: begin('~/some/path/here')

Plug 'fatih/vim-go'                       " Go development plugin for Vim

call plug#end()                           " All of your Plugs must be added before this line

" =========================================================
set rtp+=~/.vim/bundle/Vundle.vim         " set the runtime path to include Vundle and initialize
call vundle#begin('~/.vim/bundle')        " Specify a directory for plugins: begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'             " let Vundle manage Vundle, required
Plugin 'pangloss/vim-javascript'          " Vastly improved Javascript indentation and syntax support in Vim.
Plugin 'scrooloose/nerdtree'              " A tree explorer plugin for vim.
Plugin 'msanders/snipmate.vim'            " implements some of TextMate's snippets features in Vim.
Plugin 'scrooloose/syntastic'             " Syntax checking hacks for vim.
Plugin 'ctrlpvim/ctrlp.vim'               " Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'Shougo/neocomplcache.vim'         " Ultimate auto-completion system for Vim.
Plugin 'mhinz/vim-signify'                " Show a diff via Vim sign column.
Plugin 'editorconfig/editorconfig-vim'    " EditorConfig plugin for Vim.
Plugin 'suan/vim-instant-markdown'        " Instant Markdown previews from VIm!
Plugin 'tpope/vim-markdown'               " Vim Markdown runtime files
Plugin 'terryma/vim-expand-region'        " Select increasingly larger regions of text

call vundle#end()                         " All of your Plugins must be added before this line

" =========================================================
" Configuration: nerdtree
" How can I open a NERDTree automatically when vim starts up?
autocmd vimenter * NERDTree
" How can I map a specific key or shortcut to open NERDTree?
map <C-n> :NERDTreeToggle<CR>

" =========================================================
" Configuration: ctrlp.vim
" switch to filename only search instead of full path
let g:ctrlp_by_filename = 1
" switch to regexp mode.
let g:ctrlp_regexp = 0
" set working path
let g:ctrlp_working_path_mode = 'r'
" exclude files and directories
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|node_modules|logs)$',
  \ 'file': '\v\.(log|swp|zip|png|jpg|ico)$',
  \ }

" =========================================================
" Configuration: neocomplcache.vim
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" =========================================================
" Configuration: syntastic
" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" turn to next or previous errors, after open errors list
nmap <leader>n :lnext<CR>
nmap <leader>p :lprevious<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 0
" syntastic checker for javascript
let g:syntastic_javascript_checkers = ['eslint']
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 1
" custom icons (enable them if you use a patched font, and enable the previous setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

" =========================================================
" Configuration: vim-go
" commands
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <Leader>d <Plug>(go-doc-browser)
" syntax-highlighting for Functions, Methods and Structs
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" auto fmt on save
let g:go_fmt_autosave = 1

" =========================================================
" Configuration: terryma/vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <s-v> <Plug>(expand_region_shrink)
