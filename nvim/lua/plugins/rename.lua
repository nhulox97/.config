---@diagnostic disable: missing-fields
-- return {
--   'filipdutescu/renamer.nvim',
--   branch = 'master',
--   dependencies = { { 'nvim-lua/plenary.nvim' } },
--   keys = {
--     { '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true } },
--   },
--   config = function()
--     require("renamer").setup({
--       title = 'renamer',
--       padding = {
--         top = 0,
--         left = 0,
--         bottom = 0,
--         right = 0,
--       },
--       min_width = 15,
--       max_width = 45,
--       border = true,
--       border_chars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
--       show_refs = true,
--       with_qf_list = true,
--       with_popup = true,
--     })
--   end
-- }
return {
  "smjonas/inc-rename.nvim",
  keys = {
    { '<leader>rn', ':IncRename ', { noremap = true, silent = true, } }
  },
  config = function()
    require("inc_rename").setup()
  end,
}
