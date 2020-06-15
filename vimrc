call plug#begin('~/.local/share/nvim/plugged')

" Base
Plug 'ntpeters/vim-better-whitespace'
Plug 'godlygeek/tabular'
Plug 'gregsexton/MatchTag' " Highlight matching HTML tags
Plug 'honza/vim-snippets'
Plug 'jszakmeister/vim-togglecursor'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/vim-peekaboo' " Easy access to the registers
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'plasticboy/vim-markdown'
Plug 'rstacruz/vim-closer'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Neoterm utils
Plug 'neomake/neomake'
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'

" Themes
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'

" Language
Plug 'andys8/vim-elm-syntax'
Plug 'chrisbra/csv.vim'
Plug 'eagletmt/neco-ghc'
Plug 'fatih/vim-go'
Plug 'ledger/vim-ledger'
Plug 'neovimhaskell/haskell-vim'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'udalov/kotlin-vim'

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
set fillchars+=vert:│
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
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" -------------------------------------------- Search
set ignorecase "case-insenitive searching
set smartcase "do a case-sensitive search if uppercase letters are present
set hlsearch "highlight search results
set incsearch

" -------------------------------------------- Gruvbox
set background=dark
colorscheme gruvbox

" -------------------------------------------- NerdTree
map <LEADER>f :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 24
let g:NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.bs\.js$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" -------------------------------------------- Elm
let g:polyglot_disabled = ['elm', 'haskell', 'kotlin']
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1

" -------------------------------------------- FZF
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

nnoremap <C-p> :GitFiles<CR>
nnoremap <C-t>f :Files<CR>
nnoremap <C-t>F :GitFiles<CR>
nnoremap <C-t>G :GitFiles?<CR>
nnoremap <C-t>b :Buffers<CR>
nnoremap <C-t>a :Rg
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
let g:neoterm_size = '25%'
let g:neoterm_default_mod = 'leftabove'
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

nnoremap <silent> <leader>r :CargoRun<CR>

" ------------------------------------------- Neomake
let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']
let g:neomake_elixir_enabled_makers = ['mix', 'credo']
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
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

" -------------------------------------------- Misc Plugins
let g:airline_powerline_fonts = 1
let g:ackprg = 'rg --vimgrep --no-heading'
let g:signify_vcs_list = ['git']
let g:gtfo#terminals = { 'mac': 'iterm' }
let g:vim_markdown_folding_disabled = 1
let g:rustfmt_autosave = 1

nnoremap \ :Rg<SPACE>
nnoremap K :Rg<SPACE><C-R><C-W><CR>

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
nnoremap <leader>j         :StripWhitespace<CR>
nnoremap nw                :set nowrap<CR>

map <leader>c <c-_><c-_>
map <leader>f :noh<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Run a given vim command on the results of alt from a given path.
" See usage below.
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Find the alternate file for the current path and open it
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>
nnoremap <leader>> :w<cr>:call AltCommand(expand('%'), ':vsplit')<cr>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold   :call CocAction('fold', <f-args>)
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>m  :<C-u>CocList marketplace<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
