local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "simnalamburt/vim-mundo",
    "yuttie/comfortable-motion.vim",
    {"ap/vim-buftabline", enabled=false},
    "snoymy/buffer-window",
    'ziglang/zig.vim',
    { 'dstein64/nvim-scrollview', branch = 'main', },
    require("plugins.lualine"),
    require("plugins.telescope"),
    require("plugins.colorscheme"),
    require("plugins.markdown-preview"),
    require("plugins.lsp"),
    require("plugins.nvim-tree"),
    require("plugins.nvim-treesitter"),
    require("plugins.nvim-ts-autotag"),
    require("plugins.bufferline"),
    require("plugins.barbecue"),
})
