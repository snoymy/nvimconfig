return {
    "akinsho/bufferline.nvim",
    config = function()
        require("bufferline").setup({
            options = {
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "",
                        text_align = "left",
                        separator = true,
                    },
                },
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(_, level)
                    local icon = level:match("error") and " " or ""
                    return ""..icon
                end,
                separator_style = "slant",
            },
            highlights = {
                fill = {
                    bg = "#202024",
                },
                separator_visible = {
                    fg = "#202024",
                },
                separator_selected = {
                    fg = "#202024",
                },
                separator = {
                    fg = "#202024",
                },
            },
        })
    end
}
