# OneDark

A dark Neovim theme written in Lua. Includes extra themes for Kitty and Alacritty

<img width="1680" alt="Screen Shot 2021-05-23 at 3 48 41 PM" src="https://user-images.githubusercontent.com/8846086/119279210-16d39c00-bbdf-11eb-8604-b7258c8ff72e.png">

<img width="1680" alt="Screen Shot 2021-05-23 at 2 51 04 PM" src="https://user-images.githubusercontent.com/8846086/119279233-32d73d80-bbdf-11eb-8bad-34c92cb48ab2.png">

## ✨ Features

- supports the latest Neovim 0.5 features like TreeSitter and LSP
- minimal inactive statusline (currently bugged)
- vim terminal colors
- darker background for sidebar-like windows
- color configs for [Kitty](https://sw.kovidgoyal.net/kitty/conf.html?highlight=include) and [Alacritty](https://github.com/alacritty/alacritty) 
- **lualine** theme

### Plugin Support

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [LSP Trouble](https://github.com/folke/lsp-trouble.nvim)
- [LSP Saga](https://github.com/glepnir/lspsaga.nvim)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Git Gutter](https://github.com/airblade/vim-gitgutter)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [WhichKey](https://github.com/liuchengxu/vim-which-key)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Dashboard](https://github.com/glepnir/dashboard-nvim)
- [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
- [Lualine](https://github.com/hoob3rt/lualine.nvim)
- [Lightline](https://github.com/itchyny/lightline.vim)
- [Neogit](https://github.com/TimUntersberger/neogit)

## ⚡️ Requirements

- Neovim >= 0.5.0

## 📦 Installation

Install the theme with your preferred package manager:

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'monsonjeremy/onedark.nvim'
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use 'monsonjeremy/onedark.nvim'
```

## 🚀 Usage

Enable the colorscheme:

```vim
" Vim Script
colorscheme onedark
```

```lua
-- Lua
vim.cmd[[colorscheme onedark]]
```

To enable the `onedark` theme for `Lualine`, simply specify it in your lualine settings:

```lua
require('lualine').setup {
  options = {
    theme = 'onedark'
    -- ... your lualine config
  }
}
```

To enable the `onedark` colorscheme for `Lightline`:

```vim
" Vim Script
let g:lightline = {'colorscheme': 'onedark'}
```

## ⚙️ Configuration

> ❗️ configuration needs to be set **BEFORE** loading the color scheme with `colorscheme onedark`

| Option                           | Default | Description                                                                                                                                                     |
| -------------------------------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| onedark_terminal_colors          | `true`  | Configure the colors used when opening a `:terminal` in Neovim                                                                                                  |
| onedark_italic_comments          | `true`  | Make comments italic                                                                                                                                            |
| onedark_italic_keywords          | `true`  | Make keywords italic                                                                                                                                            |
| onedark_italic_functions         | `false` | Make functions italic                                                                                                                                           |
| onedark_italic_variables         | `false` | Make variables and identifiers italic                                                                                                                           |
| onedark_transparent              | `false` | Enable this to disable setting the background color                                                                                                             |
| onedark_hide_inactive_statusline | `false` | Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**. |
| onedark_sidebars                 | `{}`    | Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`                                                      |
| onedark_dark_sidebar             | `true`  | Sidebar like windows like `NvimTree` get a darker background                                                                                                    |
| onedark_dark_float               | `true`  | Float windows like the lsp diagnostics windows get a darker background.                                                                                         |
| onedark_colors                   | `{}`    | You can override specific color groups to use other groups or a hex color                                                                                       |

```lua
-- Example config in Lua
vim.g.onedark_italic_functions = true
vim.g.onedark_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.onedark_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd[[colorscheme onedark]]
```

```vim
" Example config in VimScript
let g:onedark_italic_functions = 1
let g:onedark_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Load the colorscheme
colorscheme onedark
```

### Making `undercurls` work properly in **Tmux**

To have undercurls show up and in color, add the following to your **Tmux** config file:

```sh
# Undercurl
set -g default-terminal "${TERM}"
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
```

## 🍭 Extras

Extra color configs for **Kitty**, and **Alacritty** can be found in [extras](extras/). To use them, refer to their respective documentation.

<img width="825" alt="Screen Shot 2021-05-23 at 2 49 57 PM" src="https://user-images.githubusercontent.com/8846086/119279221-23f08b00-bbdf-11eb-885e-c2c238aa1c04.png">
