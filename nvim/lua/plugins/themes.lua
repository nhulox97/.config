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
    lazy = true,
    event = "VeryLazy"
  },
  {
    "oxfist/night-owl.nvim",
    lazy = true,
    event = "VeryLazy",
  },
  {
    'luisiacc/gruvbox-baby',
    lazy = true,
    event = "VeryLazy"
  },
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    event = "VeryLazy"
  },

  {
    -- "ellisonleao/gruvbox.nvim",
    -- config = function()
    --   -- Default options:
    --   require("gruvbox").setup({
    --     bold = true,
    --     italic = {
    --       strings = true,
    --       emphasis = true,
    --       comments = true,
    --       operators = true,
    --       folds = true,
    --     },
    --   })
    -- end,
    "datsfilipe/gruvbox.nvim",
    config = function()
      require('gruvbox').setup({
        italics = {
          comments = true,  -- Boolean: Italicizes comments
          keywords = true,  -- Boolean: Italicizes keywords
          functions = true, -- Boolean: Italicizes functions
          strings = true,   -- Boolean: Italicizes strings
          variables = true, -- Boolean: Italicizes variables
        },
      })
    end,
    lazy = true,
    event = "VeryLazy",
  }

}
