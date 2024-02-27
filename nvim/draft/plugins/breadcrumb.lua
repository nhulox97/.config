return {
  "loctvl842/breadcrumb.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("breadcrumb").setup({
      disabled_filetype = {
        "",
        "help",
      },
      icons = {
        File = " ",
        Module = " ",
        Namespace = " ",
        Package = " ",
        Class = " ",
        Method = " ",
        Property = " ",
        Field = " ",
        Constructor = " ",
        Enum = " ",
        Interface = " ",
        Function = "󰡱 ",
        Variable = " ",
        Constant = " ",
        String = " ",
        -- Number = " ",
        Number = " ",
        Boolean = " ",
        Array = " ",
        Object = "󰘦 ",
        Key = " ",
        Null = "ﳠ ",
        EnumMember = " ",
        Struct = " ",
        Event = " ",
        Operator = " ",
        TypeParameter = " ",
      },
      separator = ">",
      depth_limit = 0,
      depth_limit_indicator = "..",
      color_icons = true,
      highlight_group = {
        component = "BreadcrumbText",
        separator = "BreadcrumbSeparator",
      },
    })

    require("breadcrumb").init()
  end
}
