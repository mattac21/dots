lua <<EOF

require'lspconfig'.bashls.setup{
    cmd = { "bash-language-server", "start" }
}

EOF
