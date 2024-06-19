local function tab_select_next()
    local luasnip = require("luasnip")
    local cmp = require("cmp")

    return cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        -- elseif luasnip.locally_jumpable(1) then
        --     luasnip.jump(1)
        else
            fallback()
        end
    end
    , { "i", "s" })
end

local function tab_select_prev()
    local luasnip = require("luasnip")
    local cmp = require("cmp")

    return cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        -- elseif luasnip.locally_jumpable(-1) then
        --     luasnip.jump(-1)
        else
            fallback()
        end
    end
    , { "i", "s" })
end

local function enter_select_confirm()
    local luasnip = require("luasnip")
    local cmp = require("cmp")

    return cmp.mapping(function(fallback)
        if cmp.visible() then
            -- if luasnip.expandable() then
            --     luasnip.expand()
            -- else
            local entry = cmp.get_selected_entry()
            if not entry then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            end
            cmp.confirm({ select = true, })
            local CTRLg_u = vim.api.nvim_replace_termcodes('<C-g>u', true, true, true)
            vim.api.nvim_feedkeys(CTRLg_u, 'n', true)
            -- vim.api.nvim_feedkeys("<c-g>u", "i", {})
            --end
        else
            fallback()
        end
    end)
end


return {
    "williamboman/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "rafamadriz/friendly-snippets",
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            local mason = require("mason")
            mason.setup()
            mason_lspconfig.setup()
            mason_lspconfig.setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = require('cmp_nvim_lsp').default_capabilities(),
                    })
                end,
            })
        end
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
    {
        "snoymy/nvim-cmp",
        branch = "hot-fix-insert-mode-feedkey",
        config = function()
            local luasnip = require("luasnip")
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                preselect = cmp.PreselectMode.None,
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = enter_select_confirm(),
                    ["<Tab>"] = tab_select_next(),
                    ["<S-Tab>"] = tab_select_prev(),
                }),
                sources = cmp.config.sources(
                    {{ name = 'nvim_lsp' },},
                    {{ name = 'luasnip' },},
                    {{ name = 'buffer' },})

            })
        end,
    },
}
