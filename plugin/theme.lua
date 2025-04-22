local colors = {
    black    = '#1a1826',
    primary  = "#44376a",
    darkgray = '#11101a',
    white    = "#dcd7ba",
}

--------------------------
-- Kanagawa Theme
--------------------------
require('kanagawa').setup({
    colors = {
        palette = {
            sumiInk3 = colors.darkgray,
            sumiInk4 = colors.black,
        },
    },

})

vim.cmd("colorscheme kanagawa")
---------------------------
--- Lualine status bar
---------------------------
local lualine_theme = {
    normal = {
        a = { bg = colors.primary, fg = colors.white },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.white }
    },
    insert = {
        a = { bg = colors.primary, fg = colors.white },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.white }
    },
    visual = {
        a = { bg = colors.primary, fg = colors.white },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.drakgray, fg = colors.white }
    },
    replace = {
        a = { bg = colors.primary, fg = colors.white },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.white }
    },
    command = {
        a = { bg = colors.primary, fg = colors.white },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.white }
    },
    inactive = {
        a = { bg = colors.darkgray, fg = colors.primary },
        b = { bg = colors.darkgray, fg = colors.primary },
        c = { bg = colors.darkgray, fg = colors.primary }
    }
}

require('lualine').setup({
    options = {
        icons_enabled = false,
        theme = lualine_theme,
    }
})
