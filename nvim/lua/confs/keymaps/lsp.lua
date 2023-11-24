local opts = { noremap = true, silent = true }

vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)         --> jumps to the definition of the symbol under the cursor
vim.keymap.set("n", "H", ":lua vim.lsp.buf.hover()<CR>", opts)                --> information about the symbol under the cursos in a floating window
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)     --> lists all the implementations for the symbol under the cursor in the quickfix window
vim.keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts) --> selects a code action available at the current cursor position
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)          --> lists all the references to the symbl under the cursor in the quickfix window
vim.keymap.set("n", "<leader>ld", ":lua vim.diagnostic.open_float()<CR>", opts)
vim.keymap.set("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
vim.keymap.set("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
vim.keymap.set("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
vim.keymap.set("n", "<leader>lf", ":lua vim.lsp.buf.formatting()<CR>", opts) --> formats the current buffer

-- folke/trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
