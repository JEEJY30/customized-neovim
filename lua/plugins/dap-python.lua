return {
  "mfussenegger/nvim-dap-python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    -- Load main DAP modules
    local dap = require("dap")
    local dapui = require("dapui")
    local dap_python = require("dap-python")

    -- Setup Python debugger (debugpy)
    dap_python.setup("python") -- can be "python3" or full venv path

    -- Setup UI and virtual text
    require("nvim-dap-virtual-text").setup()
    dapui.setup()

    -- Auto open/close UI when debugging starts/stops
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

dap.adapters.python = {
  type = "executable",
  command = "/Users/giorgigorgodze/.virtualenvs/debugpy/bin/python", -- full path
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    console = "integratedTerminal",
    pythonPath = "/Users/giorgigorgodze/.virtualenvs/debugpy/bin/python", -- same venv path
  },
}


    -- Keymaps 🧠
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<F5>", function() dap.continue() end, opts)
    vim.keymap.set("n", "<F10>", function() dap.step_over() end, opts)
    vim.keymap.set("n", "<F11>", function() dap.step_into() end, opts)
    vim.keymap.set("n", "<F12>", function() dap.step_out() end, opts)
    vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end, opts)
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, opts)
    vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end, opts)
    vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, opts)
  end,
}

