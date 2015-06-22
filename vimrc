set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

"pathogen: vim plugin manage
call pathogen#infect()
syntax on
filetype indent on

"window always display status line
"set laststatus=1
"set statusline=%F\ %r\ %m%*%=%l/%L\ %c\ %p%%

let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>ww :w!<cr>
nmap <leader>wq :wq<cr>

nmap <leader>qq :q!<cr>
nmap <leader>qa :qa!<cr>

nmap <silent> <leader>ls :set list !<cr>
nmap <silent> <leader>ln :set nu !<cr>
nmap <silent> <leader><cr> :noh<cr>

set nu
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
inoremap <c-j> <c-o>gj
inoremap <c-k> <c-o>gk
inoremap <C-r>u <esc>gUiwea
inoremap <C-r>p <c-r>"

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
      \ -g ""'

"spell checking
set dictionary+=/usr/share/dict/words
map ,ss :setlocal spell!<cr>

set nobackup
set autowrite

"syntax highlight
syntax enable
set syntax=on

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

map <silent> tl :TlistToggle<cr>
map <silent> tt <C-O>:tabnew #<cr>
map <silent> th <C-O>:sp #<cr>
map <silent> tv <C-O>:vsp #<cr>

"auto fold
set foldenable
set foldmethod=syntax
set foldcolumn=0
set foldminlines=3
set foldlevel=4
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc' :'zo')<CR>

"symbol: find all references to the token under cursor
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

"if &diff
    set background=dark
    colorscheme solarized
"endif

"quick jump to current function name
"nmap <silent> <leader>f ?<C-R>=escape(Tlist_Get_Tag_Prototype_By_Line(expand("%"), eval(line(".")-1)), '[]*')<CR><CR>b:keepjumps exe '/<C-R>=expand(Tlist_Get_Tagname_By_Line(expand("%"), eval(line(".")+2)))<CR>'<CR>:keepjumps normal n<CR>:noh<CR>:call histdel("search", -1)<CR>:let @/ = histget("search", -1)<CR>

nmap <silent> <leader>f :call searchdecl('<C-R>=expand(Tlist_Get_Tagname_By_Line(expand("%"), eval(line(".")-1)))<CR>')<CR>
nmap <leader>g :TlistShowPrototype<CR>

