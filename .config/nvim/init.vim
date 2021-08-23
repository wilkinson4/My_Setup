scriptencoding utf-8

" install plug if not found {{{1
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug_install
    autocmd VimEnter * PlugInstall
  augroup end
endif

" plugins {{{1
call plug#begin('~/.config/nvim/plugged')
Plug 'christoomey/vim-tmux-navigator'

Plug 'simnalamburt/vim-mundo'
if !exists('g:vscode')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'stefandtw/quickfix-reflector.vim'

Plug 'junegunn/limelight.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'dense-analysis/ale'
Plug 'pangloss/vim-javascript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'elixir-editors/vim-elixir'
Plug 'ncm2/float-preview.nvim'
Plug 'liuchengxu/vista.vim'
Plug 'ryanoasis/vim-devicons'

Plug 'kassio/neoterm'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-dispatch'
Plug 'suan/vim-instant-markdown', { 'do': 'npm install -g instant-markdown-d' }
Plug 'godlygeek/tabular'
Plug 'chrisbra/csv.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'diepm/vim-rest-console'

" Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'mhinz/vim-signify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ap/vim-css-color'
Plug 'guns/xterm-color-table.vim'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'ryanoasis/vim-devicons'

Plug 'machakann/vim-highlightedyank'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rsi'
Plug 'SirVer/ultisnips'

Plug 'sainnhe/sonokai'
Plug 'wannesm/wmgraphviz.vim'
Plug 'rhysd/git-messenger.vim'

Plug 'reasonml-editor/vim-reason-plus'

Plug 'ruanyl/vim-sort-imports'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }

Plug 'turbio/bracey.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
endif

Plug 'tpope/vim-dadbod'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'      "ae/ie for entire file
Plug 'kana/vim-textobj-indent'      "ai/ii for indent block
Plug 'kana/vim-textobj-line'        "al/il for line
Plug 'sgur/vim-textobj-parameter'   "a,/i, for argument/parameter
Plug 'Julian/vim-textobj-variable-segment'    "av/iv for variable part
Plug 'Chun-Yang/vim-textobj-chunk'  "ac/ic for json-ish chunk
Plug 'whatyouhide/vim-textobj-xmlattr'  "ax/ix for xml attribute
Plug 'exu/pgsql.vim'
Plug 'triglav/vim-visual-increment'
call plug#end()

if !exists('g:vscode')
"NERDTree Config
nnoremap <silent><leader>nn :NERDTreeToggle<CR>:wincmd =<CR>
nnoremap <silent><leader>nf :NERDTreeFind<CR>:wincmd =<CR>
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeHighlightCursorline = 0
" Close Vim if NERDTree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
  \&& b:NERDTreeType == "primary") | q | endif
autocmd FileType nerdtree setlocal nocursorline
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPlugForceVAlign = ''
let g:NERDTreeFileExtensionHighlightFullName = 1
endif
" vim settings {{{1
set noswapfile
set number          "line numbers
set cursorline      "highlight cursorline
set ruler           "show line/column
set scrolloff=4     "keep more lines on screen while scrolling
set sidescroll=1    "horizontal scroll amount
set sidescrolloff=5 "horizontal scrolloff
set list            "enable invisible characters
set nowrap          "do not wrap lines by default
set mouse=a         "use mouse in all modes

" QoL tweaks
set tabstop=2       "width of tabs
set shiftwidth=2    "amount for < and > commands
set shiftround      "indent to the next multiple of shiftwidth
set expandtab       "insert spaces instead of tabs

" set hidden          "allow hiding a buffer instead of requiring save
set splitbelow      "default horizontal split to lower
set splitright      "default vertical split to right

set ignorecase      "ignore caps when searching
set smartcase       "unless a capital is used
set infercase       "smart auto-completion casing
set wildignorecase  "ignore case on files and directories
set gdefault        "global search by default
set lazyredraw      "no need to redraw all the time
set nohlsearch      "don't highlight searches by default
set inccommand=nosplit  "show substitution while typing
set path+=**        "include subdirectory globbing in path for :find
set diffopt+=vertical   "vertical split for diffs

" set noshowmode      "do not show mode since using lightline

" characters for horizontal scrolled text
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:⣿

set completeopt=longest,menuone

" set autochdir

let g:mapleader = ' ' "use space as leader

if isdirectory($HOME . '/.config/nvim/undo') == 0
  :silent !mkdir -p ~/.config/nvim/undo > /dev/null 2>&1
endif
set undofile
set undodir=~/.config/nvim/undo/

if !exists('g:vscode')
  " override $VISUAL to use nvr inside neovim
  if executable('nvr')
    let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
  endif
endif


" plugin settings {{{1

if !exists('g:vscode')
  let g:netrw_altfile = 1   "allow <c-6> to go to the previously edited file
  let g:netrw_preview = 1   "open preview window in a vertical split
  let g:netrw_localrmdir='rm -r'  "allow deleting non-empty directories

  " turn off endwise mappings. Conflicts with nvim compe
  let g:endwise_no_mappings = 1
  imap <expr> <CR> (pumvisible() ? "\<C-e>\<CR>\<Plug>DiscretionaryEnd" : "\<CR>\<Plug>DiscretionaryEnd")
endif

" let g:python_host_prog = '/usr/bin/python2.7'

let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1

let g:highlightedyank_highlight_duration = 350

let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"

let g:tmux_navigator_no_mappings = 1

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

let b:csv_arrange_use_all_rows = 1

let g:instant_markdown_autostart = 0

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2

let g:quickrun_config = {}
let g:quickrun_config['javascript.jsx'] = { 'type': 'javascript' }
let g:quickrun_config['sh'] = { 'type': 'bash' }

let g:sql_type_default = 'pgsql'

let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/UltiSnips']
let g:fzf_commands_expect = 'enter,ctrl-x'

let g:vrc_trigger = '<leader>r'
let g:vrc_response_default_content_type = 'application/json'
let g:vrc_curl_opts = { '-sS': '' }

let g:limelight_conceal_ctermfg = 236

if !exists('g:vscode')
  " Make sure `substring` is part of this list. Other items are optional for this completion source
  let g:completion_matching_strategy_list = ['exact', 'substring']
  " Useful if there's a lot of camel case items
  let g:completion_matching_ignore_case = 1

  let g:float_preview#docked = 0


  let g:javascript_plugin_jsdoc = 1

  let g:javascript_plugin_ngdoc = 1

  let g:javascript_plugin_flow = 1

  let g:neoterm_default_mod='belowright'
endif



if !exists('g:vscode')
  " autocommands {{{1
  " format on save
  autocmd BufWritePre Neoformat
  autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni
  " ImportCost
  augroup import_cost_auto_run
    autocmd!
    autocmd InsertLeave *.js,*.jsx,*.ts,*.tsx ImportCost
    autocmd BufEnter *.js,*.jsx,*.ts,*.tsx ImportCost
    autocmd CursorHold *.js,*.jsx,*.ts,*.tsx ImportCost
  augroup END

  autocmd BufEnter *.js,*.jsx,*.ts,*.tsx let b:import_sort_auto = 1
  " set filetypes as typescript.tsx
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
  augroup autodir
    autocmd FileType javascript set noautochdir
  augroup end

  augroup whitespace
    " automatically strip trailiing whitespace on save
    autocmd BufWritePre * StripWhitespace
  augroup end

  augroup dispatch_commands
    autocmd FileType sh let b:dispatch = '$SHELL %'
    autocmd FileType dot let b:dispatch = 'dot -Tpng % -o %:r.png'
  augroup end

  " only show cursor line one active window
  augroup cursorLine
    autocmd!
    autocmd BufEnter * setlocal cursorline
    autocmd BufLeave * setlocal nocursorline
  augroup end

  augroup pum
    " auto-close preview pane
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  augroup end

  augroup term_settings
    autocmd TermOpen * setlocal nonumber norelativenumber bufhidden=hide sidescrolloff=0
  augroup end

  augroup term_insert
    " go into insert mode if switching to a terminal buffer
    autocmd BufEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
  augroup end

  augroup dadbod_output_syntax
    autocmd BufRead *.dbout set syntax=sql
  augroup end

  " colors {{{1
   if has('termguicolors')
      set termguicolors
   endif
  let g:sonokai_style = 'maia'
  let g:sonokai_enable_italic = 1
  let g:sonokai_disable_italic_comment = 1
  colorscheme sonokai

  highlight HighlightedyankRegion cterm=reverse gui=reverse

  highlight! IndentGuidesOdd  ctermbg=233
  highlight! IndentGuidesEven ctermbg=234

  highlight! Constant ctermfg=37
  highlight! Normal ctermbg=NONE
  highlight! NonText ctermbg=NONE guibg=NONE

  highlight! link TermCursor Cursor
  highlight! TermCursorNC ctermbg=0 ctermfg=15

  highlight Pmenu ctermbg=240
  highlight PmenuSel ctermbg=25

  " lighten non-active windows
  highlight NormalNC guibg=#414b53

  augroup end_of_buff_highlight
    autocmd!
    autocmd BufEnter * highlight EndOfBuffer guibg=#273136
    autocmd BufLeave * highlight EndOfBuffer guibg=#414b53
  augroup END

  " highlight line 80
  highlight! ColorColumn guibg=#353f46
  let &colorcolumn="80"

  let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

  "blacklist some files for line length markers
  autocmd FileType markdown let &colorcolumn=""
  autocmd FileType markdown set nofoldenable
endif

" keymappings {{{1
" swap ; and :
noremap ; :
noremap : ;

" pretty much always want very magic searches
nnoremap / /\v
nnoremap ? ?\v
cnoremap %s/ %s/\v

" search within range, see *search-range*
vnoremap g/ <esc>/\%><c-r>=line("'<")-1<cr>l\%<<c-r>=line("'>")+1<cr>l
vnoremap g? <esc>?\%><c-r>=line("'<")-1<cr>l\%<<c-r>=line("'>")+1<cr>l

" move cursor into wrapped lines
nnoremap k gk
nnoremap j gj
nnoremap <Up> gk
nnoremap <Down> gj

" split navigation
nnoremap <silent> <m-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <m-j> :TmuxNavigateDown<cr>
nnoremap <silent> <m-k> :TmuxNavigateUp<cr>
nnoremap <silent> <m-l> :TmuxNavigateRight<cr>
nnoremap <silent> <m-\> :TmuxNavigatePrevious<cr>
inoremap <silent> <m-h> <esc>:TmuxNavigateLeft<cr>
inoremap <silent> <m-j> <esc>:TmuxNavigateDown<cr>
inoremap <silent> <m-k> <esc>:TmuxNavigateUp<cr>
inoremap <silent> <m-l> <esc>:TmuxNavigateRight<cr>

" terminal keybindings
tnoremap <leader><esc> <c-\><c-n>
tnoremap <m-[> <c-\><c-n>
tnoremap <m-h> <c-\><c-n><c-w>h
tnoremap <m-j> <c-\><c-n><c-w>j
tnoremap <m-k> <c-\><c-n><c-w>k
tnoremap <m-l> <c-\><c-n><c-w>l

" tab switching like tmux
nnoremap <leader><m-h> :tabprev<cr>
nnoremap <leader><m-l> :tabnext<cr>

" window resizing
nnoremap <M-S-h> <C-w><
nnoremap <M-S-j> <C-w>+
nnoremap <M-S-k> <C-w>-
nnoremap <M-S-l> <C-w>>
nnoremap <silent> <M-=> <c-w>=
nnoremap <silent> <M-'> :call ZoomToggle()<cr>
nnoremap <silent> <M-z> :call MaximizeWindow()<cr>

" open file to side
nnoremap gF :vertical wincmd f<CR>

" mimic D,C (to end of line)
nnoremap Y y$

" use Q to play q macro
nnoremap Q @q

" allow range commands from searches - ex:  /foo$m
cnoremap $t <CR>:t''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $d <CR>:d<CR>``

" reselect pasted content:
noremap gV `[v`]

" insert time / date
nnoremap <leader>it "=strftime("%H:%M")<CR>P
nnoremap <leader>id "=strftime("%Y-%m-%d")<CR>P
nnoremap <leader>iD "=strftime("%m.%d.%Y")<CR>P

" netrw splits
noremap <silent> <leader>x :Vexplore!<CR>:wincmd =<CR>
noremap <silent> <leader>X :Sexplore<CR>:wincmd =<CR>

" use sudo for file if forgot to when opened
nnoremap <leader>sw :w !sudo tee % >/dev/null<cr>

" super find
nnoremap <leader>f :GFiles -co --exclude-per-directory=.gitignore<CR>
nnoremap <leader>F :FZF<CR>

" super search
nnoremap <leader>/ :Rg<space>
nnoremap <leader>? :BLines<space>

" buffer management
nnoremap <leader>b :Buffers<cr>
nnoremap <c-up> :ls<cr>:b
nnoremap <c-right> :bn<cr>
nnoremap <c-left> :bp<cr>
nnoremap <c-down> :bn \| bd #<cr>

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :bd<cr>

" search for word under cursor with <leader>*
nnoremap <leader>* :Rg <c-r><c-w><CR>

" system clipboard yank
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

" put searches in middle of screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
xmap n nzz
xmap N Nzz
xmap * *zz
xmap # #zz
nmap g* g*zz
nmap g# g#zz

nnoremap <leader>d :Dispatch<cr>
vnoremap <leader>d :<c-u>execute ':Dispatch ' . substitute(b:dispatch, '%', shellescape(join(getline(line("'<"), line("'>")), "\n"), "\n"), "")<cr>

" search for visual selection
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>/<C-R>=@/<CR><CR>

" pane toggles
nnoremap <silent> <F5> :MundoToggle<CR>
nnoremap <silent> <F6> :Vista!!<CR>

" edit vimrc/zshrc and source vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>sf :source %<CR>

" term splits like tmux
nnoremap <leader>\ :VTerm<CR>
nnoremap <leader>- :STerm<CR>
nnoremap <leader>\| :VTermRepo<CR>
nnoremap <leader>_ :STermRepo<CR>

nmap gxx <Plug>(neoterm-repl-send-line)
nmap gx <Plug>(neoterm-repl-send)
xmap gx <Plug>(neoterm-repl-send)

" inside template tags
onoremap <silent> iT :<c-u>execute "silent normal! ?\\v[{<][{%]\\=\\?\\zs.\rv/\\v.\\ze[%}][>}]\r"<cr>
vnoremap <silent> iT :<c-u>execute "silent normal! ?\\v[{<][{%]\\=\\?\\zs.\rv/\\v.\\ze[%}][>}]\r"<cr>
onoremap <silent> aT :<c-u>execute "silent normal! ?\\v[{<][{%]\\=\\?.\rv/\\v[%}][>}]/e\r"<cr>
vnoremap <silent> aT :<c-u>execute "silent normal! ?\\v[{<][{%]\\=\\?.\rv/\\v[%}][>}]/e\r"<cr>

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" run 'q' macro on selection
xnoremap Q :normal @q<CR>

" port 8090
nnoremap <leader>md :InstantMarkdownPreview<CR>

fun! MapLCKeys()
  " Don't map for built-in ones
  if &ft =~ 'vim\|help\|shell'
    return
  endif
endfun

autocmd FileType * call MapLCKeys()

" TODO(adam): use Dispatch to default these?
autocmd FileType sql nnoremap <buffer> <leader>rr :.DB<cr>
autocmd FileType sql nmap <buffer> <expr> <leader>r db#op_exec()
autocmd FileType sql vmap <buffer> <expr> <leader>r db#op_exec()

autocmd FileType sql nnoremap <buffer> gss :.DB<cr>
autocmd FileType sql nmap <buffer> <expr> gs db#op_exec()
autocmd FileType sql vmap <buffer> <expr> gs db#op_exec()

autocmd FileType sql nnoremap <buffer> <c-q><c-q> :.DB<cr>
autocmd FileType sql nmap <buffer> <expr> <c-q> db#op_exec()
autocmd FileType sql vmap <buffer> <expr> <c-q> db#op_exec()

nnoremap <silent> <leader>S :ToggleSqlScratch<cr>

" fzf
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" fuzzy command list
nnoremap <leader><leader> :Commands<CR>

" fugitive bindings
nnoremap <leader>gs <cmd>Git<cr>
nnoremap <leader>ga <cmd>Gwrite<cr>
nnoremap <leader>gc <cmd>Git commit -v<cr>
nnoremap <leader>gd <cmd>Gdiffsplit<cr>
nnoremap <leader>gl <cmd>Git! log<cr>
nnoremap <leader>gL <cmd>Git! log -p %<cr>
nnoremap <leader>gr <cmd>Grebase -i --autosquash

nnoremap <leader>l :Limelight<cr>
nnoremap <leader>L :Limelight!<cr>
xmap <leader>l <Plug>(Limelight)

" use %% for local relative paths
cabbr <expr> %% expand('%:p:h')


nnoremap <silent> <leader>Rp :ReadPreview<cr>



" commands {{{1
" close all other buffers
command! BufOnly :%bd|e#

command! BufCleanup :call BufCleanup()
command! SynStack :call SynStack()

" open a terminal in a different view
command! -nargs=* VTerm :vsp
  \ | execute 'terminal' <args>
command! -nargs=* VTermRepo :vsp
  \ fnameescape(FugitiveWorkTree())
  \ | execute 'lcd' fnameescape(FugitiveWorkTree())
  \ | execute 'terminal' <args>
command! -nargs=* STerm :sp
  \ | execute 'terminal' <args>
command! -nargs=* STermRepo :sp
  \ fnameescape(FugitiveWorkTree())
  \ | execute 'lcd' fnameescape(FugitiveWorkTree())
  \ | execute 'terminal' <args>
command! -nargs=* TTerm :tabnew
  \ | execute 'terminal' <args>
command! -nargs=* TTermRepo :tabedit
  \ fnameescape(FugitiveWorkTree())
  \ | execute 'lcd' fnameescape(FugitiveWorkTree())
  \ | execute 'terminal' <args>

" amend without editing commit message
command! Gamend Git commit --amend
command! Gnoedit Git commit --amend --no-edit

command! -range FormatJSON :<line1>,<line2>call FormatJSON()

command! -nargs=* Gpc execute('Git push --set-upstream origin '.FugitiveHead().' '.<q-args>)
command! -nargs=* Gpnv execute('Git push --set-upstream origin --no-verify '.FugitiveHead().' '.<q-args>)

command! ToggleSqlScratch :call ToggleSqlScratch(<q-mods>)

command! ReadPreview call ReadPreview()


" functions {{{1
function! MaximizeWindow()
  vertical resize
  resize
endfunction

let s:maximized=0
function! ZoomToggle()
  if s:maximized
    wincmd =
    let s:maximized=0
  else
    call MaximizeWindow()
    let s:maximized=1
  endif
endfunction

" override Ag and Rg commands to search inside git repo and add preview
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'dir': FugitiveWorkTree()}), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
    \ "rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>),
    \ 1,
    \ fzf#vim#with_preview({'dir': FugitiveWorkTree()}),
    \ <bang>0
  \ )

" override GFiles to add preview
command! -bang -nargs=? GFiles
    \ call fzf#vim#gitfiles(
    \ '-co --exclude-per-directory=.gitignore',
    \ fzf#vim#with_preview(),
    \ <bang>0
  \ )

" run macro on selection
function! g:ExecuteMacroOverVisualRange()
  echo '@'.getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" search for visual selection -  from practical vim
function! s:VSetSearch(cmdType)
  let l:temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdType.'\'), '\n', '\\n', 'g')
  let @s = l:temp
endfunction

" show highlight stack
function! SynStack()
  let l:syns = synstack(line('.'), col('.'))
  call map(l:syns, {key, id -> [synIDattr(id, 'name'), synIDattr(synIDtrans(id), 'name')]})
  call map(l:syns, {key, pair -> ('[' . get(pair, 0) . '->' . get(pair, 1) . ']')})
  let l:stack = join(l:syns, ' => ')
  echo l:stack
endfunction

" Delete buffers that are not displayed in any window or modified
function! BufCleanup()
  let l:tabs = map(copy(gettabinfo()), 'v:val.tabnr')

  let l:openBuffers = []
  for l:i in l:tabs
     call extend(l:openBuffers, tabpagebuflist(l:i))
  endfor

  let l:buffers = map(filter(filter(copy(getbufinfo()), 'v:val.listed'), {i, info -> info.changed == v:false}), 'v:val.bufnr')
  for l:bnr in l:buffers
      if index(l:openBuffers, l:bnr) < 0
          exe 'bd '.l:bnr
      endif
  endfor
endfunction

" format a block of JSON with python's built-in function
function! FormatJSON() range
  let l:fullRange = a:firstline.','.a:lastline
  let l:singeLine = a:firstline.','.a:firstline
  silent exe l:fullRange.'join | '.l:singeLine.'! python3 -m "json.tool"'
  silent normal =}
endfunction

function! ToggleSqlScratch(mods)
  let l:sql_scratch_name = get(g:, 'sql_scratch_name', '[sql_scratch]')

  let l:current_tab = tabpagenr()
  let l:page_buffers = tabpagebuflist(l:current_tab)
  let l:page_buffer_names = map(l:page_buffers, {key, val -> bufname(val)})
  let l:is_scratch_open = index(l:page_buffer_names, l:sql_scratch_name) > -1

  if l:is_scratch_open
    let l:scrach_window_number = bufwinnr(l:sql_scratch_name)
    execute l:scrach_window_number.'hide'
  else
    let l:mods = get(a:, 'mods', 'botright')
    execute l:mods 'new' '+setlocal\ buftype=nofile|setlocal\ bufhidden=hide|setlocal\ filetype=sql' l:sql_scratch_name
  endif
endfunction

function! ReadPreview() abort
  if &previewwindow     " don't do this in the preview window
    echo "Can't read inside preview window"
    return
  endif

  silent! wincmd P " to preview window

  if &previewwindow == 0 " couldn't get to preview window
    echo "No preview window open"
    return
  endif

  let l:contents = getline(1, "$")
  wincmd p      " back to old window

  put =l:contents
endfunction



" let g:lightline = {
" \   'component': {
" \     'readonly': '%{&readonly?"\ue0a2":""}',
" \   },
" \   'component_function': {
" \     'filename': 'FilenameWithIcon',
" \     'gitversion': 'GitVersion'
" \   },
" \   'active': {
" \     'right': [
" \        [ 'lineinfo'],
" \        [ 'gitversion', 'percent' ],
" \        [ 'fileformat', 'filetype' ],
" \     ]
" \   },
" \   'inactive': {
" \     'right': [
" \        [ 'lineinfo' ],
" \        [ 'gitversion', 'percent' ],
" \     ]
" \   },
" \ }

" custom icon overrides
let s:icons = {
\   'jsx': "\ue7ba",
\   'javascript.jsx': "\ue7ba",
\   'nginx': "\ue776",
\ }

lua require('init')

function! FilenameWithIcon()
  if exists('*WebDevIconsGetFileTypeSymbol')
    let l:icon = index(keys(s:icons), &filetype) > -1 ? s:icons[&filetype] : WebDevIconsGetFileTypeSymbol()
  else
    let l:icon = ''
  endif
  let l:filename = expand('%')
  return len(l:filename) > 0 ? l:filename . ' ' . l:icon : '[No File]'
endfunction

function! GitVersion()
  let l:fullname = expand('%')
  let l:gitversion = ''
  if l:fullname =~? 'fugitive://.*/\.git//0/.*'
    let l:gitversion = 'git index'
  elseif l:fullname =~? 'fugitive://.*/\.git//2/.*'
    let l:gitversion = 'git target'
  elseif l:fullname =~? 'fugitive://.*/\.git//3/.*'
    let l:gitversion = 'git merge'
  elseif &diff == 1
    let l:gitversion = 'working copy'
  endif
  return l:gitversion
endfunction

function! ReplaceView()
  norm ^
  mark m
  norm $
  execute "read! psql $DB_FOLLOWER --tuples-only --no-align --no-psqlrc -c \"select pg_get_viewdef('<cWORD>')\""
  norm `m
  substitute/\v(\w) (.+)/\="\ncreate " . (submatch(1) == 'm' ? 'materialized ' : '') . 'view ' . submatch(2) . ' as'
  norm kk
endfunction

function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()

" after.vim loading {{{1
" allow loading of device specific configs
if filereadable(expand('$HOME/init.after.vim'))
  source $HOME/init.after.vim
endif
