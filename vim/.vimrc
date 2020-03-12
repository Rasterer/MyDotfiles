"""""""""""""""""""""""""""""
" base setting				"
"""""""""""""""""""""""""""""
set nocompatible
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set nu
"set autochdir
set hls
set laststatus=2
set ruler
set nocp 
set is
set ic
set wildmenu
set nosol
syntax enable
syntax on
"set foldmethod=indent
filetype on
"set smartindent
set autoindent
set mouse=
set so=10
set nobackup
set noswapfile
set completeopt=longest,menu,preview
set cursorline
"set t_Co=256
"<> match pair
set mps+=<:>

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd FileType make setlocal noexpandtab


" GLSL highlighting
set syntax=glsl
autocmd BufNewFile,BufRead *.vp,*.fp,*.gp,*.vs,*.fs,*.gs,*.tcs,*.tes,*.cs,*.vert,*.frag,*.geom,*.tess,*.shd,*.gls,*.glsl set ft=glsl

"""""""""""""""""""""""""""""
" vundle plugin manger		"
"""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'majutsushi/tagbar'
Plugin 'inkarkat/vim-ingo-library'
Plugin 'inkarkat/vim-mark'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Shougo/unite.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'vim-scripts/sessionman.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'zxqfl/tabnine-vim'
"Plugin 'Superbil/llvm.vim'
"Plugin 'gaffneyc/vim-cdargs'
"Plugin 'vim-scripts/Tabmerge'
"Plugin 'vim-scripts/gtags.vim'
"Plugin 'hewes/unite-gtags'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-session'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'bling/vim-airline'
call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1

"Plugin 'Superbil/llvm.vim'
"augroup filetype
  "au! BufRead,BufNewFile *.ll     set filetype=llvm
"augroup END
"augroup filetype
  "au! BufRead,BufNewFile *.td     set filetype=tablegen
"augroup END



"""""""""""""""""""""""""""""
" colorscheme setting		"
"""""""""""""""""""""""""""""
"1. molokai
"let g:rehash256 = 1
"set background=dark
"let g:molokai_original = 1
"colorscheme molokai

"2. solarized
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
set background=dark
colorscheme solarized

"""""""""""""""""""""""""""""
" general key map					"
"""""""""""""""""""""""""""""
vnoremap <C-c> "+y
nnoremap <C-p> "+p
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nnoremap ee :noh<CR>:match<CR>
nnoremap ff <C-]>
nnoremap ml :marks<CR>
nnoremap bb :only<CR>
nnoremap <space><space> i<space><esc>
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

"""""""""""""""""""""""""""""
" tab mappings
"""""""""""""""""""""""""""""
"nmap <C-\>1 1gt
"nmap <C-\>2 2gt
"nmap <C-\>3 3gt
"nmap <C-\>4 4gt
"nmap <C-\>5 5gt
"nmap <C-\>6 6gt
"nmap <C-\>7 7gt
"nmap <C-\>8 8gt
"nmap <C-\>9 9gt
"nmap <C-n> :tabnew<CR>
"nmap <C-c> :tabclose<CR>
"nmap <C-n> :tabp <CR>
"nmap <C-m> :tabn <CR>


" Tagbar
nmap <F9> :TagbarToggle<CR>

"Ctags
"set tags=tags;
"map <F12> :!ctags -R .<CR>

"cscope config
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
	set csre
endif

nmap <C-F12> :!cscope -Rbkq<CR>
nmap ss :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""""""
"Minibufexplorer
"let g:miniBufExplMapWindowNavVim=1
"let g:miniBufExplMapWindowNavArrows=1
"let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplModSelTarget=1 
"let g:miniBufExplMoreThanOne=0
""""""""""""""""""""""""""""""""""

nnoremap <silent> <F12> :A<CR>

""""""""""""""""""""""""""""""
" mark setting
""""""""""""""""""""""""""""""
nmap mk <Plug>MarkSet
"vmap mk <Plug>MarkSet
nmap mm <Plug>MarkAllClear
"vmap mm <Plug>MarkClear
"nmap me <Plug>MarkRegex
"vmap me <Plug>MarkRegex

" rainbow setting
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

""""""""""""""""""""""""""""""""""
"let g:indent_guides_guide_size=1
""let g:indent_guides_start_level=2
"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  ctermbg=grey
"hi IndentGuidesEven ctermbg=darkgrey
"let g:indentLine_color_term = 239
"let g:indentLine_faster = 1
""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""
" vim-airline config
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
"let g:airline_enable_branch=1
"let g:airline_enable_syntastic=0
"let g:airline_detect_paste=1
"let g:airline_theme='solarized-dark'
""""""""""""""""""""""""""""""""""

" unite.vim config
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#set_profile('files', 'context.smartcase', 1)
call unite#custom#profile('files', 'context.smartcase', 1)
call unite#custom#source(
      \ 'buffer,file_rec/async,file_rec', 'matchers',
      \ ['converter_tail', 'matcher_default'])
call unite#custom#source(
      \ 'file_rec/async,file_rec', 'converters',
      \ ['converter_file_directory'])

let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=5000

if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
  let g:unite_source_grep_command='ack'
  let g:unite_source_grep_default_opts='--no-heading --no-color -C4'
  let g:unite_source_grep_recursive_opt=''
endif

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ ], '\|'))

function! s:unite_settings()
  nmap <buffer> Q <plug>(unite_exit)
  nmap <buffer> <esc> <plug>(unite_exit)
  imap <buffer> <esc> <plug>(unite_exit)
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  "inoremap <silent><buffer><expr> <C-x> unite#do_action('split')
  "inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  inoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
endfunction
autocmd FileType unite call s:unite_settings()

nmap <space> [unite]
nnoremap [unite] <nop>

"nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_mru file_rec/async buffer bookmark<cr><c-u>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<cr>
nnoremap <silent> [unite]g :<C-u>Unite -toggle -auto-resize -buffer-name=bookmarks bookmark<cr>
"nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async:!<cr>
nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec<cr>
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>

""""""""""""""""""""""""""""""""""
"let g:boostmove=0
"set updatetime=50
"au CursorMoved * call BoostMoveON()
"au CursorMovedI * call BoostMoveON()
"au CursorHold * call BoostMoveOFF()
"au CursorHoldI * call BoostMoveOFF()
"function BoostMoveON()
    "if (g:boostmove == 0)
        "let g:boostmove=1
        "setlocal nocursorline
    "endif
"endfunction
"function BoostMoveOFF()
    "if g:boostmove==1
        "let g:boostmove=0
        "setlocal cursorline
    "endif
"endfunction
""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" sessionman setting
""""""""""""""""""""""""""""""
nnoremap sl :SessionList<CR>

"set csprg=gtags-cscope
"cs add GTAGS
