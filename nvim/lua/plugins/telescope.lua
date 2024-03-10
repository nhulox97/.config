return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build =
      'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    } },
  branch = '0.1.x',
  lazy = false,
  config = function()
    local default_vertical_layout = {
      height = 0.9,
      horizontal = {
        preview_width = 0.65,
      },
      prompt_position = 'top',
      width = 0.8
    }
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", "plugged", "dist", ".git" },
        path_display = { "truncate" },
        layout_config = default_vertical_layout
      },
      pickers = {
        find_files = {
          dotfiles = true,
          hidden = true,
        },
        diagnostics = {
          theme = "dropdown",
        },
        git_branches = {
          theme = 'dropdown'
        }
      },
      extensions = {
        package_info = {
          theme = 'ivy',
        }
      }
    })

    telescope.load_extension("package_info")
    telescope.load_extension("refactoring")
  end
}
