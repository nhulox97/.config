return {
  'saecki/crates.nvim',
  tag = 'stable',
  lazy = true,
  event = "VeryLazy",
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('crates').setup()
  end,
}
