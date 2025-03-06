vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

return {
  {
    'mfussenegger/nvim-dap',
    desc = 'Debugging support. Requires language specific adapters to be configured. (see lang extras)',

    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'nvim-neotest/nvim-nio' },
  -- stylua: ignore
  keys = {
    { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
    { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
  },
        opts = {
          layouts = {
            {
              elements = {
                {
                  id = 'breakpoints',
                  size = 0.33,
                },
                {
                  id = 'stacks',
                  size = 0.33,
                },
                {
                  id = 'watches',
                  size = 0.33,
                },
              },
              position = 'left',
              size = 40,
            },
            {
              elements = {
                {
                  id = 'console',
                  size = 1.0,
                },
              },
              position = 'bottom',
              size = 12,
            },
          },
        },
        config = function(_, opts)
          local dap = require 'dap'
          local dapui = require 'dapui'
          dapui.setup(opts)
          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open {}
          end
          -- dap.listeners.before.event_terminated['dapui_config'] = function()
          --   dapui.close {}
          -- end
          -- dap.listeners.before.event_exited['dapui_config'] = function()
          --   dapui.close {}
          -- end
        end,
      },
      -- virtual text for the debugger
      {
        'theHamsta/nvim-dap-virtual-text',
        opts = {},
      },
      {
        'microsoft/vscode-js-debug',
        build = 'npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out',
        version = '1.*',
      },
    },

  -- stylua: ignore
  keys = {
    { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
    { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },

    config = function()
      -- load mason-nvim-dap here, after all adapters have been setup
      -- if LazyVim.has 'mason-nvim-dap.nvim' then
      --   require('mason-nvim-dap').setup(LazyVim.opts 'mason-nvim-dap.nvim')
      -- end

      vim.api.nvim_set_hl(0, 'DapStoppedLine', { default = true, link = 'Visual' })

      -- for name, sign in pairs(LazyVim.config.icons.dap) do
      --   sign = type(sign) == 'table' and sign or { sign }
      --   vim.fn.sign_define('Dap' .. name, { text = sign[1], texthl = sign[2] or 'DiagnosticInfo', linehl = sign[3], numhl = sign[3] })
      -- end
      local dap = require 'dap'
      dap.adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'js-debug-adapter',
          args = { '${port}' },
        },
      }

      -- setup dap config by VsCode launch.json file
      local vscode = require 'dap.ext.vscode'
      local json = require 'plenary.json'
      vscode.json_decode = function(str)
        local project_root = vim.fn.getcwd()
        local modified_str = str:gsub('%${workspaceRoot}', project_root)
        return vim.json.decode(json.json_strip_comments(modified_str, {}))
      end
      for _, language in ipairs { 'typescript', 'javascript' } do
        dap.configurations[language] = {
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
          },
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
          },
        }
      end
    end,
  },
}
