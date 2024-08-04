local lspconfig = require("lspconfig")

--------------------------
-- LSP keybindings
--------------------------
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
        end, opts)

        vim.keymap.set("n", "]e", function()
            vim.diagnostic.goto_next()
        end, opts)

        vim.keymap.set("n", "[e", function()
            vim.diagnostic.goto_prev()
        end, opts)

        vim.keymap.set({ "n", "x" }, "<C-i>",
            "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
            opts)
    end,
})

--------------------------
-- Auto completion setup
--------------------------
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local default_setup = function(server)
    lspconfig[server].setup({ capabilities = lsp_capabilities })
end

local cmp = require("cmp")
cmp.setup({
    sources = {
        { name = "nvim_lsp" },
    },
    mapping = cmp.mapping.preset.insert({
        -- Enter key confirms completion item
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        -- Ctrl + space triggers completion menu
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
        completion = {
            winhighlight = "Normal:CmpNormal",
        },
        documentation = {
            winhighlight = "Normal:CmpDocNormal",
        },
    },
})

--------------------------
-- Setup mason
--------------------------
require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "gopls",
        "ruff_lsp",
        "tsserver",
        "clangd",
        "taplo",
        "bashls",
        "yamlls",
        "dockerls",
        "texlab",
        "cssls",
        "html",
    },
    handlers = {
        default_setup,
    },
})

-- Disable the annoying warning "undefined vim"
lspconfig.lua_ls.setup({
    capabilities = lsp_capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
        },
    },
})

-- rust_analyzer setup
lspconfig.rust_analyzer.setup({
    -- Server-specific settings. See `:help lspconfig-setup`
    -- settings = {
    -- 	["rust-analyzer"] = {
    -- 		cargo = {
    -- 			allFeatures = true,
    -- 		},
    -- 	},
    -- },
})

-- dartls setup
lspconfig.dartls.setup({})
