syntax enable
syntax on
syntax sync minlines=200

""""""" set config {{{
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
"}}}

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" filetype の判定と plugin, indent を一旦 off
" ファイル終端で ON にしている
filetype off
filetype plugin indent off

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
  NeoBundle 'Shougo/vimshell.vim'
  NeoBundle 'honza/vim-snippets'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'tpope/vim-dispatch'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'Yggdroot/indentLine'
  NeoBundle 'Lokaltog/vim-easymotion'
  " vim-gitgutter をロードするとなぜか NeoCompleteがおかしくなる、、、
  NeoBundle 'airblade/vim-gitgutter'
  NeoBundle 'itchyny/lightline.vim'
  NeoBundle 'jiangmiao/auto-pairs'
  NeoBundle 'kana/vim-submode'
  NeoBundle 'osyo-manga/vim-over'
  NeoBundle 'ctrlpvim/ctrlp.vim'
  NeoBundle 'othree/html5.vim'
  NeoBundle 'gregsexton/gitv'
  " NeoBundle 'cohama/agit.vim'
  NeoBundle 'majutsushi/tagbar'
  NeoBundle 'rhysd/clever-f.vim'
  NeoBundle 'vim-ruby/vim-ruby'
  NeoBundle 'LeafCage/foldCC.vim'
  NeoBundle 'elzr/vim-json'
  NeoBundle 'tyru/caw.vim'
  NeoBundle 'mattn/ctrlp-register'
  NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
  NeoBundle 'junegunn/fzf'
  " NeoBundle 'jacquesbh/vim-showmarks'

  " ファイル・タイプ別
  " -----------------------------
  " ruby
  NeoBundleLazy 'tpope/vim-haml', { "autoload": {"filetypes":["ruby"] } }
  NeoBundleLazy 'tpope/vim-rails', { "autoload": {"filetypes":["ruby"] } }
  NeoBundleLazy 'tpope/vim-endwise', { "autoload": {"filetypes":["ruby"] } }
  NeoBundleLazy 'thoughtbot/vim-rspec', { "autoload": {"filetypes":["ruby"] } }
  " NeoBundleLazy 'marcus/rsense', { "autoload": {"filetypes":["ruby"] } }
  " NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', { "autoload": {"filetypes":["ruby"] } }

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


  " コマンド呼び出し時
  " -----------------------------
  NeoBundleLazy 'Chiel92/vim-autoformat', {
        \  'autoload': { 'commands': ['AutoFormat'] }
        \}
  NeoBundleLazy 'junegunn/vim-easy-align', {
        \  'autoload': { 'commands': ['EasyAlign'] }
        \}
  NeoBundleLazy 'koron/codic-vim', {
        \  'autoload': { 'commands': ['Codic'] }
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

" Define keyword.
" if !exists('g:neocomplete#keyword_patterns')
"     let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
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


""""""" Vimshell {{{
let g:vimshell_prompt_expr = 'split(getcwd(), "/")[-2]."/".split(getcwd(), "/")[-1]." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '
""" }}}



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
nnoremap <Space>d :<c-u>CtrlPBookmarkDir<CR>
nnoremap <Space>r :<c-u>CtrlPRegister<CR>
nnoremap <Space>g :<c-u>CtrlPGoImport<CR>
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --ignore-dir ".git" --ignore-dir "_workspace" -g ""'
endif
let g:ctrlp_custom_ignore = '(\.git)|(_workspace)'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
""" }}}



""""""" NERDTree {{{
noremap nt :NERDTreeToggle <CR>
let NERDTreeShowHidden = 1
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



""""""" for html5 {{{
let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete = 1
let g:html5_microdata_attributes_complete = 1
let g:html5_aria_attributes_complete = 1
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

" let g:tagbar_type_objc = {
" \  'ctagstype': 'objc'
" \, 'ctagsargs': [
" \   '--options='.expand('~/.vim/etc/ctags-options-objc')
" \,  '--objc-kinds=-N'
" \,  '--format=2'
" \,  '--excmd=pattern'
" \,  '--extra='
" \,  '--fields=nksaSmte'
" \,  '-f -'
" \]
" \, 'kinds': [
" \     'i:class interface'
" \,    'x:class extension'
" \,    'I:class implementation'
" \,    'P:protocol'
" \,    'M:method'
" \,    't:typedef'
" \,    'v:variable'
" \,    'p:property'
" \,    'e:enumeration'
" \,    'f:function'
" \,    'd:macro'
" \,    'g:pragma'
" \,    'c:constant'
" \, ]
" \, 'sro': ' '
" \}

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
            \ 'active_filetypes': ['javascript', 'ruby'] }
let g:syntastic_javascript_checkers = ["jshint"]
let g:syntastic_ruby_checkers = ["rubocop"]
let g:syntastic_ruby_exec = '/Users/kazukgw/.rbenv/versions/2.2.1/bin/ruby'
let g:syntastic_rubocop_exec = '/Users/kazukgw/.rbenv/versions/2.2.1/bin/rubocop'
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
let g:gocomplete#system_function = 'vimproc#system2'
let g:go_autodetect_gopath = 0
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

""" }}}


""""""" Note {{{
let g:note_path = $GOPATH . '/src/github.com/kazukgw/Note/'

function! NTopen_(e)
  exec 'rightbelow vsplit ' . g:note_path . split(a:e, '\t')[0]
endfunction

function! NTopen(e)
  call fzf#run({
        \ 'source': 'nt ls -fm ' . a:e .' | sed -E "s/.*kazukgw\/Note\///g"',
        \ 'sink': function('NTopen_')
        \ })
endfunction

function! NTopentag(e)
  call fzf#run({
        \ 'source': 'nt ls -fm tag:' . a:e .' | sed -E "s/.*kazukgw\/Note\///g"',
        \ 'sink': function('NTopen_')
        \ })
endfunction

function! NTtaglist()
  call fzf#run({
        \ 'source': 'nt index ls -fm tag',
        \ 'sink': function('NTopentag')
        \ })
endfunction

command! -nargs=1 Notef call NTopen(<q-args>)
command! NoteListSummary call NTopen('summary')
command! NoteListTag call NTtaglist()
nnoremap <Leader>nl :NoteListTag<CR>
nnoremap <Leader>nls :NoteListSummary<CR>

function! NTListFile(A, L, P)
  let filelist = expand(g:note_path.a:A."*")
  if filelist =~ '\*'
    return []
  endif
  let splitted = split(filelist, "\n")
  let splitted_and_gsubed = map(splitted, "substitute(v:val, '.*\/kazukgw\/Note\/', '', 'g')")
  return splitted_and_gsubed
endfunction

function! NTnew(note)
  let _pwd = system('pwd')
  call system('nt new '. a:note)
  exec 'cd '. _pwd
endfunction

command! Notep CtrlP ~/Projects/src/github.com/kazukgw/Note
command! -nargs=1 Notes Ag! --silent -m 1 --ignore-dir log <args> ~/Projects/src/github.com/kazukgw/Note
command! -nargs=1 -complete=customlist,NTListFile Notee :sp ~/Projects/src/github.com/kazukgw/Note/<args>
command! -nargs=1 -complete=customlist,NTListFile Noteev :rightbelow vsplit ~/Projects/src/github.com/kazukgw/Note/<args>
command! -nargs=1 -complete=customlist,NTListFile Noten call NTnew(<q-args>)
command! Notesync :! notesync
command! -nargs=1 Notemkdir :! mkdir ~/Projects/src/github.com/kazukgw/Note/<args>
command! NoteIndexBuild call system('nt index build')

function! NTquicknote()
  let fname = system('echo _$(date "+%Y%m%d%H%M%S").md')
  exec 'e ' . g:note_path . '/entrance/' . fname
endfunction

function! NTquicknotev()
  let fname = system('echo _$(date "+%Y%m%d%H%M%S").md')
  exec 'rightbelow vsplit ' . g:note_path . '/entrance/' . fname
endfunction

function! NTquicknotes()
  let fname = system('echo _$(date "+%Y%m%d%H%M%S").md')
  exec 'sp ' . g:note_path . '/entrance/' . fname
endfunction

command! Noteq call NTquicknote() | :0r ~/.templates/note_frontmatter.md
command! Noteqv call NTquicknotev() | :0r ~/.templates/note_frontmatter.md
command! Noteqs call NTquicknotes() | :0r ~/.templates/note_frontmatter.md

nnoremap <Leader>ne :Notee
nnoremap <Leader>ns :Notes
nnoremap <Leader>np :Notep<CR>
nnoremap <Leader>nqf :Noteq<CR>
nnoremap <Leader>nq :Noteqv<CR>
nnoremap <Leader>nqs :Noteqs<CR>

function! ListLogFiles(A, L, P)
  let filelist = expand("/Users/kazukgw/Projects/src/github.com/kazukgw/Note/log/".a:A."*")
  if filelist =~ '\*'
    return []
  endif
  let splitted = split(filelist, "\n")
  let splitted_and_gsubed = map(splitted, "substitute(v:val, '.*\/kazukgw/Note\/log\/', '', 'g')")
  return splitted_and_gsubed
endfunction

command! Log :sp ~/Projects/src/github.com/kazukgw/Note/log/log.md
command! Logv :rightbelow vsplit ~/Projects/src/github.com/kazukgw/Note/log/log.md
command! Logf :e ~/Projects/src/github.com/kazukgw/Note/log/log.md
command! -nargs=1 -complete=customlist,ListLogFiles Logl :sp ~/Projects/src/github.com/kazukgw/Note/log/<args>
command! -nargs=1 -complete=customlist,ListLogFiles Loglv :rightbelow vsplit ~/Projects/src/github.com/kazukgw/Note/log/<args>

command! Todo :sp /Users/kazukgw/Projects/src/github.com/kazukgw/Note/todo.md
command! Todov :rightbelow vsplit ~/Projects/src/github.com/kazukgw/Note/todo.md
function! ShowTodos(...)
  let argarr = ["1", "2", "3", "4", "5", "6"]
  if a:0 != 0
    argarr = a:000
  endif
  let argstr = '/\[\(' . join(argarr, '\|') . '\)\]/'
  let currentFile = expand('%p')
  exe ":vimgrep" . argstr . currentFile
endfunction

command! -nargs=* Todos call ShowTodos(<f-args>)


" }}}


""""""""""""""""""""""""""""""
filetype plugin indent on

