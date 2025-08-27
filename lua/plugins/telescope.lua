return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require("telescope").setup({
            -- Pones las opciones globales acá, dentro de "defaults"
            defaults = {
                -- Ignora archivos y carpetas que empiezan con un punto
                hidden = true,
                -- Ignora carpetas y archivos específicos
                file_ignore_patterns = {
                    "node_modules",
                    "vendor",
                    "%.git/",
                    "%.cache/",
                    "%.zip",
                    "%.rar",
                }
            },
        })
    end
}
