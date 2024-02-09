return {
  "willothy/nvim-cokeline",
  dependencies = {
    "nvim-lua/plenary.nvim",       -- Required for v0.4.0+
    "nvim-tree/nvim-web-devicons", -- If you want devicons
    "stevearc/resession.nvim"      -- Optional, for persistent history
  },
  config = function()
    local get_hex = require('cokeline.hlgroups').get_hl_attr
    local yellow = vim.g.terminal_color_3
    require("cokeline").setup({
      sidebar = {
        filetype = { 'NvimTree', 'neo-tree' },
        components = {
          {
            text = function(buf)
              return buf.filetype
            end,
            fg = yellow,
            bg = function() return get_hex('NvimTreeNormal', 'bg') end,
            bold = true,
          },
        }
      },
    })
  end
}
