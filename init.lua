local opt = vim.opt
local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleaderleader = " "

opt.undofile = true
opt.autoread = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.number = true
opt.relativenumber = true
opt.scrolloff = 6
opt.wrap = false
opt.termguicolors = true
opt.winborder = "rounded"
opt.signcolumn = "yes"

-- plugins
vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin"},
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/echasnovski/mini.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/j-hui/fidget.nvim" },
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
})
require 'mason'.setup()
require 'fidget'.setup({})
require 'mini.pick'.setup()
require 'mini.bufremove'.setup()

-- colorscheme
vim.cmd.colorscheme "catppuccin-frappe"

-- LSP
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})

vim.lsp.enable({
    "lua_ls",
    "clangd",
    "tinymist",
    "rust_analyzer",
})
vim.cmd([[set completeopt+=menuone,noselect,popup]])

-- clipboard
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>d", '"+d')
map("n", "<leader>p", '"+p')
map("v", "<leader>p", '"+P')

-- remove all highlighting
map("n", "<Esc>", ":noh<cr>", { silent = true })

-- other Mappings
map("n", "<leader>l", vim.lsp.buf.format, { desc = "Format buffer" })

map("n", "<leader>c", require("mini.bufremove").delete, { desc = "Close buffer" })
map("n", "<C-f>", "<Cmd>Open .<CR>")

map("n", "<leader>g", "<Cmd>Pick grep_live<CR>")
map("n", "<leader>f", "<Cmd>Pick files<CR>")
map("n", "<leader>b", "<Cmd>Pick buffers<CR>")

map("n", "<leader>h", "<Cmd>Pick help<CR>")
