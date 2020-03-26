" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
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

Plugin 'dylanaraps/wal.vim'             " pyWal themes
Plugin 'gmarik/Vundle.vim'              " Vundle
Plugin 'vim-airline/vim-airline'        " Airline
Plugin 'vim-airline/vim-airline-themes' " Airline Themes
Plugin 'junegunn/goyo.vim'              " Reduce distractions with Goyo
Plugin 'vim-voom/voom'                  " Tags for latex
Plugin 'matze/vim-tex-fold'             " Fold support for latex
Plugin 'jiangmiao/auto-pairs'           " Autopairs
"icons for vim
Plugin 'ryanoasis/vim-devicons'

" indent guide
Plugin 'nathanaelkane/vim-indent-guides'

" Deoplete
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Ultisnips
Plugin 'SirVer/ultisnips'

" Conceal
Plugin 'KeitaNakamura/tex-conceal.vim'  
call vundle#end()       " required, all plugins must appear before this line.

"Tab of 4 spaces
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
filetype plugin indent on

" Set color/line number
syntax on
filetype plugin on
set number

" Mouse scrolling
set mouse=a
set scroll=20
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
set guicursor=a:blinkon100
" Save cursor position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Set leader key
let mapleader = "-"

"""""""""""""
" Status line
"""""""""""""
" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
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
"set spell
"set spelllang=en,es,fr
"set complete+=kspell

" remap spell
inoremap <c-d> <c-g>u<Esc>z=<c-g>u
nnoremap <c-d> z=<c-o>
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <C-l> [s1z=<c-o>

" VOom
let g:voom_python_versions = [3] 
let g:voom_tree_width = 20

" enable deoplete at start
let g:deoplete#enable_at_startup = 1
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Ultisnips
let g:UltiSnipsSnippetDirectories=["/home/earving/.config/nvim/bundle/ultisnips/autoload/MySnippets"]
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" For conceal markers.
set conceallevel=2
let g:tex_conceal='abdmgs'

" Save file
inoremap <a-w> <Esc>:w<Esc>i
nnoremap <a-w> :w<Esc>
inoremap <a-q> <Esc>:wq<Esc>
nnoremap <a-q> :wq<Esc>
inoremap <a-x> <Esc>:q!<Esc>
nnoremap <a-x> :q!<Esc>
" vim copy/paste from clipboard
vnoremap <A-c> "+y
nnoremap <A-v> "+p
inoremap <A-v> <Esc>"+p<Esc>a
" Enter tex filetype mode
nnoremap <Leader>s <Esc>:set filetype=tex<CR>:set spelllang:fr,es<Esc>
nnoremap <Leader>t :set filetype=tex<CR>
nnoremap <Leader>e :set spelllang=es<CR>
" Display table of contents
nnoremap <Leader>c :Voom latex<CR>
" Fold options for latex documents
"nnoremap <Leader>f :setlocal foldmethod=indent<CR>
let g:tex_fold_override_foldtext = 1
let g:tex_fold_additional_envs = ['minipage', 'enumerate']
" close other splits just keep main
nmap <C-z> <Esc>:on<Esc>
" Insert newline tex syntax 
inoremap <a-CR> \\<CR>

" pdflatex related
" save and compile
inoremap <A-m> <Esc>:w<Esc>:!~/.scripts/pdflatexcompile.sh % <Esc>a
nnoremap <A-m> <Esc>:w<Esc>:!~/.scripts/pdflatexcompile.sh % <Esc>

"noremap <F5> <Esc>:w<Esc>:!pdflatex % --output-directory=$(dirname %) <Esc>
" clean junk files
noremap <A-n> <Esc>:!~/.config/texstudio/cleanlatexjunk.sh -f % $(dirname %)<Esc>
" Open pdf file
noremap <A-b> <Esc>:!zathura %:r.pdf & exit<Esc>
" enter-quit Goyo
noremap <A-g> :Goyo 90x100%<CR>
noremap <A-h> :Goyo!<CR>
" Automatic LaTeX template when creating a new tex file
augroup templates
    autocmd BufNewFile *.tex 0r ~/Plantillas/simple.tex 
    autocmd BufNewFile *.tex set filetype=tex 
    autocmd BufNewFile *.tex execute 15
    autocmd BufNewFile *.md 0r ~/Plantillas/markdown.md
    autocmd BufNewFile *.md set filetype=markdown 
    autocmd BufNewFile *.md execute 10
augroup END

" indent at start
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
set listchars=space:│
set list
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermfg=5   ctermbg=None
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=2 ctermbg=None

" Autopairs
let g:AutoPairsShortcutJump='<A-i>'
let g:AutoPairsShortcutFastWrap='<A-o>'
let g:AutoPairsFlyMode = 1


