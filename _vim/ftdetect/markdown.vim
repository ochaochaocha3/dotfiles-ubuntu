" Markdown file type
augroup filetypedetect
    autocmd BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md,README.md :set filetype=markdown
augroup END
