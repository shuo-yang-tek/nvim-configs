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
	 Plug 'MattesGroeger/vim-bookmarks'

	 " local_vimrc
	 Plug 'LucHermitte/lh-vim-lib'
	 Plug 'LucHermitte/local_vimrc'

   " auto-complete
   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

   " syntastic
   "Plug 'vim-syntastic/syntastic'
	 "Plug 'mtscout6/syntastic-local-eslint.vim'

	 " neomake
	 Plug 'neomake/neomake'

	 " markdown
	 Plug 'godlygeek/tabular'
	 Plug 'plasticboy/vim-markdown'

   " javascript
   Plug 'pangloss/vim-javascript'
   Plug 'othree/jspc.vim'
	 Plug 'carlitux/deoplete-ternjs'

   " jsx
   Plug 'chemzqm/vim-jsx-improve'

   " pug
   Plug 'digitaltoad/vim-pug'
   Plug 'padawan-php/deoplete-padawan'

	 " handlebars
   Plug 'mustache/vim-mustache-handlebars'

   " diff
   Plug 'chrisbra/vim-diff-enhanced'

   " colors
   Plug 'danilo-augusto/vim-afterglow'
	 Plug 'jacoborus/tender.vim'
	 Plug 'cseelus/vim-colors-lucid'
	 Plug 'goatslacker/mango.vim'

   " snips
   Plug 'SirVer/ultisnips'

	 " graphQL
	 Plug 'jparise/vim-graphql'

	 " gitignore
	 Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
	 Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}

	 " fzf.vim
	 Plug 'junegunn/fzf.vim'

call plug#end()

" some generic requires
filetype plugin indent on
syntax enable
syntax on

" colors
set termguicolors
set background=dark
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

" local_vimrc
let g:local_vimrc = ['.vimrc_local.vim', '_vimrc_local.vim']

" nerdtree
nnoremap ze :NERDTreeToggle<CR>

" vim-bookmarks
let g:bookmark_no_default_key_mappings = 1
nnoremap <leader>m<space> :BookmarkToggle<cr>
nnoremap <leader>ma :BookmarkShowAll<cr>
nnoremap <leader>mc :BookmarkClear<cr>
nnoremap <leader>m<up> :BookmarkPrev<cr>
nnoremap <leader>m<down> :BookmarkNext<cr>

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
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"let g:syntastic_javascript_checkers = ['eslint']   " needs to install jshint with npm
"let g:syntastic_php_checkers = ['php']
"let g:syntastic_pug_checkers = ['pug_lint']        " needs to install pug-lint with npm
"let g:syntastic_less_checkers = ['recess']         " needs to install recess with npm

" neomake
call neomake#configure#automake('rw')
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_open_list = 2
let g:neomake_list_height = 1

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

set lazyredraw

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

nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Ag<CR>

vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

" diff
if &diff
   autocmd VimEnter * EnhancedDiff histogram
   autocmd VimEnter * highlight clear CursorLine
   autocmd VimEnter * highlight CursorLine gui=underline cterm=underline
endif
