--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- See `:help vim.opt`
-- See `:help option-list`
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.fileencodings = { 'usc-bom', 'utf-8', 'sjis' }
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt_local.conceallevel = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.opt.cmdheight = 0
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

--  See `:help vim.keymap.set()`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Show line diagnostic' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd`
vim.keymap.set('n', '<C-Left>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-Right>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-Down>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-Up>', '<C-w>k', { desc = 'Move focus to the upper window' })
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.jbuilder',
  callback = function()
    vim.bo.filetype = 'ruby'
  end,
})

vim.keymap.set('n', '<C-A-j>', function()
  local count = vim.v.count1
  vim.cmd('move ' .. (vim.fn.line('.') + count))
  vim.cmd('normal! ==')
end, { desc = 'Move line down', noremap = true })

vim.keymap.set('n', '<C-A-k>', function()
  local count = vim.v.count1
  vim.cmd('move ' .. (vim.fn.line('.') - count - 1))
  vim.cmd('normal! ==')
end, { desc = 'Move line up', noremap = true })

vim.keymap.set('n', '<C-A-h>', function()
  local count = vim.v.count1
  vim.cmd('normal! ' .. count .. '<<')
end, { desc = 'Shift line left', noremap = true })

vim.keymap.set('n', '<C-A-l>', function()
  local count = vim.v.count1
  vim.cmd('normal! ' .. count .. '>>')
end, { desc = 'Shift line right', noremap = true })


--  See `:help lua-guide-autocommands`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  { import = 'plugins' },
  -- See `:help lazy.nvim-🔌-plugin-spec`
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
