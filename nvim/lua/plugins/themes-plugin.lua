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
    "nxvu699134/vn-night.nvim",
    event = "VeryLazy",
  },
  {
    'olimorris/onedarkpro.nvim',
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
    "EdenEast/nightfox.nvim",
    event = "VeryLazy",
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
  }
}
