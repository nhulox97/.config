return {
  {
    'folke/tokyonight.nvim',
    config = true,
    event = "VeryLazy"
  },
  {
    "bluz71/vim-nightfly-colors",
    event = "VeryLazy",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "VeryLazy",
  },
  {
    "tiagovla/tokyodark.nvim",
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
    event = "VeryLazy",
  },
  {
    'luisiacc/gruvbox-baby',
    event = "VeryLazy",
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
  },
  {
    'projekt0n/github-nvim-theme',
    event = "VeryLazy"
  }
}
