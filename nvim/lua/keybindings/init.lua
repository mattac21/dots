vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

-- window mappings
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})

-- telescope
map('n', '<Leader>ff', "<cmd>Telescope find_files<cr>", {noremap = true, silent = false})
map('n', '<Leader>fg', "<cmd>Telescope git_files<cr>", {noremap = true, silent = false})
map('n', '<Leader>fr', "<cmd>Telescope live_grep<cr>", {noremap = true, silent = false})
map('n', '<Leader>fb', "<cmd>Telescope buffers<cr>", {noremap = true, silent = false})
