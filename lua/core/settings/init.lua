vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.wrap = false
vim.opt.showbreak = '↪'
vim.opt.cmdheight = 1
vim.opt.updatetime = 300
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.nvim/undo')
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.virtualedit = "block"
-- vim.opt.iskeyword:remove{"_"}
vim.opt.autoread = true
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true
vim.opt.scrolloff = 8
-- vim.g.mapleader = " "
vim.g.mkdp_refresh_slow = 1

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = {"*.js", "*.ts", "*.html"},
    callback = function(args)
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
    end
})
