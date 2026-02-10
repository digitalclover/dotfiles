return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
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
