let g:ale_disable_lsp = 1

let g:ale_linters = {
\  'javascript': ['eslint', 'tsserver'],
\  'elixir': ['elixir-ls', 'credo'],
\  'rust': ['rls', 'rustc'],
\}

let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['prettier', 'eslint'],
\  'typescript': ['prettier', 'eslint'],
\  'typescriptreact': ['prettier', 'eslint'],
\  'elixir': ['mix_format'],
\  'sql': ['pgformatter'],
\  'html': ['prettier'],
\  'css': ['prettier'],
\  'json': ['prettier', 'jq'],
\  'reason': ['refmt'],
\  'rust': ['rustfmt'],
\}

let g:ale_html_tidy_options = '--clean yes --indent yes --wrap 0 --break-before-br yes'

let g:ale_reasonml_refmt_executable = 'bsrefmt'

let g:ale_elixir_credo_strict = 1

let g:ale_sql_pgformatter_options = "
\ --comma-start
\ --comma-break
\ --spaces 2
\ --keyword-case 1
\ --wrap-after 1
\ --placeholder ':: '
\"

" format
nmap <F4> <Plug>(ale_fix)
