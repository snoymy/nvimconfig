require("core.keymap.helper")

nnoremap("gt", ":bnext<CR>", {silent = true})
nnoremap("gT", ":bprev<CR>", {silent = true})
nnoremap("<F6>", ":call BufferWindowToggle()<CR>", {silent = true})
nnoremap("<F7>", ":MundoToggle<CR>")
nnoremap("<leader>e", ":NvimTreeToggle<CR>", {silent = true})

local builtin = require('telescope.builtin')
nnoremap('<leader>ff', builtin.find_files)
nnoremap('<leader>fg', builtin.live_grep)
nnoremap('<leader>fb', builtin.buffers)
nnoremap('<leader>fh', builtin.help_tags)

nnoremap("gh", vim.lsp.buf.hover)
nnoremap("gd", vim.lsp.buf.definition)
nnoremap("td", vim.lsp.buf.type_definition)
nnoremap("gi", vim.lsp.buf.implementation)
nnoremap("<leader>rn", vim.lsp.buf.rename)
