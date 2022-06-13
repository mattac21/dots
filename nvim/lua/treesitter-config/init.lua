require'nvim-treesitter.configs'.setup {
  ensure_installed = {'python', 'cpp', 'c', 'go', 'rust', 'dockerfile', 'java', 'bash', 'gomod', 'gowork', 'javascript', 'json', 'lua', 'make', 'proto', 'typescript', 'vim', 'yaml'},
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autopairs = {
      enable = true
  },
} 
