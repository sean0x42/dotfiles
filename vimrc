" =================================
"             PLUGINS
" =================================
" {{{
call plug#begin(stdpath('data') . '/plugged')

" Functionality {{{
" -----------------

" Conquer of Completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'ctrlpvim/ctrlp.vim'      " Ctrl + P
Plug 'mhinz/vim-sayonara'      " Sane buffer and window deletion
Plug 'Yggdroot/indentLine'     " Indentation line
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
" }}}

" Theming {{{
" -----------
Plug 'vim-airline/vim-airline-themes'
Plug 'ayu-theme/ayu-vim'
" }}}

" JSON and JavaScript {{{
" -----------------------
Plug 'pangloss/vim-javascript'    " JS syntax highlighting
Plug 'leafgarland/typescript-vim' " Typescript syntax highlighting
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'jparise/vim-graphql'
Plug 'evanleck/vim-svelte', { 'branch': 'main' }
" }}}

" Markdown and Writing {{{
" ------------------------
Plug 'plasticboy/vim-markdown'
Plug 'jxnblk/vim-mdx-js'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" }}}

" Misc Language Support {{{
" -------------------------
Plug 'rust-lang/rust.vim'
Plug 'elzr/vim-json'
Plug 'cespare/vim-toml'
Plug 'ron-rs/ron.vim'
" }}}

call plug#end()
" }}}


" =================================
"             SETTINGS
" =================================
" {{{

set nocompatible                " Required for COC

" Generic {{{
" -----------
set number                      " Show line numbers
set numberwidth=4               " 5 spaces for line numbers
set backspace=indent,eol,start  " Make backspace key a bit more powerful
set showcmd                     " Show command as I'm typing
set noshowmode                  " Mode will be shown by airline
set noswapfile                  " Disable for COC
set nobackup                    " Disable for COC
set nowritebackup
set splitright                  " Split to the right when splitting vertically
set splitbelow                  " Split below when splitting horizontally
set laststatus=2
set hidden                      " Required for COC
set ruler                       " Show cursor position always
set noshowmatch                 " Do not show matching parens/brackets
set conceallevel=0              " Disable concealment
set notimeout                   " Time out on key codes but not mappings
set ttimeout
set ttimeoutlen=10
set complete=.,w,b,u,t          " Better completion
set completeopt=longest,menuone
set scrolloff=8                 " Keep at least 8 rows above/below cursor
set display+=lastline
set nojoinspaces                " Use one space, not two, after punctuation
set list listchars=tab:»·,trail:·,nbsp:· " Display trailing whitespace
set cmdheight=2                 " For COC
set updatetime=300              " For COC
set shortmess+=c                " For COC
set signcolumn=yes              " Always show sign column, for COC
" }}}

" Theme & Colours {{{
" -------------------
set termguicolors
let ayucolor="mirage"
colorscheme ayu
" }}}

" Line Wrapping {{{
" -----------------
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=81
" }}}

" Indentation {{{
" ---------------
filetype off
filetype plugin indent on       " Enable indent according to file type
set autoindent                  " Infer indent based on context
set complete-=1
set smarttab                    " Infer tab expansion? 
set expandtab                   " Expand tabs into spaces
set tabstop=2                   " Default to 2 spaces per tab...
set softtabstop=2
set shiftwidth=2                " ...to be configured per language later
set shiftround                  " Round '<' and '>' to multiples of shiftwidth
" }}}

" Syntax Highlighting {{{
" -----------------------
syntax sync minlines=256
set synmaxcol=300
" }}}

" Read/Write {{{
" --------------
set encoding=utf-8
set autowrite                   " Automatically write before running commands 
set autoread                    " Reread changed files automatically
au FocusLost * :wa              " Save file when focus is lost
set fileformats=unix,dos,mac    " Set sane file format order
" }}}

" Search {{{
" ----------
set incsearch                   " Show search matches while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Case insensitive searching
set smartcase                   " ... but not when search contains upper case chars
" }}}

" Performance {{{
" ---------------
set lazyredraw                  " Wait to redraw
set nocursorcolumn              " Speed up syntax highlighting
set nocursorline
" }}}

" Wild Menu {{{
" -------------
set wildmenu
set wildmode=list:full

set wildignore+=.git                             " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution filesode=list:full
" }}}

" Mouse {{{
" ---------
if has('mouse')
  set mouse=a
endif

let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux" && !has('nvim')
  set ttymouse=xterm
endif
" }}}

" }}}


" =================================
"           FILE CONFIG
" =================================
" {{{

" NGINX {{{
" ---------
au FileType nginx setlocal noet
augroup filetypedetect
  au BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
augroup END
" }}}

" Vim {{{
" -------
au BufNewFile,BufRead *.vim setlocal noexpandtab
au FileType vim setlocal foldmethod=marker
" }}}

" Markdown {{{
" ------------
au BufNewFile,BufRead *.md setlocal spell cole=0
" }}}

" YAML {{{
" --------
au BufNewFile,BufRead *yml,*.yaml setlocal spell
" }}}

au FileType fstab,systemd,gitconfig setlocal noexpandtab

" JSON {{{
" --------
au FileType json syntax match Comment +\/\/.\+$+
" }}}

" Git Commmits {{{
" ----------------
au FileType gitcommit setlocal spell
" }}}

" JavaScript and JSX {{{
" ----------------------
au BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
au BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
" }}}

" Rust {{{
" --------
au FileType rust setlocal ts=4 sts=4 sw=4
" }}}

" ZSH {{{
" -------
au FileType zsh setlocal foldmethod=marker
" }}}

" }}}


" =================================
"          PLUGIN CONFIG
" =================================
" {{{

" COC {{{
" -------
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ ]
" }}}

" IndentLine {{{
" --------------
let g:indentLine_char = '⎸'
let g:indentLine_first_char = '⎸'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}}

" ctrl+p {{{
" -------------
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" }}}

" vim-javascript {{{
" ------------------
let g:javascript_plugin_jsdoc = 1 " Enable syntax highlighting in JSDocs
" }}}

" vim-prettier {{{
" ------------
let g:prettier#autoformat = 1
" }}}

" vim-markdown {{{
" ----------------
let g:vim_markdown_frontmatter=1      " Enable YAML frontmatter
let g:vim_markdown_strikethrough=1    " Enable strikethrough
let g:vim_markdown_conceal=0          " Disable concealment
let g:vim_markdown_conceal_code_blocks=0
let g:vim_markdown_folding_disabled=1 " Disable automatic folding, which causes issues with Prettier's autoformat
" }}}

" rust.vim {{{
" ------------
let g:rustfmt_autosave = 1
" }}}

" nerdtree {{{
" ------------
" Show dotfiles
let NERDTreeShowHidden=1

" Automatically close Vim if only NERD Tree tab remains
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

" vim-airline {{{
" ---------------
let g:airline#extensions#tabline#enabled=1 " Enable better tabs
let g:airline_theme='ayu_mirage'
" }}}

" goyo.vim {{{
" ------------
let g:goyo_width=82
" }}}

" limelight.vim {{{
" -----------------
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }}}

" vim-json {{{
" ------------
let g:vim_json_syntax_conceal=0
" }}}

" vim-svelte {{{
" --------------
let g:svelte_preprocessors = ['typescript']
" }}}

" }}}


" =================================
"             KEYBINDS
" =================================
" {{{

" Leader {{{
" ----------
let mapleader = ','
let g:mapleader = ','
" }}}

" Generic {{{
" -----------

" Ctrl U in insert mode deletes a lot. Use Ctrl G u to first break undo,
" so that you can undo Ctrl U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Fast save
nmap <leader>w :w!<CR>

" Center screen
nnoremap <space> zz

nnoremap <leader>s :sort<CR>

" Sanely close current buffer
nnoremap <silent> <leader>q :Sayonara<CR>

" Toggle spelling mistake highlight
nnoremap <F6> :setlocal spell! spell?<CR>

" Go to match and center
nnoremap n nzzzv
nnoremap N Nzzzv

" Allow saving files as sudo
cmap w!! w !sudo tee > /dev/null %

" Switch between last two files
" nnoremap <leader><leader> <C-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

nnoremap <leader>j :cnext<CR>
nnoremap <leader>k :cprevious<CR>

" }}}

" NERDTree {{{
" ------------
map <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>
" }}}

" COC {{{
" -------

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" COC }}}

" }}}


" ================================
"             COMMANDS
" ================================
" {{{
" Diff against original file.
" i.e. See changes
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
              \ | wincmd p | diffthis
endif
" }}}
