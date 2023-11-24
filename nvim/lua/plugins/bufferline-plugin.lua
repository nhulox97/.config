return {
  'akinsho/bufferline.nvim',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
  },
  config = function()
    require("bufferline").setup({
      options = {
        indicator = {
          icon = "  ",
          style = "icon"
        },
        modified_icon = "󱩽",
        buffer_close_icon = "",
        close_icon = "󰅚",
        color_icons = true,
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 6,
        diagnostics = "nvim_lsp",
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_icons = true,
        persist_buffer_sort = true,
        separator_style = "slope",
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' }
        },
        offsets = {
          {
            filetype = "NvimTree",
            text = "Tree directory",
            text_align = "left",
            separator = true,
          },
          {
            filetype = "neo-tree",
            text = "Tree directory",
            text_align = "left",
            separator = true,
          }
        },
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and "" or ""
          return icon .. count
        end,
      },
    })
  end
}
