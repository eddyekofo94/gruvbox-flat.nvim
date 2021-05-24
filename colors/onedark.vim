" clear cache so this reloads changes.
" useful for development
lua package.loaded['onedark'] = nil
lua package.loaded['onedark.theme'] = nil
lua package.loaded['onedark.colors'] = nil
lua package.loaded['onedark.util'] = nil
lua package.loaded['onedark.config'] = nil

lua require('onedark').colorscheme()
