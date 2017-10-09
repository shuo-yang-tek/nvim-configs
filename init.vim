" Plugins
call plug#begin('~/.local/share/nvim/plugged')
   " generic
   Plug 'scrooloose/nerdtree'
   Plug 'tpope/vim-surround'
   Plug 'majutsushi/tagbar'
   Plug 'jiangmiao/auto-pairs'
   Plug 'scrooloose/nerdcommenter'
   Plug 'itchyny/lightline.vim'
   Plug 'nathanaelkane/vim-indent-guides'
   Plug 'simnalamburt/vim-mundo'
   Plug 'ap/vim-buftabline'
	 Plug 'cloudhead/neovim-fuzzy'

   " auto-complete
   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

   " syntastic
   Plug 'vim-syntastic/syntastic'
	 Plug 'mtscout6/syntastic-local-eslint.vim'

	 " markdown
	 Plug 'godlygeek/tabular'
	 Plug 'plasticboy/vim-markdown'

   " javascript
   Plug 'pangloss/vim-javascript'
   Plug 'carlitux/deoplete-ternjs'
   Plug 'othree/jspc.vim'

   " jsx
   Plug 'chemzqm/vim-jsx-improve'

   " pug
   Plug 'digitaltoad/vim-pug'
   Plug 'padawan-php/deoplete-padawan'

   " diff
   Plug 'chrisbra/vim-diff-enhanced'

   " colors
   Plug 'danilo-augusto/vim-afterglow'

   " snips
   Plug 'SirVer/ultisnips'

	 " graphQL
	 Plug 'jparise/vim-graphql'

	 " gitignore
	 Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
	 Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}

call plug#end()

" some generic requires
filetype plugin indent on
syntax enable
syntax on

" colors
set termguicolors
colorscheme afterglow

" lightline
let g:lightline = {
   \ 'colorscheme': 'wombat',
   \ }

" vim-indent-guides
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
hi IndentGuidesOdd guibg=#535353
hi IndentGuidesEven guibg=#9a9a9a

" nerdtree
nnoremap ze :NERDTreeToggle<CR>

" mundo
let g:mundo_right=1
nnoremap zu :MundoToggle<CR>

" tagbar
nnoremap zt :TagbarToggle<CR>

" buftabline
let g:buftabline_numbers=1
let g:buftabline_indicators=1

" deoplete
let g:deoplete#enable_at_startup=1
let g:deoplete#auto_complete_start_length=1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
   \'tern#Complete',
   \'jspc#omni'
   \]

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']   " needs to install jshint with npm
let g:syntastic_php_checkers = ['php']
let g:syntastic_pug_checkers = ['pug_lint']        " needs to install pug-lint with npm
let g:syntastic_less_checkers = ['recess']         " needs to install recess with npm

" ultisnips
let g:UltiSnipsSnippetDirectories = ['ultisnips']
let g:UltiSnipsExpandTrigger = '<c-t>'

" vim-javascript
let g:javascript_plugin_jsdoc=1
set cino=:0

" deoplete-ternjs
let g:deoplete#sources#ternjs#types=1
let g:deoplete#sources#ternjs#depths=1
let g:deoplete#sources#ternjs#docs=1
" let g:tern#command=["tern"]
" let g:tern#arguments=["--persistent"]

" vim-markdown
let g:vim_markdown_new_list_item_indent=2

" auto-complete menu select with TAB
inoremap <expr><TAB> pumvisible() ? "\<CR>" : "\<TAB>"

" Basic Settings
set nocompatible
set enc=utf8
set mouse=nv
set history=1000
set backspace=2
set noerrorbells
set hidden

set ruler
set cursorline
set number

set incsearch
set hlsearch
set smartcase

set wrap
set breakindent
set showbreak=>>>
set linebreak
set nolist

set foldmethod=indent
set foldnestmax=100
set nofoldenable

set noexpandtab
set tabstop=2
set shiftwidth=2
set cindent

"set completeopt-=preview

" close auto-complete hint window when exit insert mode
autocmd InsertLeave * pclose

" Bindings
let mapleader=','

nnoremap <leader><space> :set hlsearch!<CR>
nnoremap <leader>p :set paste!<CR>

nnoremap <leader>rv :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ev :e ~/.config/nvim/init.vim<CR>

nnoremap <F2> :w !sudo tee %

nnoremap z<Left> <C-w>h
nnoremap z<Right> <C-w>l
nnoremap z<Up> <C-w>k
nnoremap z<Down> <C-w>j
nnoremap z\ :vsplit<CR>
nnoremap z- :split<CR>
nnoremap <C-Left> :vertical resize -1<CR>
nnoremap <C-Right> :vertical resize +1<CR>
nnoremap <C-Down> :resize -1<CR>
nnoremap <C-Up> :resize +1<CR>

nnoremap <C-p> :FuzzyOpen<CR>

" diff
if &diff
   autocmd VimEnter * EnhancedDiff histogram
   autocmd VimEnter * highlight clear CursorLine
   autocmd VimEnter * highlight CursorLine gui=underline cterm=underline
endif
