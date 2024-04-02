return {
  {
    'folke/tokyonight.nvim',
    config = true,
    lazy = true,
    event = "VeryLazy"
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme catppuccin')
    end
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("cyberdream").setup({
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = true,
      })
    end,
  },
  {
    "oxfist/night-owl.nvim",
    lazy = true,
    event = "VeryLazy",
  }
}
