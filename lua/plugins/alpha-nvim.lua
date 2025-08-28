return {
  {
    'https://github.com/goolord/alpha-nvim.git',
    config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')

      dashboard.section.header.val = {
        '                                         ',
        ' ██╗    ██╗██╗ ██████╗██╗  ██╗ ██████╗   ',
        ' ██║    ██║██║██╔════╝██║  ██║██╔═══██╗  ',
        ' ██║ █╗ ██║██║██║     ███████║██║   ██║  ',
        ' ██║███╗██║██║██║     ██╔══██║██║   ██║  ',
        ' ╚███╔███╔╝██║╚██████╗██║  ██║╚██████╔╝  ',
        '  ╚══╝╚══╝ ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝   ',
        '                                         ',
      }

      dashboard.section.buttons.val = {
        dashboard.button('f', ' ' .. ' Find File', ':Telescope find_files <CR>'),
        dashboard.button('n', ' ' .. ' New File', ':ene <bar> startinsert <CR>'),
        dashboard.button('m', ' ' .. ' Modified Files', ':lua OpenModifiedFiles()<CR>'),
        dashboard.button('l', ' ' .. ' Open Lazy', ':Lazy <CR>'),
        dashboard.button('q', '󰅙 ' .. ' Quit Neovim', ':qa<CR>'),
      }

      -- Función para abrir los archivos modificados en buffer
      function OpenModifiedFiles()
        local handle = io.popen('git ls-files -m')
        if handle then
          local result = handle:read('*a')
          handle:close()
          for file in result:gmatch('[^\r\n]+') do
            vim.cmd('edit ' .. file)
          end
        else
          print('Git not found or no modified files')
        end
      end

      -- Footer
      -- Fn: Muestra los archivos modificados en el footer
      -- Requiere que git esté instalado y que el directorio sea un repositorio git
      local function footer()
        local handle = io.popen('git ls-files -m')
        if handle then
          local result = handle:read('*a')
          handle:close()
          local modified_files = {}
          for file in result:gmatch('[^\r\n]+') do
            table.insert(modified_files, file)
          end
          if #modified_files > 0 then
            -- return 'Modified files: ' .. table.concat(modified_files, ', ')
            return 'Modified files:\n' .. table.concat(modified_files, '\n')
          else
            return 'No modified files'
          end
        else
          return 'Git not found or no modified files'
        end
      end

      dashboard.section.footer.val = footer()

      alpha.setup(dashboard.config)
    end
  },
}
