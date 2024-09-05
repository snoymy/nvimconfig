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

vim.diagnostic.config({
  float = {
    source = 'always',
    border = 'rounded'
  },
})

vim.api.nvim_create_user_command(
  'InlineSearch',
  function(opts)
    -- Get the current line and cursor position
    local line = vim.api.nvim_get_current_line()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local start_pos = cursor_pos[2] + 1 -- Current cursor column (1-based indexing)

    -- Find the position of the search word in the current line
    local search_word = opts.args
    local found_pos = string.find(line, search_word, 0)
    local found_pos_cursor_relative = string.find(line, search_word, start_pos)

    if found_pos_cursor_relative then
      vim.api.nvim_win_set_cursor(0, {cursor_pos[1], found_pos_cursor_relative - 1})
      vim.fn.setreg('/', '\\%' .. cursor_pos[1] .. 'l' .. search_word)
      vim.cmd('set hlsearch')
    elseif found_pos then
      vim.api.nvim_win_set_cursor(0, {cursor_pos[1], found_pos - 1})
      vim.fn.setreg('/', '\\%' .. cursor_pos[1] .. 'l' .. search_word)
      vim.cmd('set hlsearch')
    else
      print("Word not found")
    end
  end,
  {
    nargs = 1, -- Expect exactly one argument (the search word)
    desc = "Inline search for a word in the current line"
  }
)
