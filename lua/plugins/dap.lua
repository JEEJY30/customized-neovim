return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'jay-babu/mason-nvim-dap.nvim',
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    -- Setup mason-nvim-dap (auto-install debug adapters)
    require('mason-nvim-dap').setup({
      ensure_installed = { 'delve' },
      automatic_installation = true,
      handlers = {},
    })

    -- Better DAP UI configuration with stable layout
    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
      mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      expand_lines = vim.fn.has("nvim-0.7") == 1,
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.30 },
            { id = "breakpoints", size = 0.20 },
            { id = "stacks", size = 0.30 },
            { id = "watches", size = 0.20 },
          },
          size = 50,
          position = "left",
        },
        {
          elements = {
            { id = "console", size = 0.6 },
            { id = "repl", size = 0.4 },
          },
          size = 12,
          position = "bottom",
        },
      },
      controls = {
        enabled = true,
        element = "repl",
        icons = {
          pause = "||",
          play = ">",
          step_into = "I",
          step_over = "O",
          step_out = "out",
          step_back = "b",
          run_last = "↻",
          terminate = "□",
        },
      },
      floating = {
        max_height = nil,
        max_width = nil,
        border = "rounded",
        mappings = {
              close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
      render = {
        max_type_length = nil,
        max_value_lines = 100,
      },
    })

    -- Only auto-open UI, don't auto-close
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end

    -- Configure Delve for Go debugging
    dap.adapters.delve = {
      type = 'server',
      port = '${port}',
      executable = {
        command = 'dlv',
        args = { 'dap', '-l', '127.0.0.1:${port}' },
      }
    }

    dap.configurations.go = {
      {
        type = 'delve',
        name = 'Debug',
        request = 'launch',
        program = '${file}',
        cwd = '${fileDirname}',
      },
      {
        type = 'delve',
        name = 'Debug Package',
        request = 'launch',
        program = '${fileDirname}',
      },
      {
        type = 'delve',
        name = 'Debug test',
        request = 'launch',
        mode = 'test',
        program = '${file}',
      },
    }

    -- Simple, reliable keymaps
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end, { desc = 'Debug: Set Conditional Breakpoint' })

    -- UI controls
    vim.keymap.set('n', '<leader>do', dapui.open, { desc = 'Debug: Open UI' })
    vim.keymap.set('n', '<leader>dc', dapui.close, { desc = 'Debug: Close UI' })
    vim.keymap.set('n', '<leader>dt', dapui.toggle, { desc = 'Debug: Toggle UI' })
    vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'Debug: Toggle REPL' })
    vim.keymap.set('n', '<leader>dq', dap.terminate, { desc = 'Debug: Quit/Terminate' })
  end,
}
