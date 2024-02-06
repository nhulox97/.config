return {
  {
    'folke/tokyonight.nvim',
    config = true,
    lazy = true,
    event = "VeryLazy"
  },
  {
    "bluz71/vim-nightfly-colors",
    lazy = true,
    event = "VeryLazy",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    event = "VeryLazy",
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
      -- custom options here
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
    end,
  },
  {
    'Mofiqul/dracula.nvim',
    lazy = true,
    event = "VeryLazy",
  },
  {
    'rose-pine/neovim',
    lazy = true,
    name = 'rose-pine',
    event = "VeryLazy",
  },
  {
    'projekt0n/github-nvim-theme',
    lazy = true,
    event = "VeryLazy"
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        italic_comments = false,
        hide_fillchars = true,
        borderless_telescope = true,
      })
    end,
  }
}
