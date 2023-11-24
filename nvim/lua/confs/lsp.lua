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

vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.config({ virtual_lines = { only_current_line = true } })]]
