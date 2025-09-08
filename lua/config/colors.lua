-- Paleta de colores Kanagawa Dragon
-- Fondo: #181616 (DragonBlack)
-- Texto normal: #c5c9c5 (FujiWhite)
-- Rojo: #c34043 (AutumnRed)
-- Verde: #76946a (SpringGreen)
-- Azul: #7e9cd8 (WaveBlue)
-- Amarillo: #dca561 (GoldenYellow)
-- Magenta: #957fb8 (SakuraPink)
-- Cian: #6a9589 (DragonBlue)
-- Gris oscuro: #223249 (WaveBlue2)
-- Gris claro: #727169 (OldWhite)

local bg_color = "#181616"

--WhichKey
vim.api.nvim_set_hl(0, "WhichKeyNormal", { fg = "#c5c9c5", bg = bg_color })
vim.api.nvim_set_hl(0, "WhichKeyGroup", { fg = "#6a9589", bold = true }) -- Group names (cyan)
vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = "#c5c9c5" }) -- Description text (white)
vim.api.nvim_set_hl(0, "WhichKeySeperator", { fg = "#c5c9c5" }) -- Separator (white)
vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = bg_color })
vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = bg_color, bg = bg_color })
vim.api.nvim_set_hl(0, "WhichKeyTitle", { fg = "#76946a", bg = bg_color, bold = true })


