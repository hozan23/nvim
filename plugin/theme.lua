--------------------------
-- Kanagawa Theme
--------------------------
require('kanagawa').setup({
    colors = {
        palette = {
            sumiInk3 = "#11101a",
            sumiInk4 = "#1a1826",
        },
    },

})

vim.cmd("colorscheme kanagawa")

---------------------------
--- Airline theme
---------------------------
vim.g.airline_theme = "zenburn"
