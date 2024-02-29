---@diagnostic disable: need-check-nil
local function config_custom(colors)
  -- Eviline config for lualine
  -- Author: shadmansaleh
  -- Credit: glepnir
  local lualine = require('lualine')

  -- Color table for highlights
  -- stylua: ignore

  local utils = {
    get_indentation_info = function()
      local buffer = vim.api.nvim_get_current_buf()
      local expandtab = vim.api.nvim_buf_get_option(buffer, "expandtab")
      local shiftwidth = vim.api.nvim_buf_get_option(buffer, "shiftwidth")

      local indentation_info = ""
      if expandtab then
        indentation_info = "spaces:" .. shiftwidth
      else
        indentation_info = "tabs:" .. shiftwidth
      end

      return indentation_info
    end
  }

  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand('%:p:h')
      local gitdir = vim.fn.finddir('.git', filepath .. ';')
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
    is_git_repo = function()
      local output = vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null")
      return string.find(output, "true")
    end,
  }

  -- Config
  local config = {
    options = {
      -- Disable sections and component separators
      component_separators = '',
      section_separators = '|',
      theme = {
        -- We are going to use lualine_c an lualine_x as left and
        -- right section. Both are highlighted by c theme .  So we
        -- are just setting default looks o statusline
        normal = { c = { fg = colors.fg, bg = colors.bg } },
        inactive = { c = { fg = colors.fg, bg = colors.bg } },
      },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      -- These will be filled later
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
    disabled_filetypes = {
      'neo-tree',
      'NvimTree',
    }
  }

  -- Inserts a component in lualine_c at left section
  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  -- Inserts a component in lualine_x at right section
  local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
  end

  -- ins_left {
  --   function()
  --     return '▊'
  --   end,
  --   color = { fg = '#ffaa00', bg = colors.bg3 },
  --   padding = { left = 0, right = 0 }, -- We don't need space before this
  -- }

  ins_left {
    'mode',
    color = function()
      -- auto change color according to neovims mode
      local mode_color = {
        n = colors.red,
        i = colors.green,
        v = colors.blue,
        V = colors.blue,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        [''] = colors.orange,
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.red,
        t = colors.cyan,
      }
      return { bg = mode_color[vim.fn.mode()], fg = colors.bg3, gui = "bold,italic" }
    end,
  }

  -- ins_left {
  --   -- filesize component
  --   'filesize',
  --   color = { fg = colors.fg1, bg = colors.bg2 },
  --   cond = conditions.buffer_not_empty,
  --   icon = "󰒋"
  -- }

  ins_left {
    'filename',
    path = 1,
    cond = conditions.buffer_not_empty,
    color = { fg = colors.peanut, bg = colors.bg1 },
  }

  ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
      color_error = { fg = colors.red, bg = colors.bg1 },
      color_warn = { fg = colors.yellow, bg = colors.bg1 },
      color_info = { fg = colors.blue, bg = colors.bg1 },
    },
  }

  ins_left {
    function()
      local branch = "Not initialized"
      if conditions.is_git_repo() == 1 then
        branch =
            vim.fn.systemlist('git rev-parse --abbrev-ref HEAD')[1]
        local break_point = 30

        local branch_len = string.len(branch)
        if branch_len > break_point then
          local start_branch = string.sub(branch, 1, 17)
          local end_branch = string.sub(branch, branch_len - 10, branch_len)

          branch = start_branch .. "..." .. end_branch
        end
      end

      return branch
    end,
    icons_enabled = true,
    icon = '',
    color = { fg = colors.blue, bg = colors.bg1 },
  }

  ins_left {
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
    diff_color = {
      added = { fg = colors.green, bg = colors.bg1 },
      modified = { fg = colors.orange, bg = colors.bg1 },
      removed = { fg = colors.red, bg = colors.bg1 },
    },
    cond = conditions.hide_in_width,
  }

  -- Insert mid section. You can make any number of sections in neovim :)
  -- for lualine it's any number greater then 2
  -- ins_left {
  --   function()
  --     return '%='
  --   end,
  -- }

  -- ins_left {
  ins_right {
    -- Lsp server name .
    function()
      local msg = 'no lsp'
      local buf_ft = ""
      local clients
      if vim.fn.has("wsl") == 1 then
        buf_ft = vim.bo.filetype;
        clients = vim.lsp.get_clients()
      else
        buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        clients = vim.lsp.get_active_clients()
      end

      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        ---@diagnostic disable-next-line: undefined-field
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end,
    -- icon = ' LSP:',
    icon = ' ',
    color = { gui = "italic", fg = colors.pink },
  }

  -- Add components to right sections
  ins_right {
    function()
      return utils.get_indentation_info()
    end,
    -- cond = conditions.hide_in_width() and conditions.buffer_not_empty(),
    color = { fg = colors.fg1, bg = colors.bg2 },
    icon = ""
  }

  ins_right {
    'location',
    color = { fg = colors.fg1, bg = colors.bg2 },
    cond = conditions.hide_in_width,
    icon = "",
  }

  ins_right {
    'progress',
    color = { fg = colors.fg1, bg = colors.bg2 },
  }

  ins_right {
    'o:encoding',       -- option component same as &encoding in viml
    fmt = string.lower, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.fg1, bg = colors.bg3 },
  }

  ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.fg1, bg = colors.bg3 },
  }

  ins_right {
    'filetype',
    fmt = string.lower,
    icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.fg1, bg = colors.bg2 },
  }

  -- ins_right {
  --   function()
  --     return '▊'
  --   end,
  --   color = { fg = '#ffaa00', bg = colors.bg3 },
  --   padding = { left = 1 },
  -- }

  -- Now don't forget to initialize lualine
  lualine.setup(config)
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    {
      {
        'nvim-tree/nvim-web-devicons',
        config = {
          require("nvim-web-devicons").setup({
            strict = true,
            override_by_extension = {
              plantuml = {
                icon = "󰈏",
                color = "#ba0d4d",
                name = "plantuml",
              },
              puml = {
                icon = "󰈏",
                color = "#ba0d4d",
                name = "puml",
              },
              astro = {
                icon = "",
                color = "#EF8547",
                name = "astro",
              },
            },
          })
        }
      }
    },
  },
  lazy = false,
  config = function()
    -- INFO: default

    -- local colors = {
    --   bg       = '#17191c',
    --   bg1      = '#202328',
    --   bg2      = '#22252a',
    --   bg3      = '#2d3239',
    --   fg       = '#bbc2cf',
    --   yellow   = '#ECBE7B',
    --   cyan     = '#008080',
    --   darkblue = '#081633',
    --   green    = '#98be65',
    --   orange   = '#FF8800',
    --   violet   = '#a9a1e1',
    --   magenta  = '#c678dd',
    --   blue     = '#51afef',
    --   red      = '#ec5f67',
    --   peanut   = "#f6d5a4",
    -- }

    -- INFO: catppuccin

    local catppuccin_theme = require("catppuccin.palettes").get_palette "mocha"
    local colors = {
      bg      = catppuccin_theme.mantle,
      bg1     = catppuccin_theme.mantle,
      bg2     = catppuccin_theme.mantle,
      bg3     = catppuccin_theme.mantle,
      fg      = catppuccin_theme.text,
      fg1     = catppuccin_theme.subtext0,
      yellow  = catppuccin_theme.yellow,
      cyan    = catppuccin_theme.teal,
      green   = catppuccin_theme.green,
      orange  = catppuccin_theme.peach,
      violet  = catppuccin_theme.lavender,
      magenta = catppuccin_theme.mauve,
      blue    = catppuccin_theme.blue,
      red     = catppuccin_theme.red,
      peanut  = catppuccin_theme.rosewater,
      pink    = catppuccin_theme.pink
    }

    -- INFO: nightfly
    --
    -- local colors = {
    --   bg       = '#011627',
    --   bg1      = '#011627',
    --   bg2      = '#021F37',
    --   bg3      = '#032847',
    --   fg       = '#bdc1c6',
    --   yellow   = '#F5DC77',
    --   cyan     = '#7fdbca',
    --   green    = '#a1cd5e',
    --   orange   = '#E58027',
    --   violet   = '#c792ea',
    --   magenta  = '#ae81ff',
    --   blue     = '#82aaff',
    --   red      = '#fc514e',
    --   peanut   = "#F9D099",
    -- }

    -- -- INFO: grubvox
    --
    -- -- local colors = {
    -- --   bg       = '#282828',
    -- --   bg1      = '#282828',
    -- --   bg2      = '#3c3836',
    -- --   bg3      = '#504945',
    -- --   fg       = '#ebdbb2',
    -- --   yellow   = '#fabd2f',
    -- --   cyan     = '#8ec07c',
    -- --   green    = '#b8bb26',
    -- --   orange   = '#fe8019',
    -- --   violet   = '#d3869b',
    -- --   magenta  = '#b16286',
    -- --   blue     = '#53ACB0',
    -- --   red      = '#fb4934',
    -- --   -- red      = '#cc241d',
    -- --   peanut   = "#F8BE4E",
    -- -- }
    --
    -- --INFO: cyberdream
    --
    -- -- local colors = {
    -- --   bg = "#16181a",
    -- --   bg1 = "#1e2124",
    -- --   bg2 = "#292b30",
    -- --   bg3 = "#3c4048",
    -- --   fg = "#ffffff",
    -- --   grey = "#7b8496",
    -- --   blue = "#5ea1ff",
    -- --   green = "#5eff6c",
    -- --   cyan = "#5ef1ff",
    -- --   red = "#ff6e5e",
    -- --   yellow = "#f1ff5e",
    -- --   magenta = "#ff5ef1",
    -- --   pink = "#ff5ea0",
    -- --   orange = "#ffbd5e",
    -- --   purple = "#bd5eff",
    -- -- }

    config_custom(colors)
  end
}
