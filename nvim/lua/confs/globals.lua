---@diagnostic disable: undefined-global
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.opt.showmatch = true  -- show machine
vim.opt.ignorecase = true -- case insensitive
vim.opt.hlsearch = true   -- highlight search
vim.opt.smartcase = true
vim.opt.incsearch = true  -- incremental search
vim.opt.tabstop = 2       -- number of columns occupied by a tab
vim.opt.softtabstop = 2   -- see multiple spaces as tab stops so <BS> does the right thing
vim.opt.expandtab = true  -- converts tabs to white space
vim.opt.shiftwidth = 2    -- width for auto indents
vim.opt.autoindent = true -- indent a new line the same amount as the line just typed
vim.opt.number = true     -- add line numbers
vim.opt.relativenumber = true
---@diagnostic disable-next-line: param-type-mismatch
vim.opt.fillchars:append({ eob = " " })
vim.cmd([[
  set nobackup
  set nowritebackup
  set nocompatible
  filetype plugin indent on
  " syntax on
  set nowrap
  set sidescroll=1
  set sidescrolloff=10
]])
vim.opt.cc = '100'                -- vim.opt.an 100 column border for good coding style
vim.opt.mouse = ''                -- enable mouse click
vim.opt.clipboard = 'unnamedplus' -- using system clipboard
vim.opt.cursorline = true         -- highlight current cursorline
vim.g.gitblame_date_format = '%r'
vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.vista_renderer_enable_icon = 1
vim.g.vista_icon_indent = { "╰─▸ ", "├─▸ " }
vim.opt.termguicolors = true
vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark
vim.opt.signcolumn = "yes"  -- show sign column so that text doesn't shift
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.fn.has("wsl") == 1 then
  if vim.fn.executable("wl-copy") == 0 then
    print("wl-clipboard not found, clipboard integration won't work")
  else
    vim.g.clipboard = {
      name = "wl-clipboard (wsl)",
      copy = {
        ["+"] = 'wl-copy --foreground --type text/plain',
        ["*"] = 'wl-copy --foreground --primary --type text/plain',
      },
      paste = {
        ["+"] = (function()
          return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', { '' }, 1) -- '1' keeps empty lines
        end),
        ["*"] = (function()
          return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', { '' }, 1)
        end),
      },
      cache_enabled = true
    }
  end
end
