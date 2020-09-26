" PLUG
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

set termguicolors
call plug#begin('~/.config/nvim/plugged')
Plug 'psliwka/vim-smoothie'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'                               " actual snippets
Plug 'preservim/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'vim-scripts/quickrun.vim'
"Plug 'Pablo1107/codi.vim'
Plug 'justinmk/vim-sneak'
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Git
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
" Theme
Plug 'dylanaraps/wal.vim'
Plug 'vim-airline/vim-airline'
Plug 'hzchirs/vim-material'                             " material color themes
Plug 'ryanoasis/vim-devicons'                           " pretty icons everywhere
Plug 'Yggdroot/indentLine'

" Initialize plugin system
call plug#end()

"Nerd Commenter
let mapleader=" "
map <leader>7 <plug>NERDCommenterSexy
map <leader>8 <plug>NERDCommenterToggle
" let localleader=" "

source $HOME/.config/nvim/whichkey.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/ale.vim
source $HOME/.config/nvim/startify.vim
source $HOME/.config/nvim/git.vim
source $HOME/.config/nvim/fzf.vim
" Themeing
let g:material_style = 'oceanic'
colorscheme vim-material
highlight Pmenu guibg='#00010a' guifg=white             " popup menu colors
highlight Comment gui=italic cterm=italic               " bold comments
highlight Normal gui=none
highlight NonText guibg=none
highlight clear SignColumn                              " use number color for sign column color
hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE          " search string highlight color
autocmd ColorScheme * highlight VertSplit cterm=NONE    " split color
hi NonText guifg=bg                                     " mask ~ on empty lines
hi clear CursorLineNr                                   " use the theme color for relative number
hi CursorLineNr gui=bold                                " make relative number bold
hi SpellBad guifg=#ff7480 cterm=bold,undercurl          " misspelled words


" colors for git (especially the gutter)
hi DiffAdd  guibg=#0f111a guifg=#43a047
hi DiffChange guibg=#0f111a guifg=#fdd835
hi DiffRemoved guibg=#0f111a guifg=#e53935

" coc multi cursor highlight color
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
hi Pmenu guifg=#0000010a guibg=#0000010a
"highlight PmenuSel ctermfg=0 ctermbg=1 guifg=0 guibg=1
"highlight PmenuSbar ctermfg=5 ctermbg=1 guifg=5 guibg=1
"highlight PmenuThumb ctermfg=5 ctermbg=5 guifg=5 guibg=5

"highlight DiffAdded ctermfg=2 ctermbg=0 guifg=2 guibg=0
"highlight Identifier ctermfg=3 ctermbg=black guifg=3 guibg=black
"highlight Group ctermfg=5 ctermbg=0 guifg=5 guibg=0
"highlight Desc ctermfg=5 ctermbg=0 guifg=5 guibg=0
""highlight PmenuSel ctermfg=red ctermbg=grey
"highlight Comment gui=italic cterm=italic               " bold comments
"highlight Normal gui=none
"highlight NonText guibg=none
"highlight clear SignColumn                              " use number color for sign column color
"hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE          " search string highlight color
"autocmd ColorScheme * highlight VertSplit cterm=NONE    " split color
"hi NonText guifg=bg                                     " mask ~ on empty lines
"hi SpellBad guifg=#ff7480 cterm=bold,undercurl          " misspelled words
"hi CocErrorSign ctermfg=160 guifg=120

let g:sneak#label = 1
" case insensitive sneak
let g:sneak#use_ic_scs = 1

" indentLine
let g:indentLine_char_list = ['▏']
let g:indentLine_setColors = 1
let g:indentLine_setConceal = 1                         " actually fix the annoying markdown links conversio
let g:indentLine_fileTypeExclude = ['startify']

let b:quickrun_config = {'outputter/buffer/split': "", 'outputter/buffer/into' : 1}
