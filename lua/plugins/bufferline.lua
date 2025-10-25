return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
          icon = '▎',
          style = 'icon',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true
          }
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        persist_buffer_sort = true,
        separator_style = "thin",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        },
        sort_by = 'insert_after_current',
      },
    })

    -- Keymaps for buffer navigation
    vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { silent = true, desc = 'Next buffer' })
    vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { silent = true, desc = 'Previous buffer' })
    vim.keymap.set('n', '<leader>x', ':bdelete<CR>', { silent = true, desc = 'Close buffer' })
    vim.keymap.set('n', '<leader>X', ':bdelete!<CR>', { silent = true, desc = 'Force close buffer' })
    vim.keymap.set('n', '<leader>bo', ':BufferLineCloseOthers<CR>', { silent = true, desc = 'Close other buffers' })
    vim.keymap.set('n', '<leader>br', ':BufferLineCloseRight<CR>', { silent = true, desc = 'Close buffers to right' })
    vim.keymap.set('n', '<leader>bl', ':BufferLineCloseLeft<CR>', { silent = true, desc = 'Close buffers to left' })
    vim.keymap.set('n', '<leader>bp', ':BufferLinePick<CR>', { silent = true, desc = 'Pick buffer' })
    vim.keymap.set('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', { silent = true, desc = 'Go to buffer 1' })
    vim.keymap.set('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', { silent = true, desc = 'Go to buffer 2' })
    vim.keymap.set('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', { silent = true, desc = 'Go to buffer 3' })
    vim.keymap.set('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', { silent = true, desc = 'Go to buffer 4' })
    vim.keymap.set('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', { silent = true, desc = 'Go to buffer 5' })
    vim.keymap.set('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', { silent = true, desc = 'Go to buffer 6' })
    vim.keymap.set('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', { silent = true, desc = 'Go to buffer 7' })
    vim.keymap.set('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', { silent = true, desc = 'Go to buffer 8' })
    vim.keymap.set('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>', { silent = true, desc = 'Go to buffer 9' })
    vim.keymap.set('n', '<leader>$', '<Cmd>BufferLineGoToBuffer -1<CR>', { silent = true, desc = 'Go to last buffer' })
  end,
}
