lua <<EOF

require'lspconfig'.clangd.setup{
    cmd = { "clangd-11", "--background-index" },
}

EOF

