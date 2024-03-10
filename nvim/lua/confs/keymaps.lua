local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>", opts)
vim.keymap.set("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>", opts)
vim.keymap.set("n", "<leader>fd", ":lua require('telescope.builtin').git_status()<CR>", opts)
vim.keymap.set("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>", opts)
vim.keymap.set("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>", opts)
vim.keymap.set("n", "<leader>fs", ":lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)

vim.keymap.set("n", "<leader>gc", ":lua require('telescope.builtin').git_commits()<CR>", opts)
vim.keymap.set("n", "<leader>gf", ":lua require('telescope.builtin').git_files()<CR>", opts)
vim.keymap.set("n", "<leader>gb", ":lua require('telescope.builtin').git_branches()<CR>", opts)

vim.keymap.set("n", "<leader>cs", ":lua require('telescope.builtin').colorscheme()<CR>", opts)

vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
vim.keymap.set({ "n", "x" }, "<leader>riv", ":Refactor inline_var")
vim.keymap.set("n", "<leader>rif", ":Refactor inline_func")
vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

vim.keymap.set("n", "<leader>a", ":Telescope ascii<CR>", opts)

vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<leader>wa", ":wall<CR>", opts)
vim.keymap.set("n", "<leader>wq", ":wq<CR>", opts)
vim.keymap.set("n", "<leader>qa", ":qall<CR>", opts)
vim.keymap.set("n", "<leader>qq", ":q<CR>", opts)
vim.keymap.set("n", "<leader>qx", ":bd<CR>", opts)

vim.keymap.set("n", "<leader>ng", ":Neogit<CR>", opts)

vim.cmd([[
  nmap <Leader>z 1z=
]])

vim.keymap.set('n', '+', ':vertical resize +3<CR>', opts)
vim.keymap.set('n', '_', ':vertical resize -3<CR>', opts)
vim.keymap.set('n', '<leader>+', ':res +3<CR>', opts)
vim.keymap.set('n', '<leader>_', ':res -3<CR>', opts)

vim.keymap.set('n', '<leader>vv', ':Vista nvim_lsp<CR>', opts)
vim.keymap.set('n', '<leader>vc', ':Vista!<CR>', opts)


local npm_info = require("package-info")
-- package-info
-- Show dependency versions
vim.keymap.set({ "n" }, "<leader>ns", npm_info.show, opts)
-- Hide dependency versions
vim.keymap.set({ "n" }, "<leader>nc", npm_info.hide, opts)
-- Toggle dependency versions
vim.keymap.set({ "n" }, "<leader>nt", npm_info.toggle, opts)
-- Update dependency on the line
vim.keymap.set({ "n" }, "<leader>nu", npm_info.update, opts)
-- Delete dependency on the line
vim.keymap.set({ "n" }, "<leader>nd", npm_info.delete, opts)
-- Install a new dependency
vim.keymap.set({ "n" }, "<leader>ni", npm_info.install, opts)
-- Install a different dependency version
vim.keymap.set({ "n" }, "<leader>np", npm_info.change_version, opts)

-- TODO comments motions
local todo_comments = require("todo-comments")
vim.keymap.set("n", "]t", function() todo_comments.jump_next() end, opts)
vim.keymap.set("n", "[t", function() todo_comments.jump_prev() end, opts)

-- Crates
local crates = require('crates')
vim.keymap.set('n', '<leader>ctt', crates.toggle, opts)
vim.keymap.set('n', '<leader>cr', crates.reload, opts)
vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, opts)
vim.keymap.set('n', '<leader>cf', crates.show_features_popup, opts)
vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, opts)
vim.keymap.set('n', '<leader>cu', crates.update_crate, opts)
vim.keymap.set('v', '<leader>cu', crates.update_crates, opts)
vim.keymap.set('n', '<leader>cua', crates.update_all_crates, opts)
vim.keymap.set('n', '<leader>cU', crates.upgrade_crate, opts)
vim.keymap.set('v', '<leader>cU', crates.upgrade_crates, opts)
vim.keymap.set('n', '<leader>caA', crates.upgrade_all_crates, opts)
vim.keymap.set('n', '<leader>ce', crates.expand_plain_crate_to_inline_table, opts)
vim.keymap.set('n', '<leader>cE', crates.extract_crate_into_table, opts)
vim.keymap.set('n', '<leader>cH', crates.open_homepage, opts)
vim.keymap.set('n', '<leader>cR', crates.open_repository, opts)
vim.keymap.set('n', '<leader>cD', crates.open_documentation, opts)
vim.keymap.set('n', '<leader>cC', crates.open_crates_io, opts)

-- NvimTree keymaps
vim.keymap.set("n", "<leader>ty", ":NvimTreeFocus<CR>", opts)
vim.keymap.set("n", "<leader>tc", ":NvimTreeCollapse<CR>", opts)
vim.keymap.set("n", "<leader>tk", ":NvimTreeCollapseKeepBuffers<CR>", opts)
vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>", opts)
vim.keymap.set("n", "<leader>tr", ":NvimTreeRefresh<CR>", opts)

-- Telescope keymaps
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

-- gopher keymaps
vim.keymap.set("n", "<leader>gsj", ":GoTagAdd json <CR>", opts)
vim.keymap.set("n", "<leader>gsy", ":GoTagAdd yaml <CR>", opts)
