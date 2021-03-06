require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        section_separators = '',
        component_separators = '',
        globalstatus = true
    },
    sections = {
        lualine_c = {
          {
              'diagnostics',
              sources = { 'nvim_lsp' },
              sections = { 'error', 'warn', 'info', 'hint' },
              diagnostics_color = {
                -- Same values as the general color option can be used here.
                error = 'DiagnosticError', -- Changes diagnostics' error color.
                warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
              },
            colored = true,           -- Displays diagnostics status in color if set to true.
            update_in_insert = false, -- Update diagnostics in insert mode.
            always_visible = true,   -- Show diagnostics even if there are none.
          },
        },
    },
    extensions = {
        'quickfix',
        'toggleterm',
        'fzf'
    }
})
