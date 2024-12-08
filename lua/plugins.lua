-- This file can be loaded by calling `lua require('plugins')` from your
-- init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Lsp config plugin
    use({ "neovim/nvim-lspconfig" })

    -- Manage lsp servers, linters, and formatters
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })

    -- Auto completion
    use({ "hrsh7th/nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lsp" })

    -- Kanagawa theme
    use({ "rebelot/kanagawa.nvim"})

    -- Vim airline plugin
    use({ "vim-airline/vim-airline" })
    use({ "vim-airline/vim-airline-themes" })

    -- Git plugins
    use({ "tpope/vim-fugitive" })
    use({ "tpope/vim-rhubarb" })
    use({ "shumphrey/fugitive-gitlab.vim" })
end)
