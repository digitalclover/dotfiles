return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = (function()
      local workspaces = {}
      local prefix = 'OBSIDIAN_PATH_'

      for k, v in pairs(vim.fn.environ()) do
        if k:sub(1, #prefix) == prefix then
          local suffix = k:sub(#prefix + 1)
          table.insert(workspaces, {
            name = suffix:lower(),
            path = v,
          })
        end
      end

      return workspaces
    end)(),
  },
}
