-- Customisations for yaml highlighting
vim.cmd([[highlight @string.yaml guifg=green]])
vim.cmd([[highlight @comment.yaml cterm=italic gui=italic guifg='#9999ff' ]])
vim.cmd([[highlight @field.yaml guifg=red]])
vim.cmd([[highlight @punctuation.delimiter.yaml guifg=white]])
