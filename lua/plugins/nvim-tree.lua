return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('nvim-tree').setup({
      view = { width = 30 },
      renderer = { group_empty = true },
      filters = { dotfiles = false },
    })

    vim.keymap.set('n', '<leader>ee', ':NvimTreeToggle<CR>', { silent = true, desc = 'Toggle file explorer' })
    vim.keymap.set('n', '<leader>ef', ':NvimTreeFindFile<CR>', { silent = true, desc = 'Find current file in tree' })

  end,
}
