-- return {
--   'folke/tokyonight.nvim',
--   priority = 1000,
--   init = function()
--     vim.cmd.colorscheme 'tokyonight-moon'
--   end,
--   opts = {
--     transparent = true,
--     styles = {
--       floats = 'dark',
--     },
--   },
-- }
return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_background = 'hard'
    vim.o.background = 'dark'
    vim.cmd.colorscheme('gruvbox-material')
  end
}
