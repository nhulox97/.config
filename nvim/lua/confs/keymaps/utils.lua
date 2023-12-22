-- package-info
-- Show dependency versions
vim.keymap.set({ "n" }, "<LEADER>ns", require("package-info").show, { silent = true, noremap = true })
-- Hide dependency versions
vim.keymap.set({ "n" }, "<LEADER>nc", require("package-info").hide, { silent = true, noremap = true })
-- Toggle dependency versions
vim.keymap.set({ "n" }, "<LEADER>nt", require("package-info").toggle, { silent = true, noremap = true })
-- Update dependency on the line
vim.keymap.set({ "n" }, "<LEADER>nu", require("package-info").update, { silent = true, noremap = true })
-- Delete dependency on the line
vim.keymap.set({ "n" }, "<LEADER>nd", require("package-info").delete, { silent = true, noremap = true })
-- Install a new dependency
vim.keymap.set({ "n" }, "<LEADER>ni", require("package-info").install, { silent = true, noremap = true })
-- Install a different dependency version
vim.keymap.set({ "n" }, "<LEADER>np", require("package-info").change_version, { silent = true, noremap = true })

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- Crates
local crates = require('crates')
local opts = { silent = true }

vim.keymap.set('n', '<leader>ct', crates.toggle, opts)
vim.keymap.set('n', '<leader>cr', crates.reload, opts)

vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, opts)
vim.keymap.set('n', '<leader>cf', crates.show_features_popup, opts)
vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, opts)

vim.keymap.set('n', '<leader>cu', crates.update_crate, opts)
vim.keymap.set('v', '<leader>cu', crates.update_crates, opts)
vim.keymap.set('n', '<leader>cua', crates.update_all_crates, opts)
vim.keymap.set('n', '<leader>cU', crates.upgrade_crate, opts)
vim.keymap.set('v', '<leader>cU', crates.upgrade_crates, opts)
vim.keymap.set('n', '<leader>cA', crates.upgrade_all_crates, opts)

vim.keymap.set('n', '<leader>ce', crates.expand_plain_crate_to_inline_table, opts)
vim.keymap.set('n', '<leader>cE', crates.extract_crate_into_table, opts)

vim.keymap.set('n', '<leader>cH', crates.open_homepage, opts)
vim.keymap.set('n', '<leader>cR', crates.open_repository, opts)
vim.keymap.set('n', '<leader>cD', crates.open_documentation, opts)
vim.keymap.set('n', '<leader>cC', crates.open_crates_io, opts)
