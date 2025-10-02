-- cmp is a "completion engine" plugin. 
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
        window = {
          completion = cmp.config.window.bordered({
            border = "none",
            winhighlight = "Normal:Pmenu,FloatBorder:PmenyBorder,CursorLine:PmenuSel,Search:None",
            col_offset = 0,
            row_offset = 1,
          }),
          documentation = cmp.config.window.bordered({ border = "none" }),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        }),

	      view = { entries = "custom" },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        })
      })
    end
  },

  {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    config = function()
      local luasnip = require("luasnip")

      local s = luasnip.snippet
      local t = luasnip.text_node
      local i = luasnip.insert_node

      local extras = require("luasnip.extras")
      local rep = extras.rep

      luasnip.add_snippets("tex", {
        s("beg", {
          t("\\begin{"), i(1), t("}"),
          t({"", "\t"}), i(0),
          t({"", "\\end{"}), rep(1), t("}"),
        })
      })

      luasnip.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
      }
    end
  },
}
