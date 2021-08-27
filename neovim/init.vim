" Vimrc!!
let mapleader="\<Space>" " Remap leader to space

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(expand('~/.vim/plugged'))

Plug 'arcticicestudio/nord-vim' " Theme
Plug 'morhetz/gruvbox' " Theme
Plug 'vim-airline/vim-airline' " Buffer and vim line

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" LSP
Plug 'neovim/nvim-lspconfig' " LSP bbyyyy
Plug 'kosayoda/nvim-lightbulb' " Show lightbulb when hovering over code acton

" Autocomplete
Plug 'nvim-lua/completion-nvim'

" Surround
Plug 'tpope/vim-surround'

" TreeSitter (Hightlighting)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Status Line and Icons
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'yamatsum/nvim-web-nonicons'
Plug 'kyazdani42/nvim-web-devicons'

" Formatting
Plug 'sbdchd/neoformat'

call plug#end()

" Window Remaps
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Leader>rp :resize 100<CR>

" Buffer Remaps
nnoremap <Leader>bb <C-^><CR>
nnoremap <Leader>cb :bd<CR>
nnoremap <Leader>ct :bd!<CR>
nnoremap <c-i>l :bnext<CR>
nnoremap <c-i>h :bprev<CR>

" Terminal Remaps
nnoremap <Leader>vt :50vs term://zsh<CR>
nnoremap <Leader>ht :17sp term://zsh<CR>
tnoremap <Esc> <C-\><C-n><CR>

" Explorer Remaps
nnoremap <Leader>ve :25Vexplore<CR>
nnoremap <Leader>he :25Sexplore<CR>

" Create matching brackets, parenthesis, etc...
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

" Neoformatter
nnoremap <Leader>nf :Neoformat<CR>
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
