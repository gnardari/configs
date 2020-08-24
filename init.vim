call plug#begin('~/.vim/plugged')
Plug 'tomtom/tcomment_vim'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-git'
Plug 'neomake/neomake'
Plug 'tpope/vim-classpath'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'scwood/vim-hybrid'
Plug 'haya14busa/incsearch.vim'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'jaawerth/neomake-local-eslint-first'
" Plug 'suan/vim-instant-markdown'
Plug 'crusoexia/vim-monokai'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/tComment'
Plug 'mbbill/undotree'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
call plug#end()

call glaive#Install()
set nocompatible
set clipboard+=unnamedplus
filetype off
" Theme
"colorscheme seti
"colorscheme hybrid
colorscheme monokai
set t_Co=256
let python_highlight_all=1
syntax on

let mapleader = ","

" Case insensitive :wq
command! W w
command! Q q
command! Wq wq
command! WQ wq

" Mappings
"" edit vimrc file
nnoremap <silent> <leader>ev :vsplitMYVIMRC<CR>
nnoremap <silent> <leader>sv :sourceMYVIMRC<CR>

"" Spelling
nnoremap <silent> <leader>l :set spell!<CR>

"" Create Fold
nnoremap <silent> <leader>f :set foldmethod=marker<CR>

"" NerdTree
nnoremap <C-\> :NERDTreeToggle<CR>

"" Call Devhelpe
"augroup devHelp
"   autocmd!
"   au Filetype c nnoremap <silent> <leader>k :! devhelp -s "<cword>" 2>/dev/null 1>&2 &<CR><CR>
"augroup end

"" Better Scrolling
nnoremap <C-J> <C-E>
nnoremap <C-K> <C-Y>

"" Tabs Commands
nnoremap <C-S><C-X> gt
nnoremap <C-S><C-Z> gT
"map <C-S><C-S> gT
nnoremap <C-S><C-W> :tabclose<CR>
nnoremap <C-S><C-O> :tabnew<CR>

"" Save current file
nnoremap <C-S> :w

"" Ident entire file
nnoremap <silent> <leader>= gg=G<C-O><C-O>

"" Toggle comment
nnoremap <silent><leader>q I//<esc>:s/\v(\/\/+)\1+//e<CR>

"" Bubble single lines"{
"" nmap <A-J> @=']e'<CR>
"" nmap <A-K> @='[e'<CR>

"" Bubble multiple lines
"" vmap <A-K> [egv
"" vmap <A-J> ]egv"}

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>l

" Settings
set showmode
set whichwrap=b,s,<,>,[,]
set hlsearch
set foldmarker={,}
set foldmethod=marker
set foldlevelstart=99
set nu
set smartindent
set ignorecase smartcase
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set exrc
set secure
set relativenumber
set completeopt=menuone
set backspace=indent,eol,start
set encoding=utf-8
set fileencoding=utf-8


filetype on
filetype plugin on
filetype indent on
augroup syntaxes
    autocmd!
    au BufNewFile,BufRead *.asm set syntax=icmc
    au BufNewFile,BufRead *.pl set syntax=prolog
augroup END

augroup filetypes
    autocmd!
    au BufNewFile,BufRead *.pl set filetype=prolog
augroup END

" Ruby config
augroup customTabs
    autocmd!
    au BufNewFile, BufRead *.rb :set tabstop=2
    au BufNewFile, BufRead *.rb :set shiftwidth=2
    au BufNewFile, BufRead *.rb :set softtabstop=2
    au BufNewFile, BufRead *.erb :set tabstop=2
    au BufNewFile, BufRead *.erb :set shiftwidth=2
    au BufNewFile, BufRead *.erb :set softtabstop=2
augroup END

" Python config
augroup customTabs
    autocmd!
    au BufNewFile, BufRead *.py :set tabstop=4
    au BufNewFile, BufRead *.py :set shiftwidth=4
    au BufNewFile, BufRead *.py :set softtabstop=79
    au BufNewFile, BufRead *.py :set fileformat=unix
    au BufNewFile, BufRead *.py :set expandtab
    au BufNewFile, BufRead *.py :set autoindent
augroup END

" neuron filetype for mod
au BufNewFile,BufReadPost *.mod set filetype=NMODL
" neuron hoc files look OK with Java syntax highlighting
au BufNewFile,BufReadPost *.hoc,*.ses set syntax=java
" markdown - probably unnecessary
au BufNewFile,BufReadPost *.md set filetype=markdown

"au BufWritePost,InsertLeave * Neomake
autocmd BufWritePost,InsertLeave * Neomake

augroup PlantUML "{
    autocmd!
    au BufNewFile,BufRead *.uml setlocal syntax=plantuml
    au BufNewFile,BufRead *.puml setlocal syntax=plantuml
augroup END "}

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    " autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    " autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

if has('mouse')
    set mouse=a
endif

" airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


"Switch between block and I cursor when command/insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"Eclim on supertab
let g:SuperTabDefaultCompletionType = 'context'

"Eclim keybinds
augroup JavaEclim
    autocmd!
    au BufNewFile,BufRead *.java :nnoremap <silent> <leader>o :JavaImportOrganize<CR>
    au BufNewFile,BufRead *.java :nnoremap <silent> <leader>gi :JavaSearch<CR>
    au BufNewFile,BufRead *.java :nnoremap <silent> <leader>c :JavaCorrect<CR>
    au BufNewFile,BufRead *.java :nnoremap <silent> <leader>i :JavaImpl<CR>
augroup END"

"ctrlP config
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules,.git
let g:ctrlp_map = '<c-p>'
let g:ctrlp_use_caching=1

set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set rtp^=/usr/share/vim/vimfiles/

"Syntastic configuration
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"Neomake configs
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_open_list = 2
let g:neomake_list_height = 4

set signcolumn=yes
set updatetime=250


"incsearch-vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
" g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
"Syntastic settings
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_style_error_symbol = '⁉️'
"let g:syntastic_warning_symbol = '⚠️'
"let g:syntastic_style_warning_symbol = '💩'
autocmd filetype crontab setlocal nobackup nowritebackup
