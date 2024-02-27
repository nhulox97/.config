---@diagnostic disable: undefined-global, undefined-field
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.vista_renderer_enable_icon = 1
-- vim.g.vista_icon_indent = { "╰─▸ ", "├─▸ " }

vim.opt.termguicolors = true
vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark
vim.opt.signcolumn = "yes"  -- show sign column so that text doesn't shift

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup("plugins")

require("confs.keymaps.lsp")
require("confs.keymaps.editor")
require("confs.keymaps.tree")
require("confs.keymaps.utils")
require("confs.lsp")
require("confs.globals")
require("confs.code-folding")

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})
vim.treesitter.language.register("markdown", "mdx")
