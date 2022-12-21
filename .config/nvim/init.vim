syntax enable
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

set number
set relativenumber

call plug#begin()

Plug 'ervandew/supertab'
Plug 'preservim/nerdtree'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'beyondmarc/glsl.vim'

call plug#end()
let g:deoplete#enable_at_startup = 1
let g:clipboard = {
          \   'name': 'myClipboard',
          \   'copy': {
          \      '+': ['tmux', 'load-buffer', '-'],
          \      '*': ['tmux', 'load-buffer', '-'],
          \    },
          \   'paste': {
          \      '+': ['tmux', 'save-buffer', '-'],
          \      '*': ['tmux', 'save-buffer', '-'],
          \   },
          \   'cache_enabled': 1,
          \ }
colorscheme catppuccin-mocha " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha


nnoremap <C-s> :w<CR>
nnoremap <F3> :set hlsearch!<CR>
nnoremap <C-m> <cmd>lua require("fzf-lua").man_pages()<CR>
nnoremap <C-f> <cmd>lua require("fzf-lua").grep_visual()<CR>
nnoremap <C-p> <cmd>lua require("fzf-lua").files()<CR>
nnoremap <C-t> <cmd>NERDTreeToggle<CR>
nnoremap <F2> :e ~/.config/nvim/init.vim<CR>
