" =================================
" PLUGINS
" =================================

call plug#begin(stdpath('data') . '/plugged')

Plug 'MaxMEllon/vim-jsx-pretty'           " Improve JSX syntax highlighting
Plug 'Yggdroot/indentLine'                " Adds an indent line
Plug 'ayu-theme/ayu-vim'                  " ayu colour scheme
Plug 'cespare/vim-toml'                   " Add TOML support
Plug 'ctrlpvim/ctrlp.vim'                 " Adds Ctrl P fuzzy file finding
Plug 'elzr/vim-json'                      " Add JSON support
Plug 'mhinz/vim-sayonara'                 " Sane buffer and window deletion
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion
Plug 'pangloss/vim-javascript'            " Improve JavaScript indent and syntax
Plug 'plasticboy/vim-markdown'            " Improved Markdown support
Plug 'prettier/vim-prettier',             " Clean JavaScript code
    \ { 'do': 'yarn install' }
Plug 'rust-lang/rust.vim'                 " Syntax highlighting, formatting etc. for Rust
Plug 'scrooloose/nerdtree'                " Add a file browser to the side of the editor
Plug 'tpope/vim-commentary'               " Comment out selection
Plug 'vim-airline/vim-airline'            " Airline UI
Plug 'vim-airline/vim-airline-themes'     " Themes for Airline

call plug#end()



" =================================
" SETTINGS
" =================================

set nocompatible                " Required for COC

" Generic
" -------
set number                      " Show line numbers
set numberwidth=5               " 5 spaces for line numbers
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

" Theme & Colours
" ---------------
set termguicolors
let ayucolor="mirage"
colorscheme ayu

" Line Wrapping
" -------------
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=81

" Indentation
" -----------
filetype off
filetype plugin indent on       " Enable indent according to file type
set autoindent                  " Infer indent based on context
set complete-=1
set smarttab                    " Infer tab expansion? 
set expandtab                   " Expand tabs into spaces
set tabstop=4                   " Default to 4 spaces per tab...
set shiftwidth=4                " ...to be configured per language later
set shiftround                  " Round '<' and '>' to multiples of shiftwidth

" Syntax Highlighting
" -------------------
syntax sync minlines=256
set synmaxcol=300

" Read/Write
" ----------
set encoding=utf-8
set autowrite                   " Automatically write before running commands 
set autoread                    " Reread changed files automatically
au FocusLost * :wa              " Save file when focus is lost
set fileformats=unix,dos,mac    " Set sane file format order

" Search
" ------
set incsearch                   " Show search matches while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Case insensitive searching
set smartcase                   " ... but not when search contains upper case chars

" Performance
" -----------
set lazyredraw                  " Wait to redraw
set nocursorcolumn              " Speed up syntax highlighting
set nocursorline

" Wild Menu
" ---------
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

" Mouse
" -----
if has('mouse')
  set mouse=a
endif

let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux" && !has('nvim')
  set ttymouse=xterm
endif



" =================================
" FILE CONFIG
" =================================

augroup filetypedetect
  au BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  au BufNewFile,BufRead *.bailey setf cd19
augroup END

au BufNewFile,BufRead *.vim setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.md setlocal spell et ts=4 sw=4 sts=4 cole=0
au BufNewFile,BufRead *yml,*.yaml setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.json setlocal expandtab ts=2 sw=2

au FileType nginx setlocal noet ts=4 sw=4 sts=4
au FileType cd19 setlocal et ts=2 sw=2 sts=2

au FileType fstab,systemd set noexpandtab
au FileType gitconfig,sh,toml set noexpandtab

" JSON Comments
au FileType json syntax match Comment +\/\/.\+$+

" Python indent
au BufNewFile,BufRead *.py setlocal ts=4 sts=4 sw=4 expandtab

" Spell check for git commits
au FileType gitcommit setlocal spell

" JavaScript and JSX
au FileType javascript setlocal et ts=2 sw=2
au FileType vue setlocal et ts=2 sw=2



" =================================
" PLUGIN CONFIG
" =================================

" indentLine
" ----------
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

" ctrlp.vim
" ---------
" Ignore files defined in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" vim-javascript
" --------------
let g:javascript_plugin_jsdoc = 1 " Enable syntax highlighting in JSDocs

" vim-markdown
" ------------
let g:vim_markdown_frontmatter=1      " Enable YAML frontmatter
let g:vim_markdown_strikethrough=1    " Enable strikethrough
let g:vim_markdown_conceal=0          " Disable concealment
let g:vim_markdown_conceal_code_blocks=0
let g:vim_markdown_folding_disabled=1 " Disable automatic folding, which causes issues with Prettier's autoformat

" rust.vim
" --------
let g:rustfmt_autosave = 1 " Run rustfmt when saving

" nerdtree
" --------
" Automatically close Vim if only NERD Tree tab remains
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim-airline
" -----------
let g:airline#extensions#tabline#enabled=1 " Enable better tabs
let g:airline_theme='wombat'

" vim-json
" --------
let g:vim_json_syntax_conceal=0     " Disable syntax concealment



" =================================
" KEYBINDS
" =================================

" Set leader
let mapleader = ','
let g:mapleader = ','

" Ctrl U in insert mode deletes a lot. Use Ctrl G u to first break undo,
" so that you can undo Ctrl U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Enable nerd tree
map <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>

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
nnoremap <leader><leader> <C-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

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



" ================================
" COMMANDS
" ================================

" Diff against original file.
" i.e. See changes
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
              \ | wincmd p | diffthis
endif
