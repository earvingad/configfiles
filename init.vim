" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
" set nocompatible                " Use Vim defaults instead of 100% vi compatibility
 set backspace=indent,eol,start  " more powerful backspacing

 " Now we set some defaults for the editor
 set history=50                  " keep 50 lines of command line history
 set ruler                       " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

" Display options
set showmode
set showcmd

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch

set nocompatible              " be iMproved, required
filetype on                  " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin("~/.config/nvim/bundle")		" required, all plugins must appear after this line.

Plugin 'dylanaraps/wal.vim'
Plugin 'gmarik/Vundle.vim'							" Vundle
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax' 
Plugin 'vim-airline/vim-airline'					" Airline
Plugin 'vim-airline/vim-airline-themes'				" Airline Themes
Plugin 'junegunn/goyo.vim' 

" Deoplete
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" neosnippet
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'

call vundle#end()		" required, all plugins must appear before this line.

filetype plugin indent on    " required

" Set color/line number
syntax on
filetype plugin on
set number

if has('gui_running')
 " Make shift-insert work like in Xterm
   map <S-Insert> <MiddleMouse>
   map! <S-Insert> <MiddleMouse>
endif
" Mouse scrolling
set mouse=a
set scroll=20
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
set guicursor=a:blinkon100
" Save cursor postion
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

"""""""""""""
" Status line
"""""""""""""
" Always show statusline
set laststatus=2

" Use 256 coluurs (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Airline theme
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='wal'

" Colorscheme
set background=dark
colorscheme wal

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode
" No backup files
set noswapfile
set nobackup  

" Activate spelling
set spell
"set spelllang=es,es,fr
"set complete+=kspell

" remap spell
imap <c-d> <c-g>u<Esc>z=<c-g>u
nmap <c-d> z=<c-o>
imap <c-f> <c-g>u<Esc>[sz=<c-g>u
nmap <c-f> [s<z=c-o>
imap <c-g> <c-g>u<Esc>]sz=<c-g>u
nmap <c-g> ]s<z=c-o>

" Pandoc config
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#command#autoexec_on_writes = 1
"let g:pandoc#command#autoexec_command = "Pandoc pdf -Vmainfont='Helvetica Neue'"
"let g:pandoc#command#autoexec_command = "Pandoc pdf --pdf-engine=pdflatex -H /home/earving/Plantillas/headerMD.tex -V documentclass=article -V fontsize=12pt -V papersize=letter"
let g:pandoc#command#autoexec_command = ":!pandoc --pdf-engine=pdflatex -H /home/earving/Plantillas/headerMD.tex -V documentclass=article -V fontsize=12pt -V papersize=letter -o %:r.pdf %"
" enable deoplete at start
let g:deoplete#enable_at_startup = 1

" enable neosnippet
let g:neosnippet#snippets_directory = '.vim/bundle/neosnippet-snippets/neosnippets'
let g:neosnippet#enable_completed_snippet = 1
" Neosnippet Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" vim copy/pasto from clipboard
vnoremap <A-c> "+y
nnoremap <A-v> "+p
inoremap <A-v> <Esc>"+p<Esc>a
" Enter vim-pandoc mode
nmap <C-s> <Esc>:set ft=pandoc<Esc>
" close other splits just keep main
nmap <C-z> <Esc>:on<Esc>
" pdflatex related
" save and compile
inoremap <A-m> <Esc>:w<Esc>:!~/.scripts/pdflatexcompile.sh % <Esc>
nnoremap <A-m> <Esc>:w<Esc>:!~/.scripts/pdflatexcompile.sh  % <Esc>
"noremap <F5> <Esc>:w<Esc>:!pdflatex % --output-directory=$(dirname %) <Esc>
" clean junk files
noremap <A-n> <Esc>:!~/.config/texstudio/cleanlatexjunk.sh -f % $(dirname %)<Esc>
" Open pdf file
noremap <A-b> <Esc>:!zathura %:r.pdf & exit<Esc>
" enter-quit Goyo
noremap <A-g> :Goyo<CR>
noremap <A-h> :Goyo!<CR>
