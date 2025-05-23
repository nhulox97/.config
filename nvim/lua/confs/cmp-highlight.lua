-- local colors = {
--   bg   = '#011627', -- Dark background
--   bg1  = '#041c33', -- Slightly lighter background
--   fg   = '#d6deeb', -- Light foreground text for contrast
--   fg1  = '#c5e4fd', -- Lighter text/overlay
--   fg2  = '#8892b0', -- Surface color with more contrast from bg
--   fg3  = '#637777', -- Subtext, less contrast than fg but distinct
--   rfg  = '#80201f', -- Red background
--   rbg  = '#ff5370', -- Slightly brighter red for text
--   vbg  = '#c792ea', -- Mauve (purple background)
--   lfg  = '#82aaff', -- Light lavender/blue foreground
--   sfg  = '#7fdbca', -- Sapphire (cyan)
--   yfg  = '#ffeb95', -- Yellow foreground
--   ybg  = '#f6d32d', -- Yellow background (more contrast)
--   gbg  = '#22da6e', -- Green background
--   yfg1 = '#ecc48d', -- Light rosewater
--   bbg  = '#82aaff', -- Blue background (lavender)
--   cbg  = '#21c7a8', -- Teal background
-- }

-- local colors = {
--   bg   = '#191927', -- Base (dark background)
--   bg1  = '#181825', -- Mantle (slightly lighter background)
--   fg   = '#cdd6f4', -- Text (light foreground text for contrast)
--   fg1  = '#b4befe', -- Lavender (lighter text/overlay)
--   fg2  = '#6c7086', -- Overlay0 (surface color with more contrast from bg)
--   fg3  = '#585b70', -- Surface2 (subtext, less contrast than fg but distinct)
--   rfg  = '#e03464', -- Red
--   rbg  = '#eba0ac', -- Maroon (slightly brighter red for text)
--   vbg  = '#cba6f7', -- Mauve (purple background)
--   lfg  = '#89b4fa', -- Blue
--   sfg  = '#94e2d5', -- Teal
--   yfg  = '#f9e2af', -- Yellow
--   ybg  = '#fab387', -- Peach (more contrast)
--   gbg  = '#a6e3a1', -- Green
--   yfg1 = '#f5e0dc', -- Rosewater
--   bbg  = '#389dc9', -- Sapphire
--   cbg  = '#89dceb', -- Sky
-- }

local colors = {
  bg   = '#242424', -- Base (gruvbox dark0)
  bg1  = '#1d2021', -- Darker variant (gruvbox dark0_hard)
  fg   = '#ebdbb2', -- Light text (gruvbox light0)
  fg1  = '#d5c4a1', -- Secondary text (gruvbox light2)
  fg2  = '#928374', -- Muted text (gruvbox gray)
  fg3  = '#665c54', -- More muted (gruvbox dark4)
  rfg  = '#cc241d', -- Red (gruvbox red)
  rbg  = '#fb4934', -- Bright red (gruvbox bright_red)
  vbg  = '#b16286', -- Purple (gruvbox purple)
  lfg  = '#458588', -- Blue (gruvbox blue)
  sfg  = '#689d6a', -- Aqua (gruvbox aqua)
  yfg  = '#d79921', -- Yellow (gruvbox yellow)
  ybg  = '#fe8019', -- Orange (gruvbox orange)
  gbg  = '#98971a', -- Green (gruvbox green)
  yfg1 = '#bdae93', -- Light brown (gruvbox light3)
  bbg  = '#076678', -- Dark blue (gruvbox dark_blue)
  cbg  = '#8ec07c', -- Bright aqua (gruvbox bright_aqua)
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

vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = colors.fg3, bg = colors.gbg })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = colors.fg3, bg = colors.gbg })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = colors.fg3, bg = colors.gbg })

vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = colors.yfg, bg = colors.ybg })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = colors.yfg, bg = colors.ybg })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = colors.yfg, bg = colors.ybg })

vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = colors.fg3, bg = colors.vbg })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = colors.fg3, bg = colors.vbg })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = colors.fg3, bg = colors.vbg })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = colors.fg3, bg = colors.vbg })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = colors.fg3, bg = colors.vbg })

vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = colors.fg3, bg = colors.fg1 })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = colors.fg3, bg = colors.fg1 })

vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = colors.rfg, bg = colors.yfg1 })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = colors.rfg, bg = colors.yfg1 })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = colors.rfg, bg = colors.yfg1 })

vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = colors.fg, bg = colors.bbg })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = colors.fg, bg = colors.bbg })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = colors.fg, bg = colors.bbg })

vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = colors.fg3, bg = colors.cbg })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = colors.fg3, bg = colors.cbg })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = colors.fg3, bg = colors.cbg })
