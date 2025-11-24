---@diagnostic disable: undefined-global
return {
  'vuki656/package-info.nvim',
  dependencies = { "MunifTanjim/nui.nvim" },
  lazy = true,
  config = function()
    require("package-info").setup({

      highlights = {
        up_to_date = { -- highlight for up to date dependency virtual text
          fg = "#0991e6"
        },
        outdated = { -- highlight for outdated dependency virtual text
          fg = "#e69509"
        },
        invalid = { -- highlight for invalid dependency virtual text
          fg = "#e62e09"
        },
      }
    })
  end
}
