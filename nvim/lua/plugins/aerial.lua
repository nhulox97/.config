return {
  'stevearc/aerial.nvim',
  opts = {},
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("aerial").setup({
      backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
        "Package",
        "Constant",
        "Variable",
        "Event",
        "Property",
        "Field",
      }
    })
  end
}
