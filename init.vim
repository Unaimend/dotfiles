call plug#begin()

Plug 'markstory/vim-zoomwin' "Allows me to toggle a buffer 
Plug 'vim-airline/vim-airline'
Plug '~/.config/nvim/plugged/which-key.nvim'
"
" Nicht gut integriert
Plug 'ctrlpvim/ctrlp.vim' "Fuzzy file finder
Plug 'ggandor/lightspeed.nvim'
Plug 'neovim/nvim-lspconfig' ", {'for' : ['c', 'cpp', 'h', 'hpp'] }
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter' "much better syntax highlighting 


Plug 'simrat39/symbols-outline.nvim'

Plug 'alaviss/nim.nvim'


Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

call plug#end()


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

source /home/td/.config/nvim/plugged/vim-bbye/plugin/bbye.vim
source /home/td/.config/nvim/vim/r_vim.vim


" open new split panes to right and below
set splitright
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

autocmd Filetype lua setlocal tabstop=2
autocmd Filetype lua setlocal shiftwidth=2

autocmd Filetype tex setlocal tabstop=2
autocmd Filetype tex setlocal shiftwidth=2

autocmd Filetype cpp setlocal tabstop=2
autocmd Filetype hpp setlocal tabstop=2

autocmd Filetype cpp setlocal shiftwidth=2
autocmd Filetype hpp setlocal shiftwidth=2


au BufNewFile,BufRead *.nim setfiletype nim
au BufNewFile,BufRead *.nim set tabstop =2
au BufNewFile,BufRead *.nim set shiftwidth =2

"autocmd Filetype nim setglobal tabstop =2
"autocmd Filetype nim setglobal shiftwidth =2


autocmd Filetype tex setlocal tabstop=2
autocmd Filetype tex setlocal shiftwidth=2

autocmd Filetype axaml setlocal tabstop=2
autocmd Filetype axaml setlocal shiftwidth=2

autocmd Filetype cs setlocal tabstop=4
autocmd Filetype cs setlocal shiftwidth=4

set expandtab
set clipboard=unnamedplus

" which-key config
" source $HOME/.config/nvim/which-key.vim

 luafile ~/.config/nvim/lua/lsp.lua
 luafile ~/.config/nvim/lua/which_key.lua
 luafile ~/.config/nvim/lua/treesitter.lua
" Required by vim+ctrlspace
set nocompatible
set hidden
set encoding=utf-8
set showtabline=0
"let g:CtrlSpaceDefaultMappingKey = "<C-space> "
"let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
"let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
"let g:CtrlSpaceSaveWorkspaceOnExit = 1

let s:nimlspexecutable = "nimlsp"
let s:clspexec= "clangd-11"
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('/tmp/vim-lsp.log')
" for asyncomplete.vim log
let g:asyncomplete_log_file = expand('/tmp/asyncomplete.log')

let g:asyncomplete_auto_popup = 0

if executable(s:nimlspexecutable)
   au User lsp_setup call lsp#register_server({
   \ 'name': 'nimlsp',
   \ 'cmd': {server_info->[s:nimlspexecutable]},
   \ 'whitelist': ['nim'],
   \ })
endif



if executable(s:clspexec)
   au User lsp_setup call lsp#register_server({
   \ 'name': 'clangd-11',
   \ 'cmd': {server_info->[s:clspexec]},
   \ 'whitelist': ['cpp'],
   \ })
endif


function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"inoremap <silent><expr> <TAB>
  "\ pumvisible() ? "\<C-n>" :
  "\ <SID>check_back_space() ? "\<TAB>" :
  "\ asyncomplete#force_refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

set foldmethod=syntax

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

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

        
set noshowmode  " to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command line bar

command! Scratch lua require'tools'.makeScratch()


