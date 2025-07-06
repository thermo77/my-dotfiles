-- general vim options

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
-- vim.opt.scrolloff = 999
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.g.mapleader = " "

-- config diagnostic plugin

vim.diagnostic.config({
    virtual_text = {
        severity = vim.diagnostic.severity.ERROR,
        source = "always", 
        spacing = 2,
        prefix = "<-", 
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    float = {
        source = "always",
    },
})
