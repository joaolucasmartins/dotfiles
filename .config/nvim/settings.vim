set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments

set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set swapfile
set directory^=~/.local/share/nvim/swap//
set undofile
set undodir^=~/.local/share/nvim/undo//

" performance tweaks
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1

" appearance
syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
"set termguicolors
set nowrap                              " Display long lines as just one line
set whichwrap+=<,>,[,],h,l
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
"set cursorline                          " Enable highlighting of the current line
set number                              " Line numbers
set relativenumber
set laststatus=2                        " Always display the status line
set title                               " Set the window’s title, reflecting the file currently being edited.
set guifont=Fira\ Code\ Nerd\ Font
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs

" tabs
set tabstop=4 softtabstop=4 shiftwidth=4" tab width
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent

"search
set hlsearch                            " Enable search highlighting.
set ignorecase                          " Ignore case when searching.
set incsearch                           " Incremental search that shows partial matches.
set smartcase                           " Automatically switch search to case-sensitive when search query contains an uppercase letter.


" Cursor
set scrolloff=5                         " Lines to see above and bellow de cursor
set sidescroll=1                        " Same thing but horizontaly
set sidescrolloff=3
set nostartofline                       " When moving with gg or GG keep cursor horizontal pos

" Ease of life
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=300                      " Faster completion
set timeoutlen=100                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
set incsearch
set history=1000                        " Increase the undo limit.
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" You can't stop me
cmap w!! w !sudo tee %

" TODO
"set notimeout ttimeout
set timeoutlen=500
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set autochdir                           " Your working directory will always be the same as your working directory
set foldcolumn=2                        " Folding abilities
"TODO see folding
