set runtimepath+=~/.dotfiles/

" First Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect('~/.dotfiles/bundle/{}')
Helptags

"set encoding (needed for powerline icons in vim-airline)
set encoding=utf-8

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" Always show line numbers, but only in current window.
set rnu 
set number
:au WinEnter * :setlocal rnu number
:au WinLeave * :setlocal nonumber nornu

" Automatically resize vertical splits.
"" :au WinEnter * :set winfixheight
"" :au WinEnter * :wincmd =

" Let the cursor never reach the end of the screen
set scrolloff=10

" Set wildmenu
set wildmenu

" Set Autoindent (let's see if it's worth it)
set autoindent

" Let splits appear on the right
set splitright

" Automatic reloading of .vimrc
" autocmd! bufwritepost .vimrc source %


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
let mapleader = ","
let maplocalleader = "-"


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quicksave command
noremap <C-Y> :update<CR>
vnoremap <C-Y> <C-C>:update<CR>
inoremap <C-Y> <C-O>:update<CR>

" " Move lines with Alt+j/k
" nnoremap <C-j> :m .+1<CR>==
" nnoremap <C-k> :m .-2<CR>==
" inoremap <C-j> <Esc>:m .+1<CR>==gi
" inoremap <C-k> <Esc>:m .-2<CR>==gi
" vnoremap <C-j> :m '>+1<CR>gv=gv
" vnoremap <C-k> :m '<-2<CR>gv=gv

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
"set t_Co=256
set background=dark
set termguicolors
colorscheme breezy
set cursorline
hi CursorLine cterm=NONE ctermbg=236
"colorscheme wombat256mod
" somehow theme is broken when background is set
" set background=dark
" if you want the theme timebased do:
""colorscheme solarized
""if strftime("%H") < 20
""    if strftime("%H") > 8
""        set background=dark
""    endif
""else
""    set background=light
""endif


" " Showing line numbers and length
" set number  " show line numbers (already set at the top)
" set tw=79   " width of document (used by gd)
" set fo-=t   " don't automatically wrap text when typing
" set colorcolumn=80
" highlight ColorColumn ctermbg=236

" Set soft line wraps
set wrap
set linebreak
set nolist
set showbreak=...>


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" ============================================================================
" Plugins
" ============================================================================

" Settings for vim-airline
" git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='breezy'
" If you don't want the triangles in airline. Maybe because you don't want to
" install patched fonts.
"" let g:airline_left_sep=''
"" let g:airline_right_sep=''

" Settings for ctrlp
" git clone https://github.com/kien/ctrlp.vim.git ~/.vim/ctrlp
"" let g:ctrlp_max_height = 30
"" set wildignore+=*.pyc
"" set wildignore+=*_build/*
"" set wildignore+=*/coverage/*


" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_goto_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_builtin_objs = 0
"" let g:pymode_syntax_builtin_funcs = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
"" mkdir -p ~/.vim/ftplugin
"" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php ?src_id=5492
"" set nofoldenable

"" Settings for Nerdtree
"" git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle
"" Open Nerdtree when vim is opened without a file
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <F7> :NERDTreeToggle<CR>


" Settings for Rainbow
" git clone https://github.com/luochen1990/rainbow.git ~/.vim/budle/rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['grey', 'lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

" Settings for tagbar
nmap <F8> :TagbarToggle<CR>

" Settings for neocomplete (set to 0 if neocomplete complains about missing
" lua)
let g:neocomplete#enable_at_startup = 1

" Settings for neomake
autocmd! BufWritePost * Neomake

" Settings for GoldenView
let g:goldenview__enable_default_mapping = 0
nmap <silent> <C-g> <Plug>GoldenViewSplit

" Settings for vimtex
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

if !exists('g:neocomplete#sources#omni#input_patterns')
let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex =
    \ '\v\\%('
    \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
    \ . '|hyperref\s*\[[^]]*'
    \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|%(include%(only)?|input)\s*\{[^}]*'
    \ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . ')'
"autocmd FileType tex :VimtexCompile
" Settings for delimitMate
"let delimitMate_autoclose = 0
