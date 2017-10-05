call plug#begin('~/.local/share/nvim/plugged')

" Base
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'jszakmeister/vim-togglecursor'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'tomtom/tlib_vim'
Plug 'tomtom/tcomment_vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mileszs/ack.vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'gregsexton/MatchTag' " Highlight matching HTML tags
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'dkprice/vim-easygrep'
Plug 'ludovicchabant/vim-gutentags' " Keep tags file upto date
Plug 'junegunn/vim-peekaboo' " Easy access to the registers
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'pbogut/deoplete-elm'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Neoterm utils
Plug 'neomake/neomake'
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'

" Themes
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'

" Language
Plug 'sheerun/vim-polyglot'
Plug 'elmcast/elm-vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'chrisbra/csv.vim'
Plug 'jceb/vim-orgmode'

" Nice to have
Plug 'justinmk/vim-gtfo'
Plug 'mhinz/vim-signify'

call plug#end()

" -------------------------------------------- General
let mapleader=","
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set formatoptions=qrn1 "I've forgotten what this does, but it helps...somehow
set ruler "column and row position
set colorcolumn=100 "column guide on the right
set scrolloff=5 "when scrolling, stay this far from extremes of buffer
set timeoutlen=300
set smartindent "indent wisely
set autoindent "auto-indent
set backspace=indent,eol,start "lazy backspacing
set showcmd "show the current command
set laststatus=2 "always show the status line. always!
set lazyredraw
set fillchars+=vert:\ 
set number
set noswapfile
set completeopt=longest,menuone
set clipboard=unnamed
set nobackup
set noswapfile
set hidden
set autoread
set mouse=a
set synmaxcol=200 " Fix for the issue with really long lines

" -------------------------------------------- Search
set ignorecase "case-insenitive searching
set smartcase "do a case-sensitive search if uppercase letters are present
set hlsearch "highlight search results
set incsearch
set inccommand=split

" -------------------------------------------- PaperColor
" set t_Co=256
" set background=light
" colorscheme PaperColor

" -------------------------------------------- Gruvbox
set background=dark
colorscheme gruvbox

" -------------------------------------------- NerdTree
map <LEADER>f :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 24
let g:NERDTreeMinimalUI = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" -------------------------------------------- Elm
let g:polyglot_disabled = ['elm']
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:deoplete#enable_at_startup = 1

" -------------------------------------------- FZF
nnoremap <C-p> :GitFiles<CR>
nnoremap <C-t>f :Files<CR>
nnoremap <C-t>F :GitFiles<CR>
nnoremap <C-t>G :GitFiles?<CR>
nnoremap <C-t>b :Buffers<CR>
nnoremap <C-t>a :Ag
nnoremap <C-t>L :Lines<CR>
nnoremap <C-t>l :BLines<CR>
nnoremap <C-t>T :Tags<CR>
nnoremap <C-t>t :BTags<CR>
nnoremap <C-t>m :Marks<CR>
nnoremap <C-t>w :Windows<CR>
nnoremap <C-t>h :History<CR>
nnoremap <C-t>H :History:<CR>
nnoremap <C-t>/ :History/<CR>

" -------------------------------------------- Neoterm
let g:neoterm_position = 'vertical'
let g:neoterm_automap_keys = ',tt'
let g:neoterm_shell = 'zsh'
let g:neoterm_autoscroll = 1

nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSendLine<cr>
vnoremap <silent> <f9> :TREPLSendSelection<cr>

nnoremap <silent> ,th :call neoterm#close()<cr>
nnoremap <silent> ,tl :call neoterm#clear()<cr>
nnoremap <silent> ,tc :call neoterm#kill()<cr>

command! Troutes :T rake routes
command! -nargs=+ Troute :T rake routes | grep <args>
command! Tmigrate :T rake db:migrate
command! -nargs=+ Tg :T git <args>

" ------------------------------------------- Neomake
let g:neomake_ruby_enabled_makers = ['rubocop', 'reek', 'mri']
let g:neomake_elixir_enabled_makers = []
let g:neomake_elm_enabled_makers = []
let g:neomake_javascript_enabled_makers = ['eslint']

autocmd! BufWritePost * Neomake

" --------------------------------------------  vim-test
let test#strategy = 'neoterm'
let test#ruby#rspec#options = '-cfd'

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" --------------------------------------------  UltiSnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" -------------------------------------------- Misc Plugins
let g:airline_powerline_fonts = 1
let g:ackprg = 'ag --vimgrep'
let g:signify_vcs_list = ['git']
let g:gtfo#terminals = { 'mac': 'iterm' }
let g:vim_markdown_folding_disabled = 1


nnoremap \ :Ag<SPACE>
nnoremap K :Ag<SPACE><C-R><C-W><CR>

" -------------------------------------------- Shortcuts
" Helpers to compensate for all different when saving or quiting
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Save
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>w :update<cr>

" Esc
inoremap jk <Esc>

" Circular tab navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" Moving Lines
nnoremap <silent> <C-j> :move+<cr>
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

" General shortcuts
nnoremap <leader>ev        :e $MYVIMRC<CR>
nnoremap <leader><leader>v :source $MYVIMRC<CR>
nnoremap <F2>              :NERDTreeToggle<CR>
nnoremap <leader>n         :NERDTreeFind<CR>
nnoremap <leader>j         :FixWhitespace<CR>
nnoremap nw                :set nowrap<CR>

map <leader>c <c-_><c-_>
map <leader>f :noh<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
