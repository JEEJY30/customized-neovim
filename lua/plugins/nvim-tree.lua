return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-web-devicons' },
  lazy = false,
  config = function()
    -- Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('nvim-tree').setup({
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
      -- Auto update tree when files change
      update_focused_file = {
        enable = true,
        update_root = false,
      },
    })

    -- Keymaps
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true, desc = 'Toggle file explorer' })
    vim.keymap.set('n', '<leader>ef', ':NvimTreeFindFile<CR>', { silent = true, desc = 'Find current file in tree' })

    -- Auto-open with proper buffer check
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        -- Wait for everything to be ready
        vim.schedule(function()
          -- Check if no file was opened
          local bufname = vim.api.nvim_buf_get_name(0)
          local buftype = vim.bo.buftype

          if bufname == "" and buftype == "" then
            -- Give it time to settle
            vim.defer_fn(function()
              -- Close the empty buffer first
              vim.cmd("bdelete")
              -- Then open NvimTree safely
              vim.cmd("NvimTreeOpen")
            end, 50)
          end
        end)
      end,
    })
  end,
}
