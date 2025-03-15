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
      '<leader>hd',
      function() end,
      desc = 'Delete',
    },
    {
      '<leader>hdj',
      function()
        require('harpoon'):list():remove_at(1)
      end,
      desc = 'Delete buffer [j] to Harpoon list',
    },
    {
      '<leader>hdk',
      function()
        require('harpoon'):list():remove_at(2)
      end,
      desc = 'Delete buffer [k] to Harpoon list',
    },
    {
      '<leader>hdl',
      function()
        require('harpoon'):list():remove_at(3)
      end,
      desc = 'Delete buffer [l] to Harpoon list',
    },
    {
      '<leader>hd;',
      function()
        require('harpoon'):list():remove_at(4)
      end,
      desc = 'Delete buffer [;] to Harpoon list',
    },
    {
      '<C-j>',
      function()
        require('harpoon'):list():select(1)
      end,
    },
    {
      '<C-k>',
      function()
        require('harpoon'):list():select(2)
      end,
    },
    {
      '<C-l>',
      function()
        require('harpoon'):list():select(3)
      end,
    },
    {
      '<C-;>',
      function()
        require('harpoon'):list():select(4)
      end,
    },
    {
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
