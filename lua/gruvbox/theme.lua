local util = require("gruvbox.util")
local colors = require("gruvbox.colors")

local M = {}

---@param config Config
---@return Theme
function M.setup(config)
  config = config or require("gruvbox.config")

  ---@class Theme
  local theme = {}
  theme.config = config
  theme.colors = colors.setup(config)
  local c = theme.colors

  theme.base = {
    Comment = { fg = c.comment, style = config.commentStyle }, -- any comment
    ColorColumn = { bg = c.bg_visual }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.fg_gutter }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.bg, bg = c.fg }, -- character under the cursor
    lCursor = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { fg = c.bg, bg = c.fg }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = c.line_cursor }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = c.line_cursor }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = { fg = c.blue }, -- directory names (and other special names in listings)
    DiffAdd = { bg = c.diff.add }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = c.diff.change }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = c.diff.delete }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = c.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = c.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor  = { }, -- cursor in a focused terminal
    -- TermCursorNC= { }, -- cursor in an unfocused terminal
    ErrorMsg = { fg = c.error }, -- error messages on the command line
    VertSplit = { fg = c.bg_highlight }, -- the column separating vertically split windows
    Folded = { fg = c.blue, bg = c.fg_gutter }, -- line used for closed folds
    FoldColumn = { bg = c.bg, fg = c.fg_gutter }, -- 'foldcolumn'
    SignColumn = { bg = config.transparent and c.none or c.bg, fg = c.fg_gutter }, -- column where |signs| are displayed
    SignColumnSB = { bg = c.bg_sidebar, fg = c.fg_gutter }, -- column where |signs| are displayed
    Substitute = { bg = c.red, fg = c.black }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.fg_gutter }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.purple }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = util.lighten(c.purple, 0.95), style = "bold" }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.fg_dark, style = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = c.fg_dark }, -- Area for messages and cmdline
    -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.blue }, -- |more-prompt|
    NonText = { fg = c.bg_highlight }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.fg, bg = config.transparent and c.none or c.bg }, -- normal text
    NormalNC = { fg = c.fg, bg = config.transparent and c.none or c.bg }, -- normal text in non-current windows
    NormalSB = { fg = c.fg_sidebar, bg = c.bg_sidebar }, -- normal text in non-current windows
    NormalFloat = { fg = c.fg, bg = c.bg_float }, -- Normal text in floating windows.
    FloatBorder = { fg = c.border_highlight },
    Pmenu = { bg = c.bg_popup, fg = c.fg }, -- Popup menu: normal item.
    PmenuSel = { bg = util.darken(c.fg_gutter, 0.8) }, -- Popup menu: selected item.
    PmenuSbar = { bg = util.lighten(c.bg_popup, 0.95) }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.fg_gutter }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = c.blue }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.bg_visual, style = "bold" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = c.bg_search, fg = c.fg_search }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { bg = c.orange, fg = c.black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    SpecialKey = { fg = c.fg_gutter }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { sp = c.error, style = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.warning, style = "undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.info, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.hint, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.fg_sidebar, bg = c.bg_statusline }, -- status line of current window
    StatusLineNC = { fg = c.fg_gutter, bg = c.bg_statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { bg = c.bg_statusline, fg = c.fg_gutter }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.black }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.black, bg = c.blue }, -- tab pages line, active tab page label
    Title = { fg = c.blue, style = "bold" }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.bg_visual }, -- Visual mode selection
    VisualNOS = { bg = c.bg_visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.warning }, -- warning messages
    Whitespace = { fg = c.fg_gutter }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.bg_visual }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = c.purple }, -- (preferred) any constant
    String = { fg = c.green }, --   a string constant: "this is a string"
    Character = { fg = c.green }, --  a character constant: 'c', '\n'
    -- Number        = { }, --   a number constant: 234, 0xff
    Boolean       = { fg = c.red}, --  a boolean constant: TRUE, false
    -- Float         = { }, --    a floating point constant: 2.3e10

    Identifier = { fg = c.fg, style = config.variableStyle }, -- (preferred) any variable name
    Function = { fg = c.blue, style = config.functionStyle }, -- function name (also: methods for classes)

    Statement = { fg = c.purple }, -- (preferred) any statement
    -- Conditional   = { }, --  if, then, else, endif, switch, etc.
    -- Repeat        = { }, --   for, do, while, etc.
    -- Label         = { }, --    case, default, etc.
    Operator = { fg = c.orange }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = c.aqua, style = config.keywordStyle }, --  any other keyword
    -- Exception     = { }, --  try, catch, throw

    PreProc = { fg = c.aqua }, -- (preferred) generic Preprocessor
    -- Include       = { }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type = { fg = c.yellow }, -- (preferred) int, long, char, etc.
    -- StorageClass  = { }, -- static, register, volatile, etc.
    -- Structure     = { }, --  struct, union, enum, etc.
    -- Typedef       = { }, --  A typedef

    Special = { fg = c.orange }, -- (preferred) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    -- Tag           = { }, --    you can use CTRL-] on this
    -- Delimiter     = { }, --  character that needs attention
    -- SpecialComment= { }, -- special things inside a comment
    -- Debug         = { }, --    debugging statements

    Underlined = { style = "underline" }, -- (preferred) text that stands out, HTML links
    Bold = { style = "bold" },
    Italic = { style = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = c.error }, -- (preferred) any erroneous construct
    Todo = { bg = c.yellow, fg = c.bg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    qfLineNr = { fg = c.dark5 },
    qfFileName = { fg = c.blue },

    htmlTag = { fg = c.purple, style = "bold" },

    -- mkdHeading = { fg = c.orange, style = "bold" },
    -- mkdCode = { bg = c.bg2, fg = c.fg },
    mkdCodeDelimiter = { bg = c.bg2, fg = c.fg },
    mkdCodeStart = { fg = c.yellow, style = "bold" },
    mkdCodeEnd = { fg = c.yellow, style = "bold" },
    -- mkdLink = { fg = c.blue, style = "underline" },

    markdownHeadingDelimiter = { fg = c.orange, style = "bold" },
    markdownCode = { fg = c.yellow },
    markdownCodeBlock = { fg = c.yellow },
    markdownH1 = { fg = c.red, style = "bold" },
    markdownH2 = { fg = c.blue, style = "bold" },
    markdownLinkText = { fg = c.blue, style = "underline" },

    debugPC = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = util.darken(c.info, 0.1), fg = c.info }, -- used for breakpoint colors in terminal-debug

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = c.bg_visual }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.bg_visual }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.bg_visual }, -- used for highlighting "write" references

    LspDiagnosticsDefaultError = { fg = c.error }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultWarning = { fg = c.warning }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultInformation = { fg = c.info }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultHint = { fg = c.hint }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    LspDiagnosticsVirtualTextError = { bg = util.darken(c.error, 0.1), fg = c.error }, -- Used for "Error" diagnostic virtual text
    LspDiagnosticsVirtualTextWarning = { bg = util.darken(c.warning, 0.1), fg = c.warning }, -- Used for "Warning" diagnostic virtual text
    LspDiagnosticsVirtualTextInformation = { bg = util.darken(c.info, 0.1), fg = c.info }, -- Used for "Information" diagnostic virtual text
    LspDiagnosticsVirtualTextHint = { bg = util.darken(c.hint, 0.1), fg = c.hint }, -- Used for "Hint" diagnostic virtual text

    LspDiagnosticsUnderlineError = { style = "undercurl", sp = c.error }, -- Used to underline "Error" diagnostics
    LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = c.warning }, -- Used to underline "Warning" diagnostics
    LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = c.info }, -- Used to underline "Information" diagnostics
    LspDiagnosticsUnderlineHint = { style = "undercurl", sp = c.hint }, -- Used to underline "Hint" diagnostics

    -- LspDiagnosticsFloatingError         = { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingWarning       = { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingInformation   = { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingHint          = { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- LspDiagnosticsSignError             = { }, -- Used for "Error" signs in sign column
    -- LspDiagnosticsSignWarning           = { }, -- Used for "Warning" signs in sign column
    -- LspDiagnosticsSignInformation       = { }, -- Used for "Information" signs in sign column
    -- LspDiagnosticsSignHint              = { }, -- Used for "Hint" signs in sign column
  }

  theme.plugins = {

    -- -- These groups are for the neovim tree-sitter highlights.
    -- -- As of writing, tree-sitter support is a WIP, group names may change.
    -- -- By default, most of these groups link to an appropriate Vim group,
    -- -- TSError -> Error for example, so you do not have to define these unless
    -- -- you explicitly want to support Treesitter's improved syntax awareness.

    -- -- TSAnnotation        = { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- -- TSAttribute         = { };    -- (unstable) TODO: docs
    TSBoolean           = { fg = c.red };    -- For booleans.
    -- -- TSCharacter         = { };    -- For characters.
    -- -- TSComment           = { };    -- For comment blocks.
    TSNote = { fg = c.bg, bg = c.info },
    TSWarning = { fg = c.bg, bg = c.warning },
    TSDanger = { fg = c.bg, bg = c.error },
    TSConstructor = { fg = c.aqua }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    -- -- TSConditional       = { };    -- For keywords related to conditionnals.
    TSConstant = { fg = c.yellow }, -- For constants
    -- -- TSConstBuiltin      = { };    -- For constant that are built in the language: `nil` in Lua.
    -- -- TSConstMacro        = { };    -- For constants that are defined by macros: `NULL` in C.
    -- -- TSError             = { };    -- For syntax/parser errors.
    -- -- TSException         = { };    -- For exception related keywords.
    -- TSField = { fg = c.aqua }, -- For fields.
    -- -- TSFloat             = { };    -- For floats.
    -- -- TSFunction          = { };    -- For function (calls and definitions).
    -- -- TSFuncBuiltin       = { };    -- For builtin functions: `table.insert` in Lua.
    -- -- TSFuncMacro         = { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude = { fg = c.blue }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword = { fg = c.purple, style = config.keywordStyle }, -- For keywords that don't fall in previous categories.
    TSKeywordFunction = { fg = c.purple, style = config.functionStyle }, -- For keywords used to define a fuction.
    TSLabel = { fg = c.blue }, -- For labels: `label:` in C and `:label:` in Lua.
    -- -- TSMethod            = { };    -- For method calls and definitions.
    TSNamespace = { fg = c.red }, -- For identifiers referring to modules and namespaces.
    -- -- TSNone              = { };    -- TODO: docs
    -- -- TSNumber            = { };    -- For all numbers
    TSOperator = {fg = c.orange}, -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter = { fg = c.orange }, -- For parameters of a function.
    -- -- TSParameterReference= { };    -- For references to parameters of a function.
    TSProperty = { fg = c.fg }, -- Same as `TSField`.
    TSPunctDelimiter = { fg = c.red }, -- For delimiters ie: `.`
    TSPunctBracket = { fg = util.darken(c.orange, 0.85) }, -- For brackets and parens.
    TSPunctSpecial = { fg = util.darken(c.orange, 0.85) }, -- For special punctutation that does not fall in the catagories before.
    -- -- TSRepeat            = { };    -- For keywords related to loops.
    -- -- TSString            = { };    -- For strings.
    TSStringRegex = { fg = c.orange }, -- For regexes.
    TSStringEscape = { fg = c.red }, -- For escape characters within a string.
    -- -- TSSymbol            = { };    -- For identifiers referring to symbols or atoms.
    -- -- TSType              = { };    -- For types.
    -- -- TSTypeBuiltin       = { };    -- For builtin types.
    TSVariable = { style = config.variableStyle }, -- Any variable name that does not have another highlight.
    TSVariableBuiltin = { fg = c.aqua }, -- Variable names that are defined by the languages, like `this` or `self`.

    TSTag = { fg = c.fg }, -- Tags like html tag names.
    -- -- TSTagDelimiter      = { };    -- Tag delimiter like `<` `>` `/`
    -- -- TSText              = { };    -- For strings considered text in a markup language.
    TSTextReference = { fg = c.fg }, -- FIXME
    -- -- TSEmphasis          = { };    -- For text to be represented with emphasis.
    -- -- TSUnderline         = { };    -- For text to be represented with an underline.
    -- -- TSStrike            = { };    -- For strikethrough text.
    -- -- TSTitle             = { };    -- Text that is part of a title.
    -- -- TSLiteral           = { };    -- Literal text.
    -- -- TSURI               = { };    -- Any URI like a link or email.

    -- Lua
    luaTSProperty = { fg = c.red }, -- Same as `TSField`.

    -- LspTrouble
    LspTroubleText = { fg = c.fg_dark },
    LspTroubleCount = { fg = c.purple, bg = c.fg_gutter },
    LspTroubleNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },

    -- Illuminate
    illuminatedWord = { bg = c.fg_gutter },
    illuminatedCurWord = { bg = c.fg_gutter },

    -- diff
    diffAdded = { fg = c.git.add },
    diffRemoved = { fg = c.git.delete },
    diffChanged = { fg = c.git.change },
    diffOldFile = { fg = c.yellow },
    diffNewFile = { fg = c.orange },
    diffFile = { fg = c.blue },
    diffLine = { fg = c.fg_gutter },
    diffIndexLine = { fg = c.purple },

    -- Neogit
    NeogitBranch = { fg = c.purple },
    NeogitRemote = { fg = c.purple },
    NeogitHunkHeader = { bg = c.bg_highlight, fg = c.fg },
    NeogitHunkHeaderHighlight = { bg = c.fg_gutter, fg = c.blue },
    NeogitDiffContextHighlight = { bg = util.darken(c.fg_gutter, 0.5), fg = c.fg_dark },
    NeogitDiffDeleteHighlight = { fg = c.git.delete, bg = c.diff.delete },
    NeogitDiffAddHighlight = { fg = c.git.add, bg = c.diff.add },

    -- GitGutter
    GitGutterAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopeBorder = { fg = util.darken(c.fg, 0.75) },
    -- TelescopeBorder          = { fg = c.bg_visual, bg = c.bg },
    TelescopeNormal          = { bg = c.bg },
    TelescopePreviewBorder   = { fg = c.bg, bg = c.bg },
    TelescopePreviewNormal   = { bg = c.bg },
    TelescopePreviewTitle    = { fg = c.bg, bg = c.green },
    TelescopePromptBorder    = { fg = c.bg_visual, bg = c.bg_visual },
    TelescopePromptNormal    = { fg = c.fg, bg = c.bg_visual },
    TelescopePromptPrefix    = { fg = c.red, bg = c.bg_visual},
    TelescopePromptTitle     = { fg = c.bg, bg = c.red },
    TelescopeResultsBorder   = { fg = c.bg, bg = c.bg },
    TelescopeResultsNormal   = { bg = c.bg },
    TelescopeResultsTitle    = { fg = c.bg, bg = c.bg },


    -- NvimTree
    NvimTreeNormal = { fg = c.tree_normal, bg = c.bg_sidebar },
    NvimTreeFolderIcon = {fg = c.comment},
    NvimTreeRootFolder = { fg = c.fg_light, style = "bold" },
    NvimTreeSymlink = { fg = c.blue },
    NvimTreeFolderName = { fg = c.tree_normal},
    NvimTreeEmptyFolderName = { fg = c.comment},
    NvimTreeOpenedFolderName = {fg = c.purple},
    NvimTreeOpenedFile = { fg = c.purple}, -- TODO: not working
    NvimTreeGitDirty = { fg = c.yellow2 },
    NvimTreeGitNew = { fg = c.git.add },
    NvimTreeGitDeleted = { fg = c.git.delete },
    NvimTreeSpecialFile = { fg = c.yellow, style = "underline" },
    NvimTreeIndentMarker = { fg = c.fg_gutter },
    NvimTreeImageFile = { fg = c.fg_sidebar },
    LspDiagnosticsError = { fg = c.error },
    LspDiagnosticsWarning = { fg = c.warning },
    LspDiagnosticsInformation = { fg = c.info },
    LspDiagnosticsHint = { fg = c.hint },

    -- Dashboard
    DashboardShortCut = { fg = c.purple },
    DashboardHeader = { fg = c.red },
    DashboardCenter = { fg = c.blue },
    DashboardFooter = { fg = c.yellow, style = "italic" },

    -- WhichKey
    WhichKey = { fg = c.yellow },
    WhichKeyGroup = { fg = c.blue },
    WhichKeyDesc = { fg = c.red },
    WhichKeySeperator = { fg = c.fg },
    WhichKeySeparator = { fg = c.fg },
    WhichKeyFloat = { bg = c.bg_sidebar },
    WhichKeyValue = { fg = c.dark5 },

    -- LspSaga
    DiagnosticError = { fg = c.error },
    DiagnosticWarning = { fg = c.warning },
    DiagnosticInformation = { fg = c.info },
    DiagnosticHint = { fg = c.hint },
    LspSagaHoverBorder = { fg = c.border},
    LspSagaSignatureHelpBorder = { fg = c.border},
    LspSagaCodeActionBorder = { fg = c.border},
    LspSagaAutoPreview = { fg = c.border},
    LspSagaDefPreviewBorder = {fg = c.border},
    LspLinesDiagBorder = { fg = c.border},

    -- NeoVim
    healthError = { fg = c.error },
    healthSuccess = { fg = c.green },
    healthWarning = { fg = c.warning },

    -- BufferLine
    BufferLineIndicatorSelected = { fg = c.git.change },
    BufferLineFill = { bg = c.black },

    -- Hop
    HopNextKey = { fg = c.red, style = "bold" },
	HopNextKey1 = { fg = c.blue, style = "bold" },
	HopNextKey2 = { fg = util.darken(c.blue, 0.80) },
    HopUnmatched = { fg = c.comment },

		-- ChooseWin
		ChooseWinOther = { bg = c.bg_statusline },
		ChooseWinLabelCurrent = { bg = util.lighten(c.blue, 0.7), fg = c.black, style = "bold" },
		ChooseWinLabel = { bg = util.darken(c.blue, 0.9), fg = util.lighten(c.black, 0.8) },
  }

  if config.hideInactiveStatusline then
    local inactive = { style = "underline", bg = c.bg, fg = c.bg, sp = c.border }

    -- StatusLineNC
    theme.base.StatusLineNC = inactive

    -- LuaLine
    for _, section in ipairs({ "a", "b", "c" }) do
      theme.plugins["lualine_" .. section .. "_inactive"] = inactive
    end
  end

  util.theme_overrides(theme, config)

  return theme
end

return M
