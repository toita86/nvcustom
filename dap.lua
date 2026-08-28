return {
  {
    "mfussenegger/nvim-dap",
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local map = vim.keymap.set

      map("n", "<F5>", dap.continue)
      map("n", "<F10>", dap.step_over)
      map("n", "<F11>", dap.step_into)
      map("n", "<F12>", dap.step_out)

      map("n", "<leader>db", dap.toggle_breakpoint)
      map("n", "<leader>dr", dap.repl.open)
      map("n", "<leader>du", dapui.toggle)

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",

    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },

    config = function()
      local python_path

      if vim.fn.executable("./.venv/Scripts/python.exe") == 1 then
        python_path = "./.venv/Scripts/python.exe"
      elseif vim.fn.executable("./venv/Scripts/python.exe") == 1 then
        python_path = "./venv/Scripts/python.exe"
      else
        python_path = "python"
      end

      vim.fn.sign_define(
        "DapBreakpoint",
        { text = "🔴", texthl = "", linehl = "", numhl = "" }
      )

      vim.fn.sign_define(
        "DapStopped",
        { text = "▶", texthl = "", linehl = "", numhl = "" }
      )

      require("dap-python").setup(python_path)
    end,
  },
}
