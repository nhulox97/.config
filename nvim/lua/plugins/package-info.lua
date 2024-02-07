---@diagnostic disable: undefined-global
return {
  'vuki656/package-info.nvim',
  dependencies = { "MunifTanjim/nui.nvim" },
  lazy = true,
  config = function()
    require("package-info").setup({
      colors = {
        up_to_date = "#1d7cc4",
        outdated = "#ba7220"
      }
    })
  end
}
