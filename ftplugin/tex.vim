setlocal wrap
setlocal sw=2
setlocal tabstop=2
setlocal expandtab
setlocal textwidth=79
setlocal colorcolumn=120

setlocal linebreak

set iskeyword+=: " type /ref{fig: and prec <C-n> to autocomplete references
set iskeyword+=- " same with -
set iskeyword+=_ " same with _

setlocal autoindent

" Conceal
set cole=2
let g:tex_conceal= 'adgm'

highlight clear SpellBad
"highlight SpellBad term=standout ctermfg=1
highlight SpellBad term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

highlight Conceal ctermbg=none
let ngerman_package_file = 1

let g:TeX_package_ngerman = ''
let g:TeX_package_option_ngerman = ''
" For now just define the smart quotes.
let b:Tex_SmartQuoteOpen = '„'
let b:Tex_SmartQuoteClose = '”'


" setup synctex forwarding
function! SyncTexForward()
    let execstr = 'silent !for f in ``ls latexmk_files/*.pdf``; do;zathura --synctex-forward '.line('.').":".col('.').":".'%:t'.' $f; done;'
    exec execstr 
    redraw!
endfunction
nmap <Leader>f :call SyncTexForward()<CR>

