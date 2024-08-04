--------------------------
-- Gruvbox Theme
--------------------------
require("gruvbox").setup({
	palette_overrides = {
		dark0 = "#181818",
		dark1 = "#202020",
		dark2 = "#282828",
		dark3 = "#383838",
		dark4 = "#484848",
	}
})
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

--------------------------
-- Airline theme
--------------------------
vim.g.airline_theme = "base16_black_metal_mayhem"
