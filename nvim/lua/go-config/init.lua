require('go').setup({
    goimport='goimport',
    gofmt='gofmt'
})
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

