require('lint').linters_by_ft = {
    go = {'golangcilint'}
}

vim.api.nvim_command([[au BufWritePost *.go lua require('lint').try_lint()]])
