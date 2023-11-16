call plug#begin()

Plug 'markstory/vim-zoomwin' "Allows me to toggle a buffer 
Plug 'vim-airline/vim-airline'
Plug '~/.config/nvim/plugged/which-key.nvim'
"
" Nicht gut integriert
Plug 'ctrlpvim/ctrlp.vim' "Fuzzy file finder
Plug 'neovim/nvim-lspconfig' "Fuzzy file finder
" TODO 
Plug 'ggandor/lightspeed.nvim'
" TODO
" Plug 'neovim/nvim-lspconfig' ", {'for' : ['c', 'cpp', 'h', 'hpp'] }
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

Plug 'snakemake/snakemake', {'rtp': 'misc/vim'}


Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" TODO
Plug 'nvim-treesitter/nvim-treesitter' "much better syntax highlighting 


Plug 'simrat39/symbols-outline.nvim'

Plug 'alaviss/nim.nvim'


Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-lsp'
Plug 'ionide/Ionide-vim'

"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
call plug#end()

let g:deoplete#enable_at_startup = 1


let maplocalleader = ';'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

source /home/td/.config/nvim/plugged/vim-bbye/plugin/bbye.vim
source /home/td/.config/nvim/vim/r_vim.vim


" open new split panes to right and below
set splitright
set rnu
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>


set number
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" L Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile


set path+=**
:tnoremap <Esc> <C-\><C-n>

""nnoremap <SPACE> <Nop>
map <Space> <Leader>
"" This would screw up R
"map <Space> <localleader>

nnoremap <SPACE><TAB> :b!#<CR>



set timeoutlen=200



autocmd Filetype java setlocal tabstop=2
autocmd Filetype java setlocal shiftwidth=2

autocmd Filetype css setlocal tabstop=4
autocmd Filetype html setlocal tabstop=4

autocmd Filetype Rmd setlocal tabstop=2
autocmd Filetype Rmd setlocal shiftwidth=2

autocmd Filetype R setlocal tabstop=2
autocmd Filetype R setlocal shiftwidth=2

autocmd Filetype c setlocal tabstop=2
autocmd Filetype c setlocal shiftwidth=2

autocmd! Filetype h setlocal tabstop=2
autocmd! Filetype h setlocal shiftwidth=2
au BufWinEnter *.h set shiftwidth=2


autocmd Filetype tex setlocal tabstop=2
autocmd Filetype tex setlocal shiftwidth=2

autocmd Filetype cpp setlocal tabstop=2
autocmd Filetype hpp setlocal tabstop=2

autocmd Filetype cpp setlocal shiftwidth=2
autocmd Filetype hpp setlocal shiftwidth=2


"au BufRead,BufNewFile *.roc set filetype=roc
"
"
au BufNewFile,BufRead *.R set tabstop =2
au BufNewFile,BufRead *.R set shiftwidth =2


au bufnewfile,bufread *.fs set tabstop =2
au bufnewfile,bufread *.fs set shiftwidth =2

au bufnewfile,bufread *.fsx set tabstop =2
au bufnewfile,bufread *.fsx set shiftwidth =2

au BufNewFile,BufRead *.fsproj set tabstop =2
au BufNewFile,BufRead *.fsproj set shiftwidth =2

au BufNewFile,BufRead *.nim setfiletype nim
au BufNewFile,BufRead *.nim set tabstop =2
au BufNewFile,BufRead *.nim set shiftwidth =2

"autocmd Filetype nim setglobal tabstop =2
"autocmd Filetype nim setglobal shiftwidth =2

au BufNewFile,BufRead *.nim setfiletype lua
autocmd Filetype lua setlocal tabstop=2
autocmd Filetype lua setlocal shiftwidth=2

autocmd Filetype tex setlocal tabstop=2
autocmd Filetype tex setlocal shiftwidth=2

autocmd Filetype axaml setlocal tabstop=2
autocmd Filetype axaml setlocal shiftwidth=2

autocmd Filetype cs setlocal tabstop=4
autocmd Filetype cs setlocal shiftwidth=4



au BufNewFile,BufRead *.go setfiletype go
autocmd Filetype go setlocal tabstop=2
autocmd Filetype go setlocal shiftwidth=2

au BufNewFile,BufRead *.py setfiletype python
au BufNewFile,BufRead *.py set tabstop =2
au BufNewFile,BufRead *.py set shiftwidth =2


au BufNewFile,BufRead *.m set tabstop =2
au BufNewFile,BufRead *.m set shiftwidth =2
" 
autocmd Filetype py setlocal tabstop=2
autocmd Filetype py setlocal shiftwidth=2


set expandtab
set clipboard=unnamedplus

" which-key config
" source $HOME/.config/nvim/which-key.vim

 "luafile ~/.config/nvim/lua/lsp.lua
 luafile ~/.config/nvim/lua/which_key.lua
 luafile ~/.config/nvim/lua/lsp.lua
 luafile ~/.config/nvim/lua/lsp.lua
 luafile ~/.config/nvim/lua/python.lua
 "luafile ~/.config/nvim/lua/treesitter.lua
" Required by vim+ctrlspace
set nocompatible
set hidden
set encoding=utf-8
set showtabline=0



"Fix this
autocmd BufRead,BufNewFile *.nim set foldlevel=100
au BufWinLeave *.nim mkview
au BufWinEnter *.nim silent loadview


autocmd BufRead,BufNewFile *.cpp set foldlevel=100
au BufWinLeave *.cpp mkview
au BufWinEnter *.cpp silent loadview


autocmd BufRead,BufNewFile *.h set foldlevel=100
au BufWinLeave *.h mkview
au BufWinEnter *.h silent loadview


autocmd BufRead,BufNewFile *.go set foldlevel=100

"function! s:on_lsp_buffer_enabled() abort
    "setlocal omnifunc=lsp#complete
    "setlocal signcolumn=yes
    "if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    "nmap <buffer> gd <plug>(lsp-definition)
    "nmap <buffer> <leader>ss <plug>(lsp-document-symbol-search)
    "nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    "nmap <buffer> <leader>fr <plug>(lsp-references)
    "nmap <buffer> gi <plug>(lsp-implementation)
    "nmap <buffer> gt <plug>(lsp-type-definition)
    "nmap <buffer> <leader>rn <plug>(lsp-rename)
    "nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    "nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    "nmap <buffer> K <plug>(lsp-hover)
    "inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    "inoremap <buffer> <expr><c-d> lsp#scroll(-4)
    "LspDocumentSymbol                                       *:LspDocumentSymbol*
    "Gets the symbols for the current document.

     "LspDocumentSymbolSearch                             *:LspDocumentSymbolSearch*

     "Search the symbols for the current document and navigate.
     "LspPeekTypeDefinition                               *:LspPeekTypeDefinition*


    "let g:lsp_format_sync_timeout = 1000
    "autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
"endfunction


        
set noshowmode  " to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command line bar

command! Scratch lua require'tools'.makeScratch()


set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()


