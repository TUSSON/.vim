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
map <silent> th <C-O>:sp #<cr>
map <silent> tv <C-O>:vsp #<cr>

"auto fold
set foldenable
set foldmethod=syntax
set foldcolumn=0
set foldminlines=3
set foldlevel=6
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc' :'zo')<CR>

"symbol: find all references to the token under cursor
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>i :cs find i <C-R>=expand("%:p:t")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

"if &diff
    set background=dark
    colorscheme solarized
"endif

"quick jump to current function name
"nmap <silent> <leader>f ?<C-R>=escape(Tlist_Get_Tag_Prototype_By_Line(expand("%"), eval(line(".")-1)), '[]*')<CR><CR>b:keepjumps exe '/<C-R>=expand(Tlist_Get_Tagname_By_Line(expand("%"), eval(line(".")+2)))<CR>'<CR>:keepjumps normal n<CR>:noh<CR>:call histdel("search", -1)<CR>:let @/ = histget("search", -1)<CR>

nmap <silent> <leader>f :call searchdecl('<C-R>=expand(Tlist_Get_Tagname_By_Line(expand("%"), eval(line(".")-1)))<CR>', 0, 1)<CR>
nmap <leader>g :TlistShowPrototype<CR>

" Always show the status line
set laststatus=2
set statusline=%P\ \ %-10.(%l,%c%V%)%<%f\ %h%m%r[%L]

hi CursorLine cterm=bold ctermfg=NONE ctermbg=NONE
hi StatusLine cterm=NONE ctermfg=14 ctermbg=0
hi StatusLineNC cterm=NONE ctermfg=10 ctermbg=0
hi VertSplit  cterm=NONE ctermfg=8 ctermbg=0
hi Visual     cterm=reverse ctermfg=NONE ctermbg=NONE

hi TabLine    cterm=NONE ctermfg=10 ctermbg=0
hi TabLineSel cterm=NONE ctermfg=14 ctermbg=0
hi TabLineFill cterm=NONE ctermfg=0 ctermbg=0

" Not to enable plugin by default
let g:scroll_position_auto_enable = 0

" Default markers
let g:scroll_position_marker         = '▕'

" Additional markers disabled by default due to slow rendering
"let g:scroll_position_jump = '-'
"let g:scroll_position_change = 'x'

hi SignColumn                  ctermfg=8   ctermbg=0
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

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
