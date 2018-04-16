set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936


"pathogen: vim plugin manage
call pathogen#infect()
filetype indent on

"window always display status line
"set laststatus=1
"set statusline=%F\ %r\ %m%*%=%l/%L\ %c\ %p%%

let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>ww :w!<cr>
nmap <leader>wq :wq<cr>
nmap <leader>wa :wqa<cr>

nmap <leader>qq :q!<cr>
nmap <leader>qa :qa!<cr>

nmap <silent> <leader>ls :set list !<cr>
nmap <silent> <leader>ln :set nu !<cr>
nmap <silent> <leader>co :set cursorcolumn !<cr>
nmap <silent> <leader><cr> :noh<cr>

"set nu
" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

"in order to switch between buffers with unsaved change
set hidden
"tab   - buffer next
"map <tab> :bn<cr>
"s-tab - buffer prev
"map <s-tab> :bp<cr>

map <silent> <C-h> :tabp<cr>
map <silent> <C-l> :tabn<cr>
map <silent> <C-j> :tabm -1<cr>
map <silent> <C-k> :tabm +1<cr>
map <silent> <leader>tn :tabnew<cr>
map <silent> <leader>to :tabonly<cr>
map <silent> <leader>tc :tabclose<cr>

" move in insert mode
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <esc>o
inoremap <c-k> <esc>ko
inoremap <C-r>u <esc>gUiwea
inoremap <C-r>p <c-r>"
inoremap <C-e>  <esc>A

"ctrlp: file, buffer ... finder
let g:ctrlp_map = ',,'
let g:ctrlp_by_filename = 1
"let g:ctrlp_switch_buffer = 'Et'
"let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

let g:ctrlp_open_multiple_files = 'v'
let g:ctrlp_max_files = 0
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore "cscope.*"
      \ --ignore tags
      \ --ignore .tagfiles
      \ -g ""'

"spell checking
set dictionary+=/usr/share/dict/words
map ,ss :setlocal spell!<cr>

set nobackup
set autowrite

"syntax highlight
syntax enable
syntax on

"tab
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set cursorline
set nocompatible

set backspace=indent,eol,start

"auto find tags
"set tags=tags;
"set autochdir

"serarch: smartcase
set ignorecase smartcase

"incremental searching
set incsearch
"highlight search
set hlsearch


"taglist:
let Tlist_Show_One_File = 1
let Tlist_Process_File_Always = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Display_Tag_Scope = 0
let Tlist_Enable_Fold_Column = 0

map <silent> tl :TlistToggle<cr>
map <silent> tt <C-O>:tabnew #<cr>
map <silent> ts <C-O>:sp #<cr>
map <silent> tv <C-O>:vsp #<cr>

"auto fold
set foldenable
set foldmethod=indent
set foldcolumn=0
set foldminlines=3
set foldlevel=6
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc' :'zo')<CR>

"symbol: find all references to the token under cursor
set cscopequickfix=s-,c-,e-,d-,i-,f-
nmap <leader>2s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <leader>2c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <leader>2e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <leader>2d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <leader>2i :cs find i <C-R>=expand("%:p:t")<CR><CR>:copen<CR>
nmap <leader>2f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>

nnoremap <expr> h (&buftype is# "quickfix" ? "<C-W><CR><C-w>K" : "")
nnoremap <expr> H (&buftype is# "quickfix" ? "<C-W><CR><C-w>K<C-w>b" : "")
nnoremap <expr> o (&buftype is# "quickfix" ? "<CR>" : "")
nnoremap <expr> t (&buftype is# "quickfix" ? "<C-w><CR><C-w>T" : "")
nnoremap <expr> T (&buftype is# "quickfix" ? "<C-w><CR><C-w>TgT<C-W><C-W>" : "")
nnoremap <expr> v (&buftype is# "quickfix" ? "<C-w><CR><C-w>H<C-W>b<C-W>J<C-W>t" : "")
nnoremap <expr> e (&buftype is# "quickfix" ? "<CR><C-w><C-w>:cclose<CR>" : "")
nnoremap <expr> p (&buftype is# "quickfix" ? "<CR>:copen<CR>" : "")
nnoremap <expr> q (&buftype is# "quickfix" ? ":cclose<CR>" : "")
nnoremap <expr> <C-j> (&buftype is# "quickfix" ? "j<CR>:copen<CR>" : "")
nnoremap <expr> <C-k> (&buftype is# "quickfix" ? "k<CR>:copen<CR>" : "")
au BufWinEnter quickfix let w:quickfix_title = 'Keys: q=quit <cr>/e/t/h/v=enter/edit/tab/split/vsplit p/T/H/C-j/C-k=preview'

let g:ag_prg='ag --vimgrep --ignore "cscope.*" --ignore tags --ignore .tagfiles'
"
nmap <leader>ss :Ag <C-R>=expand("<cword>")<CR><CR>
nmap <leader>sa :AgAdd <C-R>=expand("<cword>")<CR><CR>
nmap <leader>sb :AgBuffer <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ag :Ag 
nmap <leader>aa :AgAdd 
nmap <leader>ab :AgBuffer 
nmap <leader>af :AgFile 
let g:ag_highlight=1

"if &diff
    "set background=dark
    colorscheme solarized
"endif

function! DoGoToFunctionHeader(...)
    let Fname = a:1
    let ret = searchdecl(Fname, 0, 1)
    if ret != 0
        call searchdecl(Fname, 1, 1)
    endif
endfunction

"quick jump to current function name
nmap <silent> <leader>f :call DoGoToFunctionHeader('<C-R>=expand(Tlist_Get_Tagname_By_Line(expand("%"), eval(line(".")-1)))<CR>')<CR>
nmap <leader>g :TlistShowPrototype<CR>

" Always show the status line
set laststatus=2
set statusline=%P\ \ %-10.(%l,%c%V%)%f\ %h%m%r[%L]%<-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

hi CursorLine cterm=bold ctermfg=NONE ctermbg=NONE
hi StatusLine cterm=NONE ctermfg=4 ctermbg=NONE
hi StatusLineNC cterm=NONE ctermfg=8 ctermbg=NONE
hi VertSplit  cterm=NONE ctermfg=8 ctermbg=NONE
hi Visual     cterm=reverse ctermfg=NONE ctermbg=NONE

hi TabLine    cterm=NONE ctermfg=blue ctermbg=NONE
hi TabLineSel cterm=NONE ctermfg=red ctermbg=NONE
hi TabLineFill cterm=NONE ctermfg=0 ctermbg=NONE

hi Pmenu cterm=NONE ctermfg=7 ctermbg=8
hi PmenuSel cterm=NONE ctermfg=red ctermbg=8

hi Folded cterm=NONE ctermfg=4 ctermbg=8
hi FoldColumn cterm=NONE ctermfg=5 ctermbg=NONE
hi LineNr cterm=NONE ctermfg=4 ctermbg=NONE
hi MatchParen cterm=NONE ctermfg=3 ctermbg=5

hi DiffText cterm=bold ctermfg=NONE ctermbg=4
hi DiffAdd cterm=bold ctermfg=NONE ctermbg=4
hi DiffChange cterm=NONE ctermfg=NONE ctermbg=NONE
hi DiffDelete cterm=NONE ctermfg=NONE ctermbg=NONE

" Not to enable plugin by default
let g:scroll_position_auto_enable = 0

" Default markers
let g:scroll_position_marker         = '▕'

" Additional markers disabled by default due to slow rendering
"let g:scroll_position_jump = '-'
"let g:scroll_position_change = 'x'

hi SignColumn                  ctermfg=8   ctermbg=NONE
hi ScrollPositionMarker        ctermfg=208 ctermbg=0
hi ScrollPositionChange        ctermfg=124 ctermbg=0
hi ScrollPositionJump          ctermfg=131 ctermbg=0

map <silent> <leader>sp :ScrollPositionToggle<cr>
nmap <silent> zz zz:ScrollPositionUpdate<cr>
nmap <silent> zt zt:ScrollPositionUpdate<cr>
nmap <silent> zb zb:ScrollPositionUpdate<cr>
nnoremap <silent> <c-e> <C-e><c-e>:ScrollPositionUpdate<cr>
nnoremap <silent> <c-y> <C-y><c-y>:ScrollPositionUpdate<cr>

nmap <unique> <silent> <leader>ca <Plug>MarkClear

" vim-easymotion
map zs <Plug>(easymotion-prefix)
map f <Plug>(easymotion-s2)
map zl <Plug>(easymotion-lineforward)
map zj <Plug>(easymotion-j)
map zk <Plug>(easymotion-k)
map zh <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_smartcase = 1

" nerdcommenter
filetype plugin on
"<leader>cs |NERDComSexyComment|
" Comments out the selected lines ``sexily''

"<leader>c$ |NERDComEOLComment|
" Comments the current line from the cursor to the end of line.

"[count]<leader>cu |NERDComUncommentLine|
" Uncomments the selected line(s).

"Reselect visual block after indent/outdent.
vnoremap < <gv
vnoremap > >gv

nnoremap < 0
nnoremap > $
nnoremap 0 ^

let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '=>'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_python_binary_path='/Users/Tusson/bin/python'
au BufRead,BufNewFile *.py map <c-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    exec(open(activate_this).read(), dict(__file__=activate_this))
EOF

nmap mk :YcmDiags<CR>

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:localvimrc_ask=0

map <silent> <leader>g1 :diffget 1<CR> :diffupdate<CR>
map <silent> <leader>g2 :diffget 2<CR> :diffupdate<CR>
map <silent> <leader>g3 :diffget 3<CR> :diffupdate<CR>
map <silent> <leader>g4 :diffget 4<CR> :diffupdate<CR>

nmap <unique> <silent> <leader>e :'<,'>w !bash<CR>
vmap <unique> <silent> <leader>e :'<,'>w !bash<CR>
nnoremap <unique> <silent> <F9> :!clear && python3 %<cr>

highlight BadWhitespace ctermbg=5 guibg=NONE
autocmd ColorScheme * highlight BadWhitespace ctermbg=5 guibg=NONE
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let python_highlight_all=1

" for hex editing
augroup Binary
  au!
  au BufReadPost *.* if &binary | %!xxd
  au BufReadPost *.* set ft=xxd | endif
  au BufWritePre *.* if &binary | %!xxd -r
  au BufWritePre *.* endif
  au BufWritePost *.* if &binary | %!xxd
  au BufWritePost *.* set nomod | endif
augroup END
