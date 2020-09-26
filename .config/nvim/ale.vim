"let g:ale_enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_set_balloons = 1

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1
let g:ale_fixers = {
      \ 'bash': ['shfmt'],
      \ 'c': ['clang-format'],
      \ 'cpp': ['clang-format'],
      \ 'css': ['prettier'],
      \ 'html': ['prettier'],
      \ 'java': ['clang-format'],
      \ 'javascript': ['prettier'],
      \ 'json': ['prettier'],
      \ 'markdown': ['prettier'],
      \ 'python': ['black'],
      \ 'sh': ['shfmt'],
      \ 'tex': ['latexindent'],
      \ 'text': ['SimpFormat'],
      \ 'xml': ['xmllint'],
      \}
let g:ale_linters_explicit = 1
" In ~/.vim/vimrc, or somewhere similar.
let g:ale_linters = {
\}
