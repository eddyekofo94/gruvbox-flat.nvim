" clear cache so this reloads changes.
" useful for development
lua package.loaded['gruvbox'] = nil
lua package.loaded['gruvbox.theme'] = nil
lua package.loaded['gruvbox.colors'] = nil
lua package.loaded['gruvbox.util'] = nil
lua package.loaded['gruvbox.config'] = nil

lua require('gruvbox').colorscheme()
