return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-lint",
    "onsails/lspkind-nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp"
    },
  },
  config = function()
    local luasnip = require("luasnip")
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local cmp_kinds = {
      Text = '  ',
      Method = '  ',
      Function = ' 󰊕 ',
      Constructor = '  ',
      Field = '  ',
      Variable = '  ',
      Class = '  ',
      Interface = '  ',
      Module = '  ',
      Property = '  ',
      Unit = '  ',
      Value = '  ',
      Enum = '  ',
      Keyword = '  ',
      Snippet = '  ',
      Color = '  ',
      File = '  ',
      Reference = '  ',
      Folder = '  ',
      EnumMember = '  ',
      Constant = '  ',
      Struct = '  ',
      Event = '  ',
      Operator = '  ',
      TypeParameter = '  ',
    }

    local max_item_count = 5

    cmp.setup({
      ---@diagnostic disable-next-line: missing-fields
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(_, item)
          item.menu = '     (' .. string.lower(item.kind) .. ')'
          item.kind = cmp_kinds[item.kind] or ''
          return item
        end,
      },
      window = {
        completion = {
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          scrollbar = false,
          col_offset = 1,
          side_padding = 0,
          max_height = 12,
        },
        documentation = {
          winhighlight = "Normal:CmpDoc,FloatBorder:CmpDoc,Search:None",
          max_width = 80,
          max_height = 12,
        },
      },
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end,
        ["<S-Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end,
      },
      sources = {
        { name = "nvim_lsp", max_item_count = max_item_count },
        { name = "luasnip",  max_item_count = max_item_count },
        { name = "neorg",    max_item_count = max_item_count },
        { name = "crates",   max_item_count = max_item_count },
        -- { name = "codeium" }
      },
    })
  end
}
