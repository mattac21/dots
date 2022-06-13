local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- html
require('lspconfig').html.setup {
    on_attach = on_attach,
    capabilities = capabilities
} 

-- js & ts
require('lspconfig').tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
} 

-- bash
require'lspconfig'.bashls.setup{
    cmd = { "bash-language-server", "start" },
    on_attach = on_attach,
    capabilities = capabilities
}

-- docker
require'lspconfig'.dockerls.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

-- python
require'lspconfig'.pyright.setup{
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
    capabilities = capabilities
}


-- go
require'lspconfig'.gopls.setup{
    filetypes = { "go", "gomod" },
    on_attach = on_attach,
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
    capabilities = capabilities
}
root = vim.lsp.buf.list_workspace_folders()

-- json
require'lspconfig'.jsonls.setup {
    on_attach = on_attach,
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
            end
        }
    }
}

-- clangd 
require'lspconfig'.clangd.setup{
    on_attach = on_attach,
    cmd = { "clangd-11", "--background-index" },
}

require "lsp_signature".setup({
    on_attach = on_attach,
    bind = true, 
    handler_opts = {
        border = "single"
    }
})

