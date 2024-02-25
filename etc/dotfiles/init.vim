" init.vim

syntax on

let mapleader = "\<space>"
colorscheme shine 

set number
set shell=/bin/zsh
set shiftwidth=2
set tabstop=2
set expandtab
set textwidth=0
set autoindent
set hlsearch
set clipboard+=unnamed
set mouse=

" split
nnoremap <leader>- <C-w>s 
nnoremap <leader>\ <C-w>v 
" move
nnoremap <leader>w <C-w>w 
" resize
nnoremap <leader>r <C-w><
nnoremap <leader>l <C-w>>
nnoremap <leader>u <C-w>+
nnoremap <leader>b <C-w>-


call plug#begin()
  " Vim Plugin
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " NeoVim
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'rust-lang/rust.vim'

  " copilot (Install from comand line)
  " Plug 'github/copilot.vim'
call plug#end()


" nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
noremap <C-f> :NERDTreeFind<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" nvim-telescope/telescope.nvim
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" gitsigns
" require('gitsigns').setup()