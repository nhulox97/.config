return {
  'elentok/format-on-save.nvim',
  config = function()
    local format_on_save = require("format-on-save")
    local message_buffer = require("format-on-save.error-notifiers.message-buffer")
    local formatters = require("format-on-save.formatters")

    format_on_save.setup({
      error_notifier = message_buffer,
      exclude_path_patterns = {
        "/node_modules/",
        ".local/share/nvim/lazy",
      },
      formatter_by_ft = {
        css = formatters.prettierd,
        html = formatters.prettierd,
        java = formatters.lsp,
        javascript = formatters.prettierd,
        json = formatters.prettierd,
        lua = formatters.lsp,
        markdown = formatters.prettierd,
        openscad = formatters.lsp,
        python = formatters.black,
        rust = formatters.lsp,
        scad = formatters.lsp,
        scss = formatters.prettierd,
        sh = formatters.shfmt,
        terraform = formatters.lsp,
        typescript = formatters.prettierd,
        astro = formatters.lsp,
        typescriptreact = formatters.prettierd,
        yaml = formatters.lsp,
        go = { formatters.lsp, formatters.gofumpt, formatters.goimports_reviser, formatters.golines },
        kotlin = formatters.ktlin,
      }
    })
  end
}
