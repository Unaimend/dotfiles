call plug#begin()

Plug 'alaviss/nim.nvim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'dense-analysis/ale'
Plug 'markstory/vim-zoomwin'
Plug 'vim-airline/vim-airline'


call plug#end()

nnoremap <SPACE> <Nop>
nnoremap <SPACE>l <C-w><C-l>
nnoremap <SPACE>h <C-w><C-h>
nnoremap <SPACE>z :ZoomToggle<CR>
nnoremap <SPACE>fo :foldopen<CR>
nnoremap <SPACE>fc :foldclose<CR>
nnoremap <SPACE><TAB> :b!#<CR>
autocmd Filetype css setlocal tabstop=4
autocmd Filetype html setlocal tabstop=4
set expandtab
set clipboard=unnamedplus



let s:nimlspexecutable = "nimlsp"
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

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


"Fix this
autocmd BufRead,BufNewFile *.nim set foldlevel=100
au BufWinLeave * mkview
au BufWinEnter * silent loadview



function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)
    "LspDocumentSymbol                                       *:LspDocumentSymbol*
    "Gets the symbols for the current document.

     "LspDocumentSymbolSearch                             *:LspDocumentSymbolSearch*

     "Search the symbols for the current document and navigate.
     "LspPeekTypeDefinition                               *:LspPeekTypeDefinition*


    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


set noshowmode  " to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command line bar
