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

" Plug 'luochen1990/rainbow', { 'on': ['RainbowToggle'] }

" Plug 'michalbachowski/vim-wombat256mod'

Plug 'tomasr/molokai'

" Plug 'Shougo/denite.nvim'

Plug 'altercation/vim-colors-solarized'

Plug 'airblade/vim-gitgutter'

Plug 'bling/vim-airline'

Plug 'bling/vim-bufferline'

Plug 'ctrlpvim/ctrlp.vim' , { 'on': ['CtrlP', 'CtrlPMixed']}

Plug 'honza/vim-snippets'

Plug 'fneu/breezy'

Plug 'junegunn/rainbow_parentheses.vim'

Plug 'junegunn/vim-easy-align'

Plug 'junegunn/vim-plug'

Plug 'lervag/vimtex', { 'for': ['tex', 'latex'] }

Plug 'majutsushi/tagbar' , { 'on': ['TagbarToggle'] }

Plug 'neomake/neomake'

Plug 'Raimondi/delimitMate'

Plug 'rakr/vim-one'

Plug 'scrooloose/nerdtree' , { 'on': 'NERDTreeToggle' }

Plug 'jdkanani/vim-material-theme'

Plug 'Shougo/deoplete.nvim' , Cond(has('nvim'))

Plug 'Shougo/neocomplete.vim' , Cond(!has('nvim'))

Plug 'SirVer/ultisnips'

Plug 'tomtom/tcomment_vim'

Plug 'tpope/vim-fugitive' ", { 'on': ['Gstatus'] }

Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline-themes'

Plug 'zhaocai/GoldenView.Vim'

Plug 'zchee/deoplete-jedi'

Plug 'davidhalter/jedi-vim'
" Initialize plugin system
call plug#end()

set nomodeline

"set encoding (needed for powerline icons in vim-airline)
set encoding=utf-8

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" Always show line numbers, but only in current window.
"set rnu
set nu rnu
:au WinEnter * :setlocal nu rnu
:au WinLeave * :setlocal nonu nornu

" Automatically resize vertical splits.
"" :au WinEnter * :set winfixheight
"" :au WinEnter * :wincmd =

" Let the cursor never reach the end of the screen
"set scrolloff=10

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

" Rebind <Leader> key
let mapleader = ","
let maplocalleader = "-"


" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> <ESC>:nohl<CR>i

" Break a line in normalmode with <CR>
" noremap <CR> i<CR><ESC>

" Quicksave command
"noremap <C-Y> :update<CR><ESC>
"vnoremap <C-Y> <C-C>:update<CR><ESC>
"inoremap <C-Y> <C-O>:update<CR><ESC>

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
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" set t_Co=256
" let g:solarized_termcolors = 256 " remove comment when using solarized
set background=dark
set termguicolors
colorscheme one

set cursorline
"hi CursorLine cterm=NONE ctermbg=236

"if you want the theme timebased do:
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

autocmd FileType tex,latex setlocal spell spelllang=en_us,en_gb,de_de

" ============================================================================
" Plugins
" ============================================================================

" Settings for vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='one'
let g:airline#extensions#tagbar#enabled = 0
" If you don't want the triangles in airline. Maybe because you don't want to
" install patched fonts.
"" let g:airline_left_sep=''
"" let g:airline_right_sep=''


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

"" Settings for Nerdtree
nmap <F7> :NERDTreeToggle<CR>


"" Settings for Rainbow
"let g:rainbow_active = 1
"let g:rainbow_conf = {
"    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
"    \   'ctermfgs': ['grey', 'lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
"    \   'operators': '_,_',
"    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
"    \   'separately': {
"    \       '*': {},
"    \       'tex': {
"    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
"    \       },
"    \       'lisp': {
"    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
"    \       },
"    \       'vim': {
"    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
"    \       },
"    \       'html': {
"    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
"    \       },
"    \       'css': 0,
"    \   }
"    \}

" Settings for Rainbow Parantheses (Rainbow doesn't work in nvim)
au VimEnter * RainbowParentheses

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Settings for tagbar
nmap <F8> :TagbarToggle<CR>

" Settings for neocomplete/deoplete (set to 0 if neocomplete complains about missing
" lua) seems to load neocomplete in nvim anyway, fixed with hack at plugs above
if has('nvim')
    let g:deoplete#enable_at_startup = 1
else
    let g:neocomplete#enable_at_startup = 1
endif

" Settings for neomake
autocmd! BufWritePost * Neomake
let g:neomake_tex_enabled_makers = []

" Settings for GoldenView
let g:goldenview__enable_default_mapping = 0
nmap <silent> <C-g> <Plug>GoldenViewSplit

" Settings for vimtex
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--noraise --unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
" let g:tex_flavor = "latex"
let g:vimtex_compiler_progname = "/usr/bin/nvr"
" let g:vimtex_compiler_latexmk = {'backend' : 'nvim'}
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_warnings = {
          \ 'overfull' : 0,
          \ 'underfull' : 0,
          \ 'font' : 0
          \}
let g:vimtex_quickfix_latexlog = {'fix_paths':0}

" neo-/deoplete patterns for completion with vimtex
if has('nvim')

    if !exists('g:deoplete#omni#input_patterns')
        let g:deoplete#omni#input_patterns = {}
    endif
    let g:deoplete#omni#input_patterns.tex =
        \   '\\(?:'
        \  .   '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
        \  .  '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
        \  .  '|hyperref\s*\[[^]]*'
        \  .  '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \  .  '|(?:include(?:only)?|input)\s*\{[^}]*'
        \  .')'

elseif has('vim')

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

endif

" surround for latex environments
let g:surround_108 = "\\begin{\1environment: \1}\r\\end{\1\1}"

""" Settings for denite
" noremap <C-p>b :Denite buffer<CR>
" noremap <C-p>f :Denite file_old file_rec<CR>
" noremap <C-p> :Denite buffer file_old file_rec<CR>

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
 let g:UltiSnipsExpandTrigger="<tab>"
 let g:UltiSnipsJumpForwardTrigger="<c-b>"
 let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

"CtrlP settings
noremap <c-p> :CtrlPMixed<cr>
