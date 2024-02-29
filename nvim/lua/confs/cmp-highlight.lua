local dark_colors = require("catppuccin.palettes").get_palette "mocha"
local light_colors = require("catppuccin.palettes").get_palette "latte"

local colors = {
  bg = dark_colors.crust,
  bg1 = dark_colors.mantle,
  fg = dark_colors.text,
  fg1 = light_colors.overlay1,
  fg2 = dark_colors.surface0,
  fg3 = dark_colors.subtext1,
  rbg = dark_colors.red,
  rfg = dark_colors.rosewater,
  vbg = dark_colors.mauve,
  lfg = light_colors.lavender,
  sfg = dark_colors.sapphire,
  yfg = dark_colors.yellow,
  ybg = light_colors.yellow,
  gbg = dark_colors.green,
  yfg1 = light_colors.rosewater,
  bbg = light_colors.lavender,
  cbg = light_colors.teal
}


vim.api.nvim_set_hl(0, "CmpDoc", { bg = colors.bg, fg = colors.fg })

vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.bg, fg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.bg1, fg = colors.fg })

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = colors.fg1, bg = "NONE", strikethrough = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = colors.sfg, bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = colors.sfg, bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = colors.lfg, bg = "NONE", italic = true })

vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = colors.rfg, bg = colors.rbg })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = colors.rfg, bg = colors.rbg })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = colors.rfg, bg = colors.rbg })

vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = colors.fg2, bg = colors.gbg })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = colors.fg2, bg = colors.gbg })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = colors.fg2, bg = colors.gbg })

vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = colors.yfg, bg = colors.ybg })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = colors.yfg, bg = colors.ybg })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = colors.yfg, bg = colors.ybg })

vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = colors.fg2, bg = colors.vbg })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = colors.fg2, bg = colors.vbg })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = colors.fg2, bg = colors.vbg })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = colors.fg2, bg = colors.vbg })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = colors.fg2, bg = colors.vbg })

vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = colors.fg, bg = colors.fg1 })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = colors.fg, bg = colors.fg1 })

vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = colors.rfg, bg = colors.yfg1 })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = colors.rfg, bg = colors.yfg1 })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = colors.rfg, bg = colors.yfg1 })

vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = colors.fg, bg = colors.bbg })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = colors.fg, bg = colors.bbg })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = colors.fg, bg = colors.bbg })

vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = colors.fg3, bg = colors.cbg })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = colors.fg3, bg = colors.cbg })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = colors.fg3, bg = colors.cbg })
