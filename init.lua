local o = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = ","

require("config.plugins")

vim.cmd.colorscheme("carbonfox")
vim.api.nvim_set_hl(0, "Normal", { bg = "black" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "black" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "black" })
-- cmp

o.number = true
o.cursorline = true
o.wrap = false
o.scrolloff = 6
o.sidescrolloff = 8

o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.smartindent = true
o.autoindent = true

o.showtabline = 1
o.tabline = ""

o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true

o.splitbelow = true
o.splitright = true

o.encoding = "UTF-8"
o.termguicolors = true
o.completeopt = "menuone,noinsert,noselect"
o.omnifunc = "v:lua.vim.lsp.omnifunc"
o.showmatch = true
o.pumheight = 10
o.pumblend = 10
o.winblend = 0

local map = vim.keymap.set

map("n", "-", ":Ex<CR>")
map("n", "<leader>s", ":update<CR> :source<CR>")

map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show LSP diagnostic" })

map("n", "<leader>pa", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("file:", path)
end)
