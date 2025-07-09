vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.smartindent = true

vim.opt.swapfile = false

vim.opt.scrolloff = 4

vim.opt.path:append("**")
vim.opt.wildignore:append({ "**/node_modules/**", "**/.git/**" })
