call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'sirver/ultisnips'
Plug 'nickspoons/vim-sharpenup'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'puremourning/vimspector'
Plug 'tpope/vim-fugitive'
call plug#end()

" Settings: {{{
filetype indent plugin on
" if !exists('g:syntax_on') | syntax enable | endif
set encoding=utf-8
scriptencoding utf-8
set background=dark

set completeopt=menuone,noinsert,noselect,popuphidden
set completepopup=highlight:Pmenu,border:off

set backspace=indent,eol,start
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=-1
set tabstop=8
set textwidth=80
set title

set hidden
set nofixendofline
set nostartofline
set splitbelow
set splitright

set hlsearch
set incsearch
set laststatus=2
set nonumber
set noruler
set noshowmode

set mouse=a
set updatetime=1000
" my maps
map <space>t :tabnew<CR>
map <space>e :E<CR>
map <space>te :Tex<CR>
map <space>g :G<space>
map <space><space> :
map <space>/ :noh<CR>
map <space>rc :e $MYVIMRC<CR>
imap [<space> [<space>]<space>
imap {<CR> {<CR>}<esc>O
map $$ A;<esc>
map K :OmniSharpSignatureHelp<CR>
map <space>l :colorscheme default<CR>:colorscheme rose-pine-dark<CR>
"korean mode
map ㅁ a
map ㅠ b
map ㅊ c
map ㅇ d
map ㄷ e
map ㄹ f
map ㅎ g
map ㅗ h
map ㅑ i
map ㅓ j
map ㅏ k
map ㅣ l
map ㅡ m
map ㅜ n
map ㅐ o
map ㅔ p
map ㅂ q
map ㄱ r
map ㄴ s
map ㅅ t
map ㅕ u
map ㅍ v
map ㅈ w
map ㅌ x
map ㅛ y
map ㅋ z

" }}}


" ALE: {{{
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_info = '·'
let g:ale_sign_style_error = '·'
let g:ale_sign_style_warning = '·'

let g:ale_linters = { 'cs': ['OmniSharp'] }
" }}}

" Asyncomplete: {{{
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <space> pumvisible() ? "\<C-n><space>" : "\<space>"
inoremap <expr> $$ pumvisible() ? "\<C-n>;" : ";"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" }}}

" Sharpenup: {{{
" All sharpenup mappings will begin with `<Space>os`, e.g. `<Space>osgd` for
" :OmniSharpGotoDefinition
let g:sharpenup_map_prefix = '<Space>s'
let g:sharpenup_statusline_opts = {
\ 'TextLoading': ' O#: %s ~ (%p / %P) ',
\ 'TextReady': '#',
\ 'TextDead': ' O#: Not running ',
\ 'Highlight': 0,
\ 'HiLoading': 'SharpenUpLoading',
\ 'HiReady': 'SharpenUpReady',
\ 'HiDead': 'SharpenUpDead'
\}
augroup OmniSharpIntegrations
  autocmd!
  autocmd User OmniSharpProjectUpdated,OmniSharpReady call lightline#update()
augroup END
let g:sharpenup_codeactions = 0
" }}}

" OmniSharp: {{{
let g:OmniSharp_popup_position = 'peek'
  let g:OmniSharp_popup_options = {
  \ 'highlight': 'Normal',
  \ 'padding': [0, 0, 0, 0],
  \ 'border': [1]
  \}
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

let g:OmniSharp_want_snippet = 1
let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}
" }}}

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
map <space>pid :!getddpid<CR>
map <space>5 :call vimspector#Launch()<CR>

let g:lightline = {
\ 'colorscheme': 'rosepine',
\ 'active': {
\   'right': [
\     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
\     ['lineinfo'], ['percent'],
\     ['fileformat', 'fileencoding', 'filetype', 'sharpenup']
\   ]
\ },
\ 'inactive': {
\   'right': [['lineinfo']]
\ },
\ 'component': {
\   'sharpenup': sharpenup#statusline#Build()
\ },
\ 'component_expand': {
\   'linter_checking': 'lightline#ale#checking',
\   'linter_infos': 'lightline#ale#infos',
\   'linter_warnings': 'lightline#ale#warnings',
\   'linter_errors': 'lightline#ale#errors',
\   'linter_ok': 'lightline#ale#ok'
  \  },
  \ 'component_type': {
  \   'linter_checking': 'right',
  \   'linter_infos': 'right',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'right'
\  },
\ 'component_function': {
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \ },
\}
function! LightlineFileencoding()
  return winwidth(0) > 70 ? &fileencoding : ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

" Use unicode chars for ale indicators in the statusline
let g:lightline#ale#indicator_checking = "~"
"let g:lightline#ale#indicator_infos = "\uf129 "
"let g:lightline#ale#indicator_warnings = "\uf071 "
"let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "OK"
