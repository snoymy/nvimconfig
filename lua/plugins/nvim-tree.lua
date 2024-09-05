-- function NvimTreeTrash()
--     local lib = require('nvim-tree.lib')
--     local node = lib.get_node_at_cursor()
--     local trash_cmd = "trash "
-- 
--     local function get_user_input_char()
--         local c = vim.fn.getchar()
--         return vim.fn.nr2char(c)
--     end
-- 
--     print("Trash "..node.name.." ? y/n")
-- 
--     if (get_user_input_char():match('^y') and node) then
--         vim.fn.jobstart(trash_cmd .. node.absolute_path, {
--             detach = true,
--             on_exit = function (job_id, data, event) lib.refresh_tree() end,
--         })
--     end
-- 
--     vim.api.nvim_command('normal :esc<CR>')
-- end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        adaptive_size = true,
      },
      renderer = {
        group_empty = true,
      },
    })

    -- vim.g.nvim_tree_bindings = { { key = "d", cb = ":lua NvimTreeTrash()<CR>" }, }
  end,
}
