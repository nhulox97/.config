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
    require("telescope").setup({
      pickers = {
        find_files = {
          dotfiles = true,
          hidden = true,
          theme = 'ivy'
        },
        diagnostics = {
          theme = "dropdown",
        },
        git_branches = {
          theme = 'dropdown'
        }
      },
      defaults = {
        file_ignore_patterns = { "node_modules", "plugged", "dist", ".git" },
      },
      extensions = {
        package_info = {
          theme = 'ivy',
        }
      }
    })

    require("telescope").load_extension("package_info")
  end,
}
