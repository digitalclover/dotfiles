return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  keys = {
    {
      '<leader>h',
      function() end,
      desc = 'Harpoon⇀',
    },
    {
      '<leader>he',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = 'List all ',
    },
    {
      '<leader>ha',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'Add buffer to Harpoon list',
    },
    {
      '<C-1>',
      function()
        require('harpoon'):list():select(1)
      end,
    },
    {
      '<C-2>',
      function()
        require('harpoon'):list():select(2)
      end,
    },
    {
      '<C-3>',
      function()
        require('harpoon'):list():select(3)
      end,
    },
    {
      '<C-4>',
      function()
        require('harpoon'):list():select(4)
      end,
    },
    {
      '<C-5>',
      function()
        require('harpoon'):list():select(5)
      end,
    },
    {
      '<C-6>',
      function()
        require('harpoon'):list():select(6)
      end,
    },
    {
      '<C-7>',
      function()
        require('harpoon'):list():select(7)
      end,
    },
    {
      '<C-8>',
      function()
        require('harpoon'):list():select(8)
      end,
    },
    {
      '<C-9>',
      function()
        require('harpoon'):list():select(9)
      end,
    }{
      '<C-n>',
      function()
        require('harpoon'):list():next()
      end,
    },
    {
      '<C-p>',
      function()
        require('harpoon'):list():next()
      end,
    },
  },
}
