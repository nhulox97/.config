return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    {
      'nvim-tree/nvim-web-devicons',
      config = {
        require("nvim-web-devicons").setup({
          strict = true,
          override_by_extension = {
            plantuml = {
              icon = "󰈏",
              color = "#ba0d4d",
              name = "plantuml",
            },
            puml = {
              icon = "󰈏",
              color = "#ba0d4d",
              name = "puml",
            },
            astro = {
              icon = "",
              color = "#EF8547",
              name = "astro",
            },
          },
        })
      }
    },
  },
  config = function()
    require("nvim-tree").setup {
      git = {
        enable = true,
      },
      renderer = {
        highlight_git = true,
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        root_folder_modifier = ":t",
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            git = {
              unstaged = "󱔀",
              staged = "",
              unmerged = "",
              renamed = "",
              deleted = "",
              untracked = "",
              ignored = "",
            },
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
            },
          },
        },
      },
      view = {
        side = "right",
        adaptive_size = true
      },
      filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        git_ignored = false
      },
    }
  end,
}
