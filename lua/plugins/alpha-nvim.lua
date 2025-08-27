return {
  {
    'https://github.com/goolord/alpha-nvim.git',
    config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')

      dashboard.section.header.val = {
        -- Aquí podrías poner el bigote en ASCII si lo tienes
        -- O si es un icono de Nerd Font, lo agregas acá
        '                                         ',
        ' ██╗    ██╗██╗ ██████╗██╗  ██╗ ██████╗   ',
        ' ██║    ██║██║██╔════╝██║  ██║██╔═══██╗  ',
        ' ██║ █╗ ██║██║██║     ███████║██║   ██║  ',
        ' ██║███╗██║██║██║     ██╔══██║██║   ██║  ',
        ' ╚███╔███╔╝██║╚██████╗██║  ██║╚██████╔╝  ',
        '  ╚══╝╚══╝ ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝   ',
        '                                         ',
        '        -- Ricardo Hernández --          ',
      }


      dashboard.section.buttons.val = {
        dashboard.button('f', ' ' .. ' Find File', ':Telescope find_files <CR>'),
        dashboard.button('n', ' ' .. ' New File', ':ene <bar> startinsert <CR>'),
        dashboard.button('p', ' ' .. ' Find Project', ':Telescope projects <CR>'),
        dashboard.button('s', '󰋋 ' .. ' Restore Session', ':lua require("persistence").load() <CR>'),
        dashboard.button('l', ' ' .. ' Open Lazy', ':Lazy <CR>'),
        dashboard.button('q', '󰅙 ' .. ' Quit Neovim', ':qa<CR>'),
      }

      alpha.setup(dashboard.config)
    end
  },
}
