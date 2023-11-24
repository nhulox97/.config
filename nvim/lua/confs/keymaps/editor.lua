local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>", opts)
vim.keymap.set("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>", opts)
vim.keymap.set("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>", opts)
vim.keymap.set("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>", opts)

vim.keymap.set("n", "<leader>gc", ":lua require('telescope.builtin').git_commits()<CR>", opts)
vim.keymap.set("n", "<leader>gf", ":lua require('telescope.builtin').git_files()<CR>", opts)
vim.keymap.set("n", "<leader>gb", ":lua require('telescope.builtin').git_branches()<CR>", opts)
vim.keymap.set("n", "<leader>gs", ":lua require('telescope.builtin').git_status()<CR>", opts)

vim.keymap.set("n", "<leader>cs", ":lua require('telescope.builtin').colorscheme()<CR>", opts)

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
