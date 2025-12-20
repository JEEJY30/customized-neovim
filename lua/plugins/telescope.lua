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
    local fb_actions = require('telescope').extensions.file_browser.actions
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        initial_mode = "normal",  -- Default to normal mode
        mappings = {
          n = {
            ["i"] = "to_fuzzy_refine",  -- Press 'i' to search in normal mode
          },
        },
      },
      pickers = {
        find_files = {
          initial_mode = "insert",  -- Start in insert mode for find_files
        },
        live_grep = {
          initial_mode = "insert",  -- Start in insert mode for live_grep
        },
      },
      extensions = {
        file_browser = {
          hijack_netrw = true,
          hidden = true,
          mappings = {
            ["n"] = {
              ["h"] = fb_actions.goto_parent_dir,
              ["l"] = actions.select_default,
            },
          },
        },
      },
    })
    telescope.load_extension('fzf')
    telescope.load_extension('file_browser')

    local keymap = vim.keymap
    keymap.set('n', '<leader>e', '<cmd>Telescope file_browser path=%:p:h<CR>', { desc = 'File browser' })
    keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
    keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Live grep' })
    keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Find buffers' })
    keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'Help tags' })
  end,
}
