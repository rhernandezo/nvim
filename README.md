# nvim


## Plugins
- alpha-nvim
- copilot.vim
- gitsigns.nvim
- kanagawa.nvim
- lazy.vim
- mini.icons
- nvim-treesitter
- oil.nvim
- plenary.nvim
- markdown.nvim
- smear-cursor.nvim
- telescope.nvim
- vim-sleuth
- which-key.nvim

Necesita [ripgrep](https://github.com/BurntSushi/ripgrep) para buscar en los archivos.


## Resumen de los keymaps creados:

### 🚀 Keymaps principales (prefijo `<leader>cc`):
- `<leader>ccc` - Abrir chat de Copilot
- `<leader>cce` - Explicar código seleccionado/actual
- `<leader>cct` - Generar tests
- `<leader>ccr` - Revisar código
- `<leader>ccR` - Refactorizar código
- `<leader>ccn` - Sugerir mejores nombres
- `<leader>ccd` - Generar documentación
- `<leader>ccf` - Arreglar diagnósticos
- `<leader>cco` - Optimizar código

### 🎮 Keymaps de gestión:
- `<leader>cq` - Chat rápido con prompt
- `<leader>ch` - Toggle del chat
- `<leader>cx` - Cerrar chat
- `<leader>cr` - Reset del chat

### 📝 Keymaps de Git:
- `<leader>ccm` - Generar mensaje de commit
- `<leader>ccM` - Generar mensaje para staged changes

### ⚡ Keymaps simplificados (prefijo `<leader>a`):
- `<leader>ai` - Pregunta rápida con contexto del buffer
- `<leader>ae` - Explicar código
- `<leader>af` - Arreglar código
- `<leader>ao` - Optimizar código
- `<leader>ad` - Generar documentación
- `<leader>at` - Generar tests
- `<leader>ac` - Toggle chat (normal) / Chat con selección (visual)
- `<leader>aw` - Menú interactivo de acciones

### 🔥 Keymap súper rápido:
- `<Ctrl-c>` - Chat instantáneo desde cualquier lugar

### 🎯 Características especiales:
- **Modo visual**: Todos los comandos funcionan con texto seleccionado
- **Chat inline**: Ventana flotante para consultas rápidas
- **Prompts en español**: Headers configurados en español
- **Menú interactivo**: `<leader>aw` te da un menú de acciones
- **Contexto automático**: Usa el buffer actual como contexto por defecto

### 💡 Cómo usar:
1. **Para explicar código**: Selecciona el código y presiona `<leader>ae`
2. **Para chat rápido**: Presiona `<Ctrl-c>` desde cualquier lugar
3. **Para menú de opciones**: Presiona `<leader>aw`
4. **Para toggle del chat**: Presiona `<leader>ac` en modo normal


