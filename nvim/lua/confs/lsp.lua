local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local util = require("lspconfig.util")

require("neodev").setup({})
require('luasnip.loaders.from_vscode').lazy_load()

local on_attach = function(client, bufnr)
  if client.server_capabilities["documentSymbolProvider"] then
    require("nvim-navic").attach(client, bufnr)
  end
end

lspconfig["lua_ls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
})

lspconfig["tsserver"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig["vimls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig["yamlls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig["rust_analyzer"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig["prismals"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig["jsonls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig["bashls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig["dockerls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig["golangci_lint_ls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- lspconfig["tailwindcss"].setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "css", "jsx", "tsx" }
-- })

lspconfig["docker_compose_language_service"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig["eslint"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig["astro"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "astro" },
})

lspconfig["cssls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig["svelte"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig["emmet_language_server"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact", 'astro' },
  init_options = {
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
})

lspconfig["gopls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    }
  }
})

vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.config({ virtual_lines = { only_current_line = true } })]]
