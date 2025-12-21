return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = 'Open LazyGit' })

    -- Auto-close the terminal buffer when lazygit exits
    vim.api.nvim_create_autocmd("TermClose", {
      pattern = "*lazygit*",
      callback = function()
        -- Small delay to let things settle
        vim.defer_fn(function()
          -- Find and delete the lazygit buffer
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            local buf_name = vim.api.nvim_buf_get_name(buf)
            if buf_name:match("lazygit") then
              pcall(vim.api.nvim_buf_delete, buf, { force = true })
            end
          end
        end, 10)
      end,
    })
  end,
}
