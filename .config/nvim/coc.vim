" required by coc
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes

let g:coc_global_extensions = [
            \'coc-calc',
            \'coc-clangd',
            \'coc-css',
            \'coc-explorer',
            \'coc-highlight',
            \'coc-html',
            \'coc-json',
            \'coc-marketplace',
            \'coc-pairs',
            \'coc-phpls',
            \'coc-python',
            \'coc-snippets',
            \'coc-tsserver',
            \'coc-xml',
            \'coc-yank',
            \]
"            \'coc-yank',
"            \'coc-actions',
"            \'coc-css',
"            \'coc-html',
"            \'coc-tsserver',
"            \'coc-yaml',
"            \'coc-lists',
"            \'coc-python',
"            \'coc-clangd',
"            \'coc-prettier',
"            \'coc-xml',
"            \'coc-syntax',
"            \'coc-git',

" close the preview window when completion is done
" use k to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    " nn <silent> K :call CocActionAsync('doHover')<cr>
    call CocActionAsync('doHover')
  endif
endfunction

" use <c-space>for trigger completion
inoremap <silent><expr> <C-space> coc#refresh()

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<Tab>"

inoremap <expr> <M-Tab> pumvisible() ? "\<C-p>" : "\<M-Tab>"
" Coc snippets
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<M-tab>'

" Coc Explorer
nmap <space><Tab> :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

"Coc Highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
