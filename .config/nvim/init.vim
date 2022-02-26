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
"Plug 'dense-analysis/ale'
Plug 'vim-scripts/quickrun.vim'
"Plug 'puremourning/vimspector'
"Plug 'Pablo1107/codi.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ggandor/lightspeed.nvim'
"Plug 'justinmk/vim-sneak'
" Git
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
" Theme
Plug 'dylanaraps/wal.vim'
Plug 'vim-airline/vim-airline'
Plug 'hzchirs/vim-material'                             " material color themes
Plug 'ryanoasis/vim-devicons'                           " pretty icons everywhere
"Plug 'Yggdroot/indentLine'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'octol/vim-cpp-enhanced-highlight'
" Initialize plugin system
call plug#end()
" let localleader=" "

source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/settings.vim
"source $HOME/.config/nvim/ale.vim
source $HOME/.config/nvim/startify.vim
source $HOME/.config/nvim/git.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/whichkey.vim
source $HOME/.config/nvim/mappings.vim
"source $HOME/.config/nvim/vimspector.vim

" Themeing
" let g:material_style = 'oceanic'
colorscheme one
"set background=dark
set background=light
let g:cpp_member_variable_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
"hi Normal guibg=NONE ctermbg=NONE
"highlight PmenuSel ctermfg=0 ctermbg=1 guifg=0 guibg=1
"highlight PmenuSbar ctermfg=5 ctermbg=1 guifg=5 guibg=1
"highlight PmenuThumb ctermfg=5 ctermbg=5 guifg=5 guibg=5

"highlight DiffAdded ctermfg=2 ctermbg=0 guifg=2 guibg=0
"highlight Identifier ctermfg=3 ctermbg=black guifg=3 guibg=black
"highlight Group ctermfg=5 ctermbg=0 guifg=5 guibg=0
"highlight Desc ctermfg=5 ctermbg=0 guifg=5 guibg=0
"highlight PmenuSel ctermfg=red ctermbg=grey
"highlight Comment gui=italic cterm=italic               " bold comments
"highlight Normal gui=none
"highlight NonText guibg=none
"highlight clear SignColumn                              " use number color for sign column color
"hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE          " search string highlight color
"autocmd ColorScheme * highlight VertSplit cterm=NONE    " split color
"hi NonText guifg=bg                                     " mask ~ on empty lines
"hi SpellBad guifg=#ff7480 cterm=bold,undercurl          " misspelled words
highlight CocErrorSign ctermfg=Red  guifg=#ff0000       " This go red

"let g:sneak#label = 1
" case insensitive sneak
"let g:sneak#use_ic_scs = 1

" smoothie
let g:smoothie_no_default_mappings = 1
let b:quickrun_config = {'outputter/buffer/split': "", 'outputter/buffer/into' : 1}



