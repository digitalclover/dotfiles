return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    cmd = 'CopilotChat',
    opts = function()
      vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.g.copilot_no_tab_map = true
      local user = vim.env.USER or 'User'
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        auto_insert_mode = true,
        question_header = '  ' .. user .. ' ',
        answer_header = '  Copilot ',
        window = {
          width = 0.4,
        },
      }
    end,
    keys = {
      { '<c-s>', '<CR>', ft = 'copilot-chat', desc = 'Submit Prompt', remap = true },
      { '<leader>a', '', desc = '+ai', mode = { 'n', 'v' } },
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
        '<leader>ab',
        function()
          local input = vim.fn.input 'Quick Chat: '
          if input ~= '' then
            require('CopilotChat').ask(input)
          end
        end,
        desc = 'CopilotChat - Open Buffer Chat',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ap',
        function()
          return require('CopilotChat').prompts()
        end,
        desc = 'CopilotChat - Prompt actions',
      },
      {
        '<leader>am',
        function()
          return require('CopilotChat').select_model()
        end,
        desc = 'CopilotChat - Select Model',
      },
      {
        '<leader>ag',
        function()
          return require('CopilotChat').select_agent()
        end,
        desc = 'CopilotChat - Select Agent',
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
