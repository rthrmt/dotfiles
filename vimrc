"" auto-install plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"" Function for conditional activation of plugins, see:
" https://github.com/junegunn/vim-plug/wiki/faq#conditional-activation
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

"" Plugins to download

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Plug 'baskerville/bubblegum'

" Plug 'dracula/vim'

" Plug 'michalbachowski/vim-wombat256mod'

" Plug 'tomasr/molokai'

" Plug 'altercation/vim-colors-solarized'

Plug 'airblade/vim-gitgutter'

Plug 'bling/vim-airline'

Plug 'bling/vim-bufferline'

Plug 'honza/vim-snippets'

" Plug 'fneu/breezy'

Plug 'junegunn/vim-easy-align'

Plug 'junegunn/vim-plug'

Plug 'lervag/vimtex', { 'for': ['tex', 'latex'] }

Plug 'majutsushi/tagbar' , { 'on': ['TagbarToggle', 'TagbarOpenAutoClose'] }

Plug 'neomake/neomake'

Plug 'Raimondi/delimitMate'

Plug 'rakr/vim-one'

Plug 'rakr/vim-two-firewatch'

" Plug 'jdkanani/vim-material-theme'

Plug 'lifepillar/vim-mucomplete'

Plug 'SirVer/ultisnips'

Plug 'tomtom/tcomment_vim'

Plug 'tpope/vim-fugitive' ", { 'on': ['Gstatus'] }

Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

" set nomodeline

"set encoding (needed for powerline icons in vim-airline)
set encoding=utf-8

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" Allow switching buffers without saving
set hidden

" Rebind <Leader> key
let mapleader = ","
let maplocalleader = "-"

" Always show line numbers, but only in current window.
"set rnu
set nu
:au WinEnter * :setlocal nu
:au WinLeave * :setlocal nonu

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
autocmd! bufwritepost .vimrc source %


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

noremap <ScrollWheelUp> <C-y>
noremap <ScrollWheelDown> <C-e>

" Enable recursive finding
set path+=**
map <Leader>f :find 

" Map search buffers
map <Leader>b :b 

" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> <ESC>:nohl<CR>i

" Break a line in normalmode with <CR>
" noremap <CR> i<CR><ESC>

noremap <Leader>w :w<CR>

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

" Easier window switching
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

" let up-arrow show last commands (like in bash)
nnoremap <up> :<up>

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/
" set list
set lcs=trail:-

" Color scheme
" set t_Co=256
" let g:solarized_termcolors = 256 " remove comment when using solarized
"if you want the theme timebased do:
" if strftime("%H") < 21
"    if strftime("%H") > 8
"        set background=light
"    endif
" else
"    set background=dark
" endif
if (has("termguicolors"))
    set termguicolors
endif
colorscheme two-firewatch
set background=dark

if has("one")
    let g:one_allow_italics = 1
endif

" set cursorline
hi CursorLine cterm=None ctermbg=238

" ColorColumn
set colorcolumn=120
highlight ColorColumn ctermbg=238

" Set soft line wraps
set wrap
set linebreak
"set showbreak=...>
set breakindent

nnoremap j gj
nnoremap k gk

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Tabs vs spaces
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

" netrw settings
let g:netrw_liststyle= 3
map <F7> :Lex<CR>

" highlight IncSearch guifg='DarkOrange' guibg='White'
hi SpellBad cterm=underline ctermfg=None ctermbg=None

autocmd FileType tex,latex set colorcolumn=
autocmd FileType tex,latex setlocal spell spelllang=en_us,en_gb,de_de
augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonSelf self
                \ | highlight def link pythonSelf Special
augroup end

" ============================================================================
" Plugins
" ============================================================================

" Settings for vim-airline
set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='twofirewatch'
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#bufferline#enabled = 0

" " Bufferline settings
let g:bufferline_echo = 0
"   autocmd VimEnter *
"     \ let &statusline='%{bufferline#refresh_status()}'
" \ .bufferline#get_status_string()


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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Settings for tagbar
nmap <F8> :TagbarOpenAutoClose<CR>

" Settings for neomake
let g:neomake_place_signs = 1
let g:neomake_open_list = 2
autocmd! BufWritePost * Neomake
let g:neomake_tex_enabled_makers = []

"""" change depending on OS (this is for Arch)
" let g:neomake_python_pyflakes_exe = 'pyflakes-python2'
let g:neomake_python_flake8_exe = 'flake8-python2'
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E501,F401,F841']
    \ }
let g:neomake_python_pylint_exe = 'pylint2'
let g:neomake_python_enabled_makers =['flake8']

" Settings for vimtex
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--noraise --unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:tex_flavor = "latex"
if has('nvim')
    let g:vimtex_compiler_progname = "nvr"
endif
" let g:vimtex_compiler_latexmk = { 'backend' : 'nvim' }
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_warnings = {
          \ 'overfull' : 0,
          \ 'underfull' : 0,
          \ 'font' : 0
          \}

" surround for latex environments
let g:surround_108 = "\\begin{\1environment: \1}\r\\end{\1\1}"

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
 let g:UltiSnipsExpandTrigger="<tab>"
 let g:UltiSnipsJumpForwardTrigger="<c-b>"
 let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

set completeopt+=menuone
set completeopt+=noinsert
set completeopt+=preview

set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion

let g:mucomplete#enable_auto_at_startup = 1
