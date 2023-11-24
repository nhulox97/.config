local opts = { noremap = true, silent = true }

-- vim.keymap.set("n", "<leader>tf", ":Neotree toggle current reveal_force_cwd right<CR>", opts)
-- vim.keymap.set("n", "<leader>tb", ":Neotree toggle show buffers right<CR>", opts)
-- vim.keymap.set("n", "<leader>tg", ":Neotree float git_status<CR>", opts)


vim.keymap.set("n", "<leader>ty", ":NvimTreeFocus<CR>", opts)
vim.keymap.set("n", "<leader>tc", ":NvimTreeCollapse<CR>", opts)
vim.keymap.set("n", "<leader>tk", ":NvimTreeCollapseKeepBuffers<CR>", opts)
vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>", opts)
vim.keymap.set("n", "<leader>tr", ":NvimTreeRefresh<CR>", opts)
