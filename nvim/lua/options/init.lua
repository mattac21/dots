vim.cmd('filetype plugin indent on')
vim.cmd('hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red')
vim.cmd('hi LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow')
vim.cmd('hi LspDiagnosticsVirtualTextInformation guifg=White ctermfg=White')
vim.cmd('hi LspDiagnosticsVirtualTextHint guifg=White ctermfg=White')
vim.cmd('hi SignColumn guibg=none')
vim.cmd("let g:gruvbox_sign_column = 'bg0'")
vim.o.hidden = true
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.pumheight = 10
vim.o.fileencoding = 'utf-8'
vim.o.cmdheight = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.termguicolors = true
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.timeoutlen = 3000
vim.o.ttimeoutlen = 100
vim.o.clipboard = 'unnamedplus'
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 5
vim.wo.wrap = false
vim.wo.signcolumn = 'yes'
vim.wo.rnu = true
vim.wo.number = true
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.winbar = "%{%v:lua.require'ui.winbar'.eval()%}"
