" clear cache so this reloads changes.
" useful for development
lua << EOF
package.loaded['gruvbox-flat'] = nil
package.loaded['gruvbox-flat.theme'] = nil
package.loaded['gruvbox-flat.colors'] = nil
package.loaded['gruvbox-flat.util'] = nil
package.loaded['gruvbox-flat.config'] = nil

require('gruvbox-flat').colorscheme()
EOF
