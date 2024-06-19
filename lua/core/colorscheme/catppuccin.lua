require("catppuccin").setup {
  color_overrides = {
      mocha = {
          -- base = "#17171a",
          base = "#17171a",
          -- mantle = "#1b1b1e",
          mantle = "#232327",
          crust = "#000000",
      },
  },
}
vim.cmd.colorscheme("catppuccin-mocha")
