local function config_custom(colors)
  -- Eviline config for lualine
  -- Author: shadmansaleh
  -- Credit: glepnir
  local lualine = require('lualine')

  -- Color table for highlights
  -- stylua: ignore

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

  ins_left {
    function()
      return '▊'
    end,
    color = { fg = '#ffaa00', bg = colors.bg3 },
    padding = { left = 0, right = 0 }, -- We don't need space before this
  }

  ins_left {
    -- mode component
    function()
      return '  '
    end,
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
        t = colors.red,
      }
      return { fg = mode_color[vim.fn.mode()], bg = colors.bg3 }
    end,
  }

  ins_left {
    -- filesize component
    'filesize',
    color = { fg = colors.blue, bg = colors.bg2 },
    cond = conditions.buffer_not_empty,
    icon = "󰒋"
  }

  ins_left {
    'location', color = { fg = colors.fg, gui = 'italic', bg = colors.bg2 },
    icon = ""
  }

  ins_left {
    'progress', color = { fg = colors.fg, gui = 'italic', bg = colors.bg2 },
    -- icon = "󰔟"
  }

  ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.orange, gui = 'bold', bg = colors.bg1 },
  }

  ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
      color_error = { fg = colors.red, gui = "bold", bg = colors.bg1 },
      color_warn = { fg = colors.yellow, gui = "bold", bg = colors.bg1 },
      color_info = { fg = colors.cyan, gui = "italic", bg = colors.bg1 },
    },
  }

  -- Insert mid section. You can make any number of sections in neovim :)
  -- for lualine it's any number greater then 2
  ins_left {
    function()
      return '%='
    end,
  }

  ins_left {
    -- Lsp server name .
    function()
      local msg = 'No Active Lsp'
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end,
    -- icon = ' LSP:',
    icon = '󰌘 lsp:',
    color = { fg = colors.peanut, gui = 'bold' },
  }

  -- Add components to right sections
  ins_right {
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

  ins_right {
    'branch',
    icons_enabled = true,
    icon = '',
    color = { gui = 'bold', fg = colors.red, bg = colors.bg1 },
  }

  ins_right {
    'filetype',
    fmt = string.lower,
    icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { gui = 'bold', bg = colors.bg2 },
  }

  ins_right {
    'o:encoding',       -- option component same as &encoding in viml
    fmt = string.lower, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.cyan, gui = 'italic', bg = colors.bg3 },
  }

  ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.cyan, gui = 'bold', bg = colors.bg3 },
  }

  ins_right {
    function()
      return '▊'
    end,
    color = { fg = '#ffaa00', bg = colors.bg3 },
    padding = { left = 1 },
  }

  -- Now don't forget to initialize lualine
  lualine.setup(config)
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    {
      'nvim-tree/nvim-web-devicons',
      -- 'meuter/lualine-so-fancy.nvim'
    },
  },
  lazy = false,
  config = function()
    local colors = {
      bg       = '#17191c',
      bg1      = '#202328',
      bg2      = '#22252a',
      bg3      = '#2d3239',
      fg       = '#bbc2cf',
      yellow   = '#ECBE7B',
      cyan     = '#008080',
      darkblue = '#081633',
      green    = '#98be65',
      orange   = '#FF8800',
      violet   = '#a9a1e1',
      magenta  = '#c678dd',
      blue     = '#51afef',
      red      = '#ec5f67',
      peanut   = "#f6d5a4",
    }

    local colors_nightfly = {
      bg       = '#011627',
      bg1      = '#011627',
      bg2      = '#021F37',
      bg3      = '#032847',
      fg       = '#bdc1c6',
      yellow   = '#F5DC77',
      cyan     = '#7fdbca',
      darkblue = '#1d3b53',
      green    = '#a1cd5e',
      orange   = '#E58027',
      violet   = '#c792ea',
      magenta  = '#ae81ff',
      blue     = '#82aaff',
      red      = '#fc514e',
      peanut   = "#F9D099",
    }

    local colors_grubvox = {
      bg       = '#282828',
      bg1      = '#282828',
      bg2      = '#3c3836',
      bg3      = '#504945',
      fg       = '#ebdbb2',
      yellow   = '#fabd2f',
      cyan     = '#8ec07c',
      darkblue = '#1A5764',
      green    = '#b8bb26',
      orange   = '#fe8019',
      violet   = '#d3869b',
      magenta  = '#b16286',
      blue     = '#53ACB0',
      red      = '#fb4934',
      -- red      = '#cc241d',
      peanut   = "#F8BE4E",

    }

    config_custom(colors_grubvox)
  end
}
