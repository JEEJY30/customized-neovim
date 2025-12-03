local function is_treesitter_window()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local filetype = vim.bo.filetype

  return filetype == 'query'
    or filetype == 'tsplayground'
    or buf_name:match('TSPlayground')
    or buf_name:match('NvimTree_1')
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'auto',
        icons_enabled = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
    lualine_a = {
      {
        'mode',
        cond = function() return not is_treesitter_window() end
      }
    },
    lualine_b = {'branch'},
    lualine_c = {
      {
        'filename',
        cond = function() return not is_treesitter_window() end
      }
    },
    lualine_x = {
      {
        'filetype',
        cond = function() return not is_treesitter_window() end
      }
    },
    lualine_y = {
      {
        'progress',
      }
    },
    lualine_z = {
      {
        'location',
      }
    }
  },
    inactive_sections = {
    lualine_a = {},
    lualine_b = {"branch"},
    lualine_c = {},  -- Empty so NvimTree_1 doesn't show in inactive state
    lualine_x = {},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
    })
  end,
}
