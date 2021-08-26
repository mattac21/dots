" Python LSP
lua <<EOF
require'lspconfig'.pyright.setup{}
settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true
        }
      }
    }
EOF
