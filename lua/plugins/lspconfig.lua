local servers = {
  "lua_ls",
  "bashls",
  "pyright",
  "clangd",
  "gopls",
  "texlab",
  "jdtls",
  "html",
  "cssls"
}

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      --local on_attach = function(client, bufnr)
      --
      --end

      vim.lsp.config("*", {
      --  on_attach = on_attach,
        capabilities = capabilities,
      })

    end
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
          "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = true,
      })
    end,
  },

  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
}
