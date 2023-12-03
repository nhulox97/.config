---@diagnostic disable-next-line: undefined-global
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require('luasnip.loaders.from_vscode').lazy_load()

require("lspconfig")["lua_ls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["tsserver"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["vimls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["yamlls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["rust_analyzer"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["prismals"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["jsonls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["bashls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["dockerls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["golangci_lint_ls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- require("lspconfig")["tailwindcss"].setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

require("lspconfig")["docker_compose_language_service"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["eslint"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["astro"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["cssls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["svelte"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["emmet_language_server"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
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

vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.config({ virtual_lines = { only_current_line = true } })]]
