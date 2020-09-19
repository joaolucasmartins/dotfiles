" PLUG
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

" PLUGINS
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/vim-clang-format'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar'
Plug 'junegunn/goyo.vim'
"ColorSchemes
Plug 'dylanaraps/wal.vim'
Plug 'mhartington/oceanic-next'
Plug 'liuchengxu/space-vim-dark'
"Snippets
Plug 'honza/vim-snippets'
"Table
Plug 'dhruvasagar/vim-table-mode'
"GayUml
Plug 'aklt/plantuml-syntax'
call plug#end()
" BASICS
    let g:tex_conceal = ""
    set nocompatible
    command WQ wq
    command Wq wq
    command W w
    command Q q   let mapleader ='\'
    filetype plugin on
    syntax on
    syntax enable
    set ts=4 sts=4 sw=4 noexpandtab
    set number relativenumber
    set nobackup
    set nowritebackup
    set hidden
    set mouse=a
    set cmdheight=2
    set updatetime=300
    set shortmess=ac
    set signcolumn=yes
    set encoding=utf-8
    set splitbelow splitright
    set showtabline=0
    set nohlsearch
    set clipboard+=unnamedplus
    "set foldmethod=indent
    set nofoldenable
    " TABS
    set expandtab

" Backup stuff
set swapfile
set directory^=~/.local/share/vim/swap//
" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" persist the undo tree for each file
set undofile
set undodir^=~/.local/share/vim/undo//   
set tabstop=4

" Ensure files are read as what I want:
    let g:vimwiki_ext2syntax = {'Rmd': 'markdown', 'rmd': 'markdown','md': 'markdown', 'markdown': 'markdown', 'mdown': 'markdown'}

    " Function that compiles and runs most programs
    function! Auto_run()
        split
        if expand("%:e") == "py" 
            terminal python %
            startinsert
        elseif expand("%:e") == "c"
            terminal gcc -o "%<.out" "%:t" && ./"%<.out"
            startinsert
        elseif expand("%:e") == "cpp"
            terminal g++ -o "%<.out" "%:t" && ./"%<.out"
            startinsert
        elseif expand("%:t") == "config.h"
            terminal sudo make clean install
            startinsert
        elseif expand("%:t") == "wal_dunst"
            !wal_dunst
            !notify-send --urgency=low test
            :q
        elseif expand("%:t") == "colors-wal-dwm.h"
            !wal -i ~/Images/Wallpapers/dragon.jpg
            !wait
            !sudo build_dwm
"       elseif (g:vimwiki_ext2syntax[expand("%:e")] == "markdown")
"           terminal cd %:h && echo "require(rmarkdown); render('%:t')" | R --vanilla && if [ ! "$(pidof zathura)" ]; then eval "zathura %<.pdf"; fi
"           :CtrlSpaceGoDown
"           :q
"This kinda bloat
        elseif expand("%:e") == "Rmd"
            RMarkdown pdf
            terminal cd %:h && if[ ! "$(pidof zathira)" ]; then eval "zathura %<.pdf"; fi
            :CtrlSpaceGoDown
            :q
        elseif (matchstr(expand("%:p"), "Workshop-Introduction-Python-3/presentation/separate_slide") != '')
            terminal /home/jm/Documents/OneDrive/FEUP/IEEE/Workshops/Python/Workshop-Introduction-Python-3/presentation/aux_files/generatePresentation.sh && wait && xdotool windowactivate $(xdotool search --name "Mozilla Firefox"); xdotool key F5; xdotool windowactivate $(xdotool getwindowfocus)
            :CtrlSpaceGoDown
            :q
        elseif expand("%:e") == "tex"
            terminal pdflatex "%"
        elseif expand("%:t") == "xmobarc.hs"
            call system('killall -9 xmobar; xmobar ' . expand("%:p"). '& ; disown')
            :CtrlSpaceGoDown
            :q
        endif
    endfunction
    nmap <F5> :call Auto_run()<cr>

    function! Compile_Cmake()
        split
        terminal cd cmake-build-debug; cmake .. .; cmake --build .
        startinsert
    endfunction

    nmap <F6> :call Compile_Cmake()<cr>


    " Save File
    noremap <F1> :retab! <cr>

    " Disables automatic commenting on newline
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " Automatically deletes all trailing whitespace on save.
    nnoremap <silent> <F4> :call <SID>StripTrailingWhitespaces()<CR>
    autocmd BufWritePre *.py,*.c,*.cpp,*.h,*.txt :call <SID>StripTrailingWhitespaces()
    function! <SID>StripTrailingWhitespaces()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " Do the business:
        %s/\s\+$//e
        " Clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction


" THEME
    let g:gruvbox_contrast_dark=1
    let g:gruvbox_italic=1
    "colorscheme gruvbox

    colorscheme wal

" SPELL-CHECK
    map <leader>o :setlocal spell! spelllang=en_us<CR>

" COC
    " use <tab> for trigger completion and navigate to the next complete item
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"'<tab>'

    " inoremap <silent><expr> <TAB>
    "       \ pumvisible() ? coc#_select_confirm() :
    "       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    "       \ <SID>check_back_space() ? "\<TAB>" :
    "       \ coc#refresh()
    "
    " function! s:check_back_space() abort
    "   let col = col('.') - 1
    "   return !col || getline('.')[col - 1]  =~# '\s'
    " endfunction

    let g:coc_snippet_next = '<CR>'
    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()" Use <C-k> for jump to previous placeholder

    " Close the preview window when completion is done
    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

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
    " Complete suggestion using enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    " Prettier on save
    command! -nargs=0 Prettier :CocCommand prettier.formatFile

    " \ 'coc-texlab',
    " \ 'coc-eslint',
    let g:coc_global_extensions = [
    \ 'coc-calc',
    \ 'coc-json',
    \ 'coc-lists',
    \ 'coc-markdownlint',
    \ 'coc-pairs',
    \ 'coc-prettier',
    \ 'coc-python',
    \ 'coc-sh',
    \ 'coc-snippets',
    \ 'coc-tsserver',
    \ ]

"NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Scroll
map <C-j> <C-f>
map <C-k> <C-b>
vnoremap <C-c> "*Y :let @+=@* <CR>
inoremap <C-s> <esc>:w<cr>

map <A-tab> :NERDTreeToggle<CR>
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('txt', 'blue', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('h', 'blue', 'none', '#00FFFF', '#00FFFF')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('py', 'red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('c', 'red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('cpp', 'red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('pdf', 'Magenta', 'none', '#ff00ff', '#151515')
" NERDTree Git Icons
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" NerdComments
map <A-7> <plug>NERDCommenterToggle
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" CTRLSPACE
    let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
    let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
    let g:CtrlSpaceSaveWorkspaceOnExit = 1
    let g:CtrlSpaceDefaultMappingKey = "<C-space> "
    nnoremap <silent><C-p> :CtrlSpace O<CR>
    let g:CtrlSpaceCacheDir = expand("$HOME/.config/nvim/")
    let g:CtrlSpaceUseUnicode = 0
    let g:CtrlSpaceUseTabline = 1
    let g:CtrlSpaceUseArrowsInTerm = 1
    let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
    let g:CtrlSpaceLoadLastWorkspaceOnStart = 1

    map <leader>T :enew<cr>
    map <C-h> :CtrlSpaceGoUp<CR>
    map <C-l> :CtrlSpaceGoDown<CR>
    " map <leader>bq :bp <BAR> bd #<CR>
    " map <leader>bs :ls<CR>
    " map <leader>s :CtrlSpaceSaveWorkspace<CR>
    if executable("ag")
        let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
    endif
    if has("gui_running")
        " Settings for MacVim and Inconsolata font
        let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
    endif

" AIRLINE
" let g:airline_theme = 'falcon'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 0
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], ['z']]
let airline#extensions#coc#error_symbol = '!'
let airline#extensions#coc#warning_symbol = '.'

"Ctrl w deletes word
noremap <C-BS> <C-w>

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.maxlinenr = '㏑'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = 'Ɇ'
    let g:airline_symbols.whitespace = 'Ξ'

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = ''

" TagBar
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
"nmap <a-CR> :TagbarToggle<CR>
nmap <a-CR> ::TagbarOpenAutoClose<CR>
nmap <a-p> ::Goyo<CR>
source /home/jm/test.vim
"Background Transparency
hi Normal guibg=NONE ctermbg=NONE
hi Comment cterm=italic
