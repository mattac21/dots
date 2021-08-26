" Sets!
set nocompatible    " Dont need support for Vi
set showcmd     " Show the current command
syntax on       " Syntax hightlighting

set nowrap      " Wrap line
set showmatch   " Highlight matching brace
set visualbell  " Enable visual bell
set t_vb=       " Disable visual blinking
set smartcase   " Enable smart-case search
set incsearch   " Searches for strings incrementally
set guicursor=  " All cursors are a block
set guicursor+=i:blinkon1 " Insert mode blink
set termguicolors " Use gui colors instead of cterm
set nohlsearch  " No hightlight on search

set autoindent  " Auto-indent new lines
set smartindent " Enable smart-indent
set shiftwidth=4        " Number of auto-indent spaces
set tabstop=4 softtabstop=4       " Number of spaces per Tab
set expandtab
set ruler       " Show row and column ruler information
set undolevels=1000     " Number of undo levels       
set showmode " Show the mode that we are in                                                       
set splitbelow " Horizontal splits open below
set scrolloff=8 " Dont let cursor get to 8 below bottom
set signcolumn=yes " Show errors in sign column
set hidden " Keep buffers open in the background

set number relativenumber "  Show relative line numbers and current line number
set nu rnu

set colorcolumn=100

let g:gruvbox_contrast_drark = 'hard'
let g:maci_colorscheme='gruvbox'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

set background=dark

if has('nvim')
    call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:maci_colorscheme])
else
    colorscheme gruvbox
endif

highlight ColorColumn ctermbg=0 guibg=grey
hi SignColumn guibg=none
hi CursorLineNR guibg=None

let g:airline#extensions#tabline#enabled=1 " Enable buffer bar at top

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
