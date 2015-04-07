"pathogen: vim plugin manage
call pathogen#infect()
syntax on
filetype plugin indent on

"window always display status line
"set laststatus=1
"set statusline=%F\ %r\ %m%*%=%l/%L\ %c\ %p%%

"in order to switch between buffers with unsaved change
set hidden
"tab   - buffer next
map <tab> :bn<cr>
"s-tab - buffer prev
map <s-tab> :bp<cr>

"ctrlp: file, buffer ... finder
let g:ctrlp_map = ',,'
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
set expandtab

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
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
map <silent> tl :TlistToggle<cr>

"auto fold
set foldenable
set foldmethod=syntax
set foldcolumn=0
set foldminlines=3
set foldlevel=4
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' :'zo')<CR>

"auto load tags and cscope database
function! AutoLoadCTagsAndCScope()
    let max = 5
    let dir = './'
    let i = 0
    let break = 0
    while isdirectory(dir) && i < max
        if filereadable(dir . 'cscope.out')
            execute 'cs add ' . dir . 'cscope.out'
            let break = 1
        endif
        if filereadable(dir . 'tags')
           execute 'set tags =' . dir . 'tags'
           let break = 1
        endif
        if break == 1
            execute 'lcd ' . dir
            break
        endif
        let dir = dir . '../'
        let i = i + 1
    endwhile
endf

"cscope
if has("cscope")
    set csto=1
    set cst
    set nocsverb
    call AutoLoadCTagsAndCScope()
    set csverb

    "find symbol
    nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    "find tag/define
    nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    "find who call this fun
    nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    "find egrep mode
    nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    "find which fun call by this fun
    nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

