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
            \'coc-pyright',
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

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" use <c-space>for trigger completion
inoremap <silent><expr> <C-space> coc#refresh()

" Coc snippets
let g:coc_snippet_next = '<cr>'
let g:coc_snippet_prev = '<A-cr>'

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Enter confirms completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
