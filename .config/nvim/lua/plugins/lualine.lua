return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = {
          {
            function()
              local reg = vim.fn.reg_recording()
              if reg == '' then
                return ''
              else
                return '🔴 Recording @' .. reg
              end
            end,
            color = { fg = '#ff9e64' },
          },
          'encoding',
          'fileformat',
          'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }

    local function refresh_lualine()
      require('lualine').refresh()
    end

    vim.api.nvim_create_autocmd({ 'RecordingEnter', 'RecordingLeave' }, {
      callback = refresh_lualine,
      desc = 'Refresh lualine when macro recording starts',
    })
  end,
}
