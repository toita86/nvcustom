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

      map("n", "<F5>", dap.continue, { desc = "Debug: Continue" })
      map("n", "<F10>", dap.step_over, { desc = "Debug: Step over" })
      map("n", "<F11>", dap.step_into, { desc = "Debug: Step into" })
      map("n", "<F12>", dap.step_out, { desc = "Debug: Step out" })

      map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })
      map("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })
      map("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })

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
      local python_path = "python"
      local candidates = {
        ".venv/bin/python",
        "venv/bin/python",
        ".venv/Scripts/python.exe",
        "venv/Scripts/python.exe",
      }

      for _, candidate in ipairs(candidates) do
        if vim.fn.executable(candidate) == 1 then
          python_path = candidate
          break
        end
      end

      vim.fn.sign_define(
        "DapBreakpoint",
        { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" }
      )

      vim.fn.sign_define(
        "DapStopped",
        { text = "▶", texthl = "", linehl = "", numhl = "" }
      )

      require("dap-python").setup(python_path)
    end,
  },
}
