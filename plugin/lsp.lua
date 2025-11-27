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
            vim.diagnostic.jump({ count = 1, float = true })
        end, opts)

        vim.keymap.set("n", "[e", function()
            vim.diagnostic.jump({ count = -1, float = true })
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
    vim.lsp.config[server].settings({ capabilities = lsp_capabilities })
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
        "pylsp",
        "ts_ls",
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
vim.lsp.config('lua_ls', {
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

vim.lsp.config('yamlls', {
    settings = {
        ["yaml"] = {
            format = {
                enable = true,
            }
        }
    }
})

-- dartls setup
vim.lsp.enable("dartls")

-- vim.lsp.config.dartls = {
--     cmd = { "dart", "language-server", "--protocol=lsp" },
-- }
