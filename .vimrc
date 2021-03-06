syntax enable
syntax on
syntax sync minlines=200

""""""" set config {{{
set cursorline
set t_Co=256                " 256色
set title
set nocompatible            " Be iMproved
set gfn=Ricty:h12
set number                  " 行数を表示
set encoding=utf-8
set tabstop=2               " tab はだいたい`soft` の `2`
set expandtab               " softtab 有効
set softtabstop=2
set shiftwidth=2
set autoindent
set noequalalways           " window サイズの自動調整を無効化
set incsearch               " インクリメンタルサーチ有効
set noswapfile              " スワップファイルをつくらない
set nobackup
set noundofile              " undofile は作らない http://www.kaoriya.net/blog/2014/03/30/
set hidden                  " 編集中でも、保存しないで他のファイルを開けるようにする
set confirm                 " ファイルを保存していない場合に、ファイルの保存を確認するダイアログを出す
set cmdheight=2             " 画面下部に表示されるコマンドラインの高さの設定
set showcmd                 " 入力したコマンドをステータスライン上に表示  例えばdを入力したらdと表示される
set scrolloff=5             " カーソルの上または下に表示される最小限の行数  5に設定してあるので、下に5行は必ず表示される
set visualbell              " ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set vb t_vb=                " ビープを鳴らさない
set mouse=a                 " 全モードでマウスの操作を有効
set laststatus=2            " ステータスラインを常に表示する
" set ruler                   " ルーラを表示
set showmatch               " カッコの対応をハイライト
" set cursorline              " カーソル行のハイライト
set wrapscan                " 最後まで検索したら先頭に戻る
set ignorecase              " 大文字小文字を無視する
set smartcase               " 検索文字列に大文字が含まれている場合は区別して検索する
set hlsearch                " 検索語を強調表示
set lazyredraw
set foldmethod=indent
set foldlevel=1
set foldcolumn=0
set colorcolumn=80
set norelativenumber
set showtabline=2
set completeopt-=preview
set modeline
set modelines=4
set shellcmdflag=-ic
set clipboard=unnamed
set ambiwidth=double
autocmd ColorScheme * highlight Visual term=reverse cterm=reverse
let g:molokai_original=1
colorscheme molokai

"}}}

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" filetype の判定と plugin, indent を一旦 off
" ファイル終端で ON にしている
filetype off
filetype plugin indent off

let $PATH = "~/.pyenv/shims:".$PATH

""""" NeoBundle {{{
if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
  " Let NeoBundle manage NeoBundle
  " Required:
  NeoBundleFetch 'Shougo/neobundle.vim'

  " 初期化時に読み込み
  " -----------------------------
  NeoBundle 'Shougo/vimproc.vim', {
        \ 'build' : {
        \     'mac' : 'make',
        \     'linux' : 'make',
        \     'unix' : 'gmake',
        \    },
        \ }

   NeoBundle 'Shougo/neocomplete.vim'
   NeoBundle 'Shougo/neosnippet.vim', {
     \ 'depends' : 'Shougo/vimproc.vim',
     \}
   NeoBundle 'Shougo/neosnippet-snippets'
   " NeoBundle 'Shougo/vimshell.vim'
   NeoBundle 'honza/vim-snippets'
   NeoBundle 'tpope/vim-fugitive'
   NeoBundle 'tpope/vim-dispatch'
   NeoBundle 'scrooloose/nerdtree'
   NeoBundle 'scrooloose/syntastic'
   NeoBundle 'Yggdroot/indentLine'
   NeoBundle 'Lokaltog/vim-easymotion'
   NeoBundle 'airblade/vim-gitgutter'
   NeoBundle 'itchyny/lightline.vim'
   NeoBundle 'jiangmiao/auto-pairs'
   NeoBundle 'kana/vim-submode'
   " NeoBundle 'osyo-manga/vim-over'
   NeoBundle 'ctrlpvim/ctrlp.vim'
   " NeoBundle 'othree/html5.vim'
   NeoBundle 'majutsushi/tagbar'
   NeoBundle 'rhysd/clever-f.vim'
   NeoBundle 'LeafCage/foldCC.vim'
   NeoBundle 'elzr/vim-json'
   NeoBundle 'tyru/caw.vim'
   NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
   NeoBundle 'junegunn/fzf'

   " ファイル・タイプ別
   " -----------------------------
   " ruby
   NeoBundleLazy 'tpope/vim-haml', { "autoload": {"filetypes":["ruby"] } }
   NeoBundleLazy 'tpope/vim-rails', { "autoload": {"filetypes":["ruby"] } }
   NeoBundleLazy 'tpope/vim-endwise', { "autoload": {"filetypes":["ruby"] } }
   NeoBundleLazy 'thoughtbot/vim-rspec', { "autoload": {"filetypes":["ruby"] } }

   " JS
   NeoBundleLazy 'marijnh/tern_for_vim', { "autoload": {"filetypes":["javascript"] } }

   " JSX
   NeoBundleLazy 'pangloss/vim-javascript', { "autoload": {"filetypes":["jsx"]} }
   NeoBundleLazy 'mxw/vim-jsx', { "autoload": {"filetypes":["jsx"]} }

   " HTML
   NeoBundleLazy 'mattn/emmet-vim', { "autoload": {"filetypes":["html","eruby"] } }

   " go
   NeoBundleLazy 'kazukgw/ctrlp-goimport', { "autoload": {"filetypes":["go"] } }
   NeoBundleLazy 'fatih/vim-go', { "autoload": {"filetypes":["go"] } }

   " python
   NeoBundleLazy 'davidhalter/jedi-vim', { "autoload": {"filetypes":["python"] } }
   NeoBundleLazy "lambdalisue/vim-pyenv", {
         \ "depends": ['davidhalter/jedi-vim'],
         \ "autoload": {
         \   "filetypes": ["python", "python3", "djangohtml"]
         \ }}


   " コマンド呼び出し時
   " -----------------------------
   NeoBundleLazy 'junegunn/vim-easy-align', {
         \  'autoload': { 'commands': ['EasyAlign'] }
         \}
   NeoBundleLazy 'rking/ag.vim', {
         \  'autoload': { 'commands': ['Ag'] }
         \}
   NeoBundleLazy 'thinca/vim-qfreplace', {
         \  'autoload': { 'commands': ['Qfreplace'] }
         \}
   NeoBundleLazy 'thinca/vim-quickrun', {
         \  'autoload': { 'commands': ['QuickRun'] }
         \}
   NeoBundleLazy 'vim-scripts/Align', {
         \  'autoload': { 'commands': ['Align'] }
         \}
call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""" }}}



""""""" NeoComplete {{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 4
let g:neocomplete#auto_completion_start_length = 2
" 名前がパターンにmatchするbufferはcompleteしない
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#buffer#disabled_pattern = '\.log\|\.log\.\|tags'
" let g:neocomplete#skip_auto_completion_time = "0.5"
let g:neocomplete#use_vimproc = 1

" このサイズより大きいファイルではtagをcacheしない
let g:neocomplete#sources#tags#cache_limit_size = 500000

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endi
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'
let g:neocomplete#sources#omni#input_patterns.typescript = '.*[^=\);]'
let g:neocomplete#sources#omni#input_patterns.javascript = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.objc = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.objcpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" omni補完 force_input_pattern
" 別プラグインと併用して使用する場合は以下の設定も行う
" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.go = '\h\w\.\w*'

" FileType毎のOmni補完を設定
autocmd FileType javascript setlocal omnifunc=jscomplete#CompleteJS
autocmd FileType ruby       setlocal omnifunc=rubycomplete#Complete
let g:rubycomplete_rails = 0
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_object_space = 1


" for python(jedi-vim)
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

" let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

"インクルードパスの指定
let g:neocomplete#include_paths = {
  \ 'ruby' : '.,$HOME/.rbenv/versions/2.2.0/lib/ruby/2.2.0',
  \ 'javascript' : '.',
  \ 'jsx' : '.',
  \ }
"インクルード文のパターンを指定
let g:neocomplete#include_patterns = {
  \ 'ruby'       : '^\s*require',
  \ 'javascript' : '^\s*require',
  \ 'jsx'        : '^\s*require',
  \ 'coffee'     : '^\s*require',
  \ }
"インクルード先のファイル名の解析パターン
let g:neocomplete#include_exprs = {
  \ 'ruby' : substitute(v:fname,'::','/','g')
  \ }
" ファイルを探す際に、この値を末尾に追加したファイルも探す。
let g:neocomplete#include_suffixes = {
  \ 'ruby'       : '.rb',
  \ 'javascript' : '.js',
  \ 'jsx'        : '.jsx',
  \ 'coffee'     : '.coffee',
  \ }

""""""" }}}


""""""" NERDTree {{{
noremap nt :NERDTreeToggle <CR>
let NERDTreeShowHidden = 1
""" }}}


""""""" NeoSnippet {{{
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets,~/.vim/sniippets/vim-snippets/javascript'
""""""" }}}


""""""" Lightline {{{
let g:lightline = {
        \ 'separator': { 'left': '⮀', 'right': '⮂'  },
        \ 'subseparator': { 'left': '⮁', 'right': '⮃'  },
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['fugitive', 'gitgutter', 'filename'],
        \   ],
        \   'right': [
        \     ['lineinfo', 'syntastic'],
        \     ['percent'],
        \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
        \   ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \   'charcode': 'MyCharCode',
        \   'gitgutter': 'MyGitGutter',
        \ }
\ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \  (&ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction

""" }}}



""""""" EasyMotion {{{
let g:EasyMotion_do_mapping = 0 "Disable default mappings
nmap s <Plug>(easymotion-s2)
""" }}}



""""""" IndentLine {{{
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#505050'
let g:indentLine_char = '¦'
""" }}}



""""""" Ctrlp {{{
nnoremap <Space>b :<c-u>CtrlPBuffer<CR>
nnoremap <Space>g :<c-u>CtrlPGoImport<CR>
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --ignore-dir ".git" --ignore-dir "_workspace" -g ""'
endif
let g:ctrlp_custom_ignore = '(\.git)|(_workspace)'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
""" }}}


""""""" tern_for_vim {{{
" let g:tern#is_show_argument_hints_enabled = 0
""" }}}


""""""" vim-gitgutter {{{
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '✘'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_map_keys = 0
""" }}}


""""""" NERDCommenter {{{
nmap ,, <Plug>(caw:i:toggle)
vmap ,, <Plug>(caw:i:toggle)
""" }}}


""""""" vim-submode {{{
" window のリサイズを自動でできるように
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')
""" }}}


""""""" Gitv {{{
let g:Gitv_OpenPreviewOnLaunch = 0
""" }}}


""""""" tagbar {{{
nnoremap <C-]> g<C-]>
noremap tb :TagbarToggle <CR>
let g:tagbar_ctags_bin='/usr/local/bin/ctags'

let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }


" for golang
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" for markdown
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'ctagsbin' : '/Users/kazukgw/Dropbox/kazukgw/bin/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
      \ 's:sections',
      \ 'l:links',
      \ 'i:images'
    \ ],
    \ "sro" : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ "sort" : 0,
  \ }

let g:markdown_fenced_languages = [
\  'css',
\  'java',
\  'cpp',
\  'c',
\  'erb=eruby',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'ruby',
\  'sass',
\  'xml',
\  'go',
\  'objc',
\  'python',
\]
""" }}}



""""""" syntastic {{{
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['javascript', 'ruby', 'python'] }
let g:syntastic_javascript_checkers = ["jshint"]
let g:syntastic_ruby_checkers = ["rubocop"]
let g:syntastic_ruby_exec = '/Users/kazukgw/.rbenv/versions/2.2.1/bin/ruby'
let g:syntastic_rubocop_exec = '/Users/kazukgw/.rbenv/versions/2.2.1/bin/rubocop'
let g:syntastic_python_checkers = ["pylint"]
let g:syntastic_pylint_exec = '/Users/kazukgw/.pyenv/versions/2.7.10/bin/pylint'
""" }}}



""""""" quickrun {{{
let g:quickrun_config = {}
""" }}}



""""""" 全角スペースのハイライト {{{
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif
""" }}}



""""""" vim-json {{{
let g:vim_json_syntax_conceal = 0
au BufNewFile,BufReadPost *.json set conceallevel=0
""" }}}



""""""" FoldCC {{{
set foldtext=FoldCCtext()
set fillchars=vert:\|
hi Folded gui=bold term=standout ctermbg=236 ctermfg=DarkBlue guibg=Grey30 guifg=Grey80
hi FoldColumn gui=bold term=standout ctermbg=236 ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
""" }}}



""""""" vim-go {{{
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" let g:gocomplete#system_function = 'vimproc#system2'
let g:go_autodetect_gopath = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
""" }}}



""""""" MySettings {{{
let mapleader = "\<Space>"
command! Vimrc :e ~/.vimrc
command! -nargs=1 -complete=file NSS NeoSnippetSource <args>
command! Cpc CtrlPClearAllCaches
command! Neotags NeoCompleteTagMakeCache

noremap <Space>git :Gitv --all<CR>
noremap <Space>gitf :Gitv! --all<CR>

command! Reload :source ~/.vimrc

" backupskip は backup を作らないファイルを指定するが
" mac で crontab -e でvimを使う場合はこの設定が必要ぽい
set backupskip=/tmp/*,/private/tmp/*

""" カーソル
" 挿入モードでカーソル形状を変更する
let &t_SI.="\e[6 q"
let &t_EI.="\e[2 q"
" カーソル形状がすぐに元に戻らないのでタイムアウト時間を調整
set ttimeoutlen=10
" 挿入モードを抜けた時にカーソルが見えなくなる現象対策(なぜかこれで治る)
inoremap <ESC> <ESC>
" insert mode でemacs風な動き
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-f> <C-o>w
inoremap <C-b> <C-o>b
inoremap <C-d> <C-o>x

""" tab
nnoremap tt :tabnew<CR>
nnoremap tq :tabclose<CR>
nnoremap tn gt
nnoremap tp gT

""" 連続でインデントを操作
vnoremap < <gv
vnoremap > >gv

""" grep したら QuickFixを自動で開く
augroup grepopen
  autocmd!
  autocmd QuickFixCmdPost vimgrep cw
augroup END

""" current buffer を vimgrep
command! -nargs=1 S exec 'vimgrep '. string(<q-args>). ' %'

""" current buffer の /// or ### でコメントしている部分を vimgrep
command! M exec 'vimgrep "\(\/\/\/\|###\)" %'

""" gj(k) と j(k) を入れかえ
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk K

""" tab文字等可視化
" タブ文字を CTRL-I で表示し、行末に $ で表示する。（有効:list/無効:nolist）
set list
" Listモード (訳注: オプション 'list' がオンのとき) に使われる文字を設定する。
set listchars=tab:\▸\       " tab

" 上記特殊文字の文字色
highlight SpecialKey term=underline ctermfg=darkgray guifg=darkgray

""" 編集中のファイルをrename
command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

""" es6
au BufNewFile,BufRead *.es6 set filetype=javascript

""" go
command! PlayGo :set ft=go | :0r ~/.templates/quickrun_go.go

""" fzf
function! PjCD(e)
  exec 'cd ' . $GOPATH . '/src/' . a:e
endfunction

function! PjCDedit_(e)
  exec 'e ' . $GOPATH. '/src/' .a:e
endfunction

function! PjCDedit(e)
  let dirpath = $GOPATH . '/src/' . a:e
  call fzf#run({
        \ 'source': 'find '. dirpath. ' -maxdepth 10 -type f | sed -E "s/.*Projects\/src\///g"',
        \ 'sink': function('PjCDedit_')
        \})
endfunction

command! Pj call fzf#run({
      \ 'source': 'find ~/Projects/src -maxdepth 3 -type d | sed -E "s/.*Projects\/src\///g"',
      \ 'sink': function('PjCD')
      \ })
command! Pje call fzf#run({
      \ 'source': 'find $GOPATH/src -maxdepth 3 -type d | sed -E "s/.*Projects\/src\///g"',
      \ 'sink': function('PjCDedit')
      \})

""" template
function! TemplateListFile(A, L, P)
  let filelist = expand($HOME."/.templates/".a:A."*")
  if filelist =~ '\*'
    return []
  endif
  let splitted = split(filelist, "\n")
  let splitted_and_gsubed = map(splitted, "substitute(v:val, '.*\/\.templates\/', '', 'g')")
  return splitted_and_gsubed
endfunction

command! -nargs=1 -complete=customlist,TemplateListFile Tmpl :r ~/.templates/<args>

function! StripEscSeq(str)
  return substitute(a:str, '\v\e\[\?\d+[mhK]', '', 'g')
endfunction

""" open gems dir
function! OpenGemsDir()
  let gemsdir = StripEscSeq(system('echo -e $(gemsdir)'))
  exec 'e '. gemsdir
endfunction

command! Gems call OpenGemsDir()

""" open goroot
command! GoRoot exec 'e '. system("go env GOROOT")

""" python format
command! YAPF :0,$!yapf
command! Pystdlib2 exec 'e $HOME/.pyenv/versions/2.7.10/lib/python2.7'
" command! Pystdlib3 exec 'e $HOME/.pyenv/versions/2.7.10/lib/python2.7'
function! PypkgpathFn()
python <<PYTHON
import vim
import codecs
import sys
import os
import string

pwd = vim.eval("getcwd()")
pkg_path_file_path = '{}/.jedi-vim-pypkgpath'.format(pwd)

try:
  pkg_path_file = codecs.open(pkg_path_file_path,'r','utf-8')
except IOError:
  print 'Could not insert path to sys.path because pypkgpath file is not found.'
else:
  try:
    for p in pkg_path_file.readlines():
      path = string.strip('{}/{}'.format(pwd, p))
      if path in sys.path:
        sys.path.remove(path)
      sys.path.insert(0, path)

  finally:
    pkg_path_file.close()

  sys.stdout.write('----------------------------------\n')
  sys.stdout.write(", ".join(sys.path))
  sys.stdout.write('\n---------------------------------')
PYTHON
endfunction

command! Pypkgpath call PypkgpathFn()

""" 現在のbufferのpath
command! Current echo @%

""" https://gist.github.com/pinzolo/8168337
""" 指定のデータをレジスタに登録する
function! s:Clip(data)
  let @*=a:data
  echo "clipped: " . a:data
endfunction

" 現在開いているファイルのパスをレジスタへ
command! -nargs=0 ClipPath call s:Clip(expand('%:p'))
" 現在開いているファイルのファイル名をレジスタへ
command! -nargs=0 ClipFile call s:Clip(expand('%:t'))
" 現在開いているファイルのディレクトリパスをレジスタへ
command! -nargs=0 ClipDir  call s:Clip(expand('%:p:h'))
""" }}}



""""""" Note {{{
command! -nargs=1 -complete=file Notew exec 'w ' . $NOTEPATH . '/_entrance/' . <q-args>

function! NoteEditWith(result)
  exec 'rightbelow split '. $NOTEPATH . '/' . split(a:result, "	")[0]
endfunction

function! NoteEditvWith(result)
  exec 'rightbelow vsplit '. $NOTEPATH . '/' . split(a:result, "	")[0]
endfunction

command! Note call fzf#run({
      \ 'source': 'cd ' . $NOTEPATH . ' && fm ls | sed -e "s/.*kazukgw\/Note\///g"',
      \ 'sink': function('NoteEditWith'),
      \ 'dir': $NOTEPATH,
      \ })

command! Notev call fzf#run({
      \ 'source': 'cd ' . $NOTEPATH . ' && fm ls | sed -e "s/.*kazukgw\/Note\///g"',
      \ 'sink': function('NoteEditvWith'),
      \ 'dir': $NOTEPATH,
      \ })

command! Notetag call fzf#run({
      \ 'source': 'cd ' . $NOTEPATH . ' && fm ls tag | sed -e "s/.*kazukgw\/Note\///g"',
      \ 'sink': function('NoteEditWith'),
      \ 'dir': $NOTEPATH,
      \ })

command! Notetagv call fzf#run({
      \ 'source': 'cd ' . $NOTEPATH . ' && fm ls tag | sed -e "s/.*kazukgw\/Note\///g"',
      \ 'sink': function('NoteEditvWith'),
      \ 'dir': $NOTEPATH,
      \ })

command! Notesummary call fzf#run({
      \ 'source': 'cd ' . $NOTEPATH . ' && fm ls summary | sed -e "s/.*kazukgw\/Note\///g"',
      \ 'sink': function('NoteEditWith'),
      \ 'dir': $NOTEPATH,
      \ })

command! Notesummaryv call fzf#run({
      \ 'source': 'cd ' . $NOTEPATH . ' && fm ls summary | sed -e "s/.*kazukgw\/Note\///g"',
      \ 'sink': function('NoteEditvWith'),
      \ 'dir': $NOTEPATH,
      \ })

""" }}}



""" cursor {{{
" Cursor support for terminals
" ============================
"
" Defaulting vertical line for insert mode and block for other modes.

" TODO: Support for gnome-terminal and xterm

" GUI environments don't require any action.
if has("gui_running")
  finish
endif

" Environments are additive so we store the current escape sequences in temp
" vars.
let s:si=''
let s:ei=''

" iTerm
" -----

" iTerm escape sequence for cursor shape is:
"
"   \<Esc>]50;CursorShape={N}\x7
"
" Where {N} is:
"  - 0 for block
"  - 1 for vertical bar
"  - 2 for underline
"
" Reference:
"   https://code.google.com/p/iterm2/wiki/ProprietaryEscapeCodes#Set_cursor_shape
if exists('$ITERM_PROFILE')
  let s:si="\<Esc>]50;CursorShape=1\x7"
  let s:ei="\<Esc>]50;CursorShape=0\x7"
endif

" OS X Terminal
" -------------
"
" Inspired by: http://www.damtp.cam.ac.uk/user/rbw/vim-osx-cursor.html
"
" Simulate cursor shapes by highlighting the current character in normal mode.
" Terminal cursor must be set to 'Vertical line'.
"
" FIXME:
"  - Cursor in empty lines are not highlighted
"  - Match parenthesis have precedence over cursor highlight
if $TERM_PROGRAM == 'Apple_Terminal'
  " Turn 'cursorline' on to update cursor regularly
  " set cursorline

  " Enable Cursor highlight for term
  highlight Cursor cterm=reverse

  " Un-highlight cursor for unfocused buffers and insert mode
  autocmd WinLeave,InsertEnter * match none /\%#/

  " Highlight cursor position in other modes only for focused windows
  autocmd BufEnter,WinEnter,InsertLeave * match Cursor /\%#/
endif

" tmux
" ----
"
" tmux captures escape sequences sent from vim, so we need to forward them to
" the emulator.
if exists('$TMUX') && s:si != '' && s:ei != ''
  let s:si="\<Esc>Ptmux;\<Esc>".s:si."\<Esc>\\"
  let s:ei="\<Esc>Ptmux;\<Esc>".s:ei."\<Esc>\\"
endif

" Use escape sequencess if they where declared.
if s:si != '' && s:ei != ''
  let &t_SI=s:si
  let &t_EI=s:ei
endif
""" }}}


""""""""""""""""""""""""""""""
filetype plugin indent on

