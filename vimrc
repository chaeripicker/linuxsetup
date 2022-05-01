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
call plug#end()

" Settings: {{{
filetype indent plugin on
if !exists('g:syntax_on') | syntax enable | endif
set encoding=utf-8
scriptencoding utf-8

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
map <space>t <Esc>:tabnew<CR>
map <space>e <Esc>:E<CR>
map <space><space> <Esc>:
imap <space><space> <Esc>:
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
" }}}

" Sharpenup: {{{
" All sharpenup mappings will begin with `<Space>os`, e.g. `<Space>osgd` for
" :OmniSharpGotoDefinition
let g:sharpenup_map_prefix = '<Space>s'
let g:sharpenup_statusline_opts = {
\ 'TextLoading': ' O#: %s loading... (%p of %P) ',
\ 'TextReady': 'O#',
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

let g:lightline = {
\ 'colorscheme': 'solarized',
\ 'active': {
\   'right': [
\     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
\     ['lineinfo'], ['percent'],
\     ['fileformat', 'fileencoding', 'filetype', 'sharpenup']
\   ]
\ },
\ 'inactive': {
\   'right': [['lineinfo'], ['percent'], ['sharpenup']]
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
\  }
\}
" Use unicode chars for ale indicators in the statusline
let g:lightline#ale#indicator_checking = "~"
"let g:lightline#ale#indicator_infos = "\uf129 "
"let g:lightline#ale#indicator_warnings = "\uf071 "
"let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "OK"
