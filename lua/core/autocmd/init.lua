vim.api.nvim_create_autocmd({"BufWinEnter", "WinEnter", "TermOpen"}, {
    pattern = "term://*",
    command = "startinsert",
})

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    command = [[ if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"zz" | endif ]],
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = {"*.js", "*.ts", "*.html"},
    callback = function(args)
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
    end
})

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})

-- vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
--     callback = function()
--         vim.opt.cmdheight = 1
--     end,
-- })
-- vim.api.nvim_create_autocmd({ "CmdlineLeave" }, {
--     callback = function()
--         vim.opt.cmdheight = 0
--     end,
-- })
