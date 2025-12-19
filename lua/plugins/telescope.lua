return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-file-browser.nvim',
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup({
      defaults = {
        initial_mode = "normal",
      },
      extensions = {
        file_browser = {
          hijack_netrw = true,
          hidden = true,
        },
      },
    })
    telescope.load_extension('fzf')
    telescope.load_extension('file_browser')

    local keymap = vim.keymap
    -- Find files in current directory and all subdirectories
    keymap.set('n', '<leader>e', '<cmd>Telescope find_files cwd=%:p:h<CR>', { desc = 'Find files in current dir' })
    keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
    keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Live grep' })
    keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Find buffers' })
    keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'Help tags' })
  end,
}
