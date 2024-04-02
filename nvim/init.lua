---@diagnostic disable: undefined-field

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

require("confs.globals")
require("confs.keymaps")
require("confs.lsp")
require("confs.code-folding")
require("confs.cmp-highlight")

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})
vim.treesitter.language.register("markdown", "mdx")
