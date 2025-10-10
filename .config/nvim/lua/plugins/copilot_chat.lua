return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    cmd = 'CopilotChat',
    opts = function()
      vim.g.copilot_no_tab_map = true
      local user = vim.env.USER or 'User'
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        auto_insert_mode = false,
        auto_fold = true,
        insert_at_end = true,
        model = 'claude-sonnet-4',
        tools = 'copilot',
        headers = {
          user = '  ' .. user .. ' ',
          assistant = '  Copilot ',
          tool = '  Tool',
        },
        window = {
          width = 0.4,
        },
      }
    end,
    keys = {
      { '<c-s>', '<CR>', ft = 'copilot-chat', desc = 'Submit Prompt', remap = true },
      { '<leader>a', '', desc = '+[A]I (Copilot)', mode = { 'n', 'v' } },
      {
        '<leader>aa',
        function()
          return require('CopilotChat').toggle()
        end,
        desc = 'CopilotChat - Toggle',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ax',
        function()
          return require('CopilotChat').reset()
        end,
        desc = 'CopilotChat - Clear',
        mode = { 'n', 'v' },
      },
      {
        '<leader>aq',
        function()
          local input = vim.fn.input 'Quick Chat: '
          if input ~= '' then
            require('CopilotChat').ask(input)
          end
        end,
        desc = 'CopilotChat - Quick Chat',
        mode = { 'n', 'v' },
      },
      {
        '<leader>am',
        function()
          return require('CopilotChat').select_model()
        end,
        desc = 'CopilotChat - Select Model',
      },
      {
        '<leader>as',
        function()
          return require('CopilotChat').stop()
        end,
        desc = 'CopilotChat - Stop Output',
        mode = { 'n', 'v' },
      },
    },
  },
}
