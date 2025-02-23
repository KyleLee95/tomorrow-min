local lush = require("lush")
local hsl = lush.hsl

local colors = require("tomorrow-min.colors")
-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--
		-- ColorColumn    { }, -- Columns set with 'colorcolumn'
		Conceal({ fg = colors.base.comment }), -- Placeholder characters substituted for concealed text (see 'conceallevel')
		-- Cursor         { }, -- Character under the cursor
		-- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		-- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
		-- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		-- CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory({ fg = colors.vscode.dark_blue }), -- Directory names (and other special names in listings)
		-- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
		-- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
		-- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
		-- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		-- TermCursor     { }, -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		ErrorMsg({ fg = colors.base.red }), -- Error messages on the command line
		-- VertSplit      { }, -- Column separating vertically split windows
		-- Folded         { }, -- Line used for closed folds
		-- FoldColumn     { }, -- 'foldcolumn'
		-- SignColumn     { }, -- Column where |signs| are displayed
		-- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		-- Substitute     { }, -- |:substitute| replacement text highlighting
		-- LineNr         { }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		-- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
		-- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
		-- CursorLineNr   { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
		MatchParen({ bg = colors.base.selection, gui = "bold, underline" }), -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea        { }, -- Area for messages and cmdline
		-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg        { }, -- |more-prompt|
		-- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal({ fg = colors.base.fg, bg = colors.base.bg }), -- Normal text
		NormalFloat({ fg = colors.base.fg, bg = colors.base.bg }), -- Normal text in floating windows.
		-- FloatBorder    { }, -- Border of floating windows.
		-- FloatTitle     { }, -- Title of floating windows.
		-- NormalNC       { }, -- normal text in non-current windows
		-- Pmenu          { }, -- Popup menu: Normal item.
		-- PmenuSel       { }, -- Popup menu: Selected item.
		-- PmenuKind      { }, -- Popup menu: Normal item "kind"
		-- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
		-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
		-- PmenuSbar      { }, -- Popup menu: Scrollbar.
		-- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
		-- Question       { }, -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		-- Search         { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		-- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad({ gui = "undercurl", sp = colors.base.red }), -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap({ gui = "undercurl", sp = colors.base.yellow }), -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal({ gui = "undercurl", sp = colors.base.blue }), -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare({ gui = "undercurl", sp = colors.base.blue }), -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine({ fg = colors.ghostty.bg_blue, bg = colors.ghostty.bg_blue }), -- Status line of current window
		StatusLineNC({ bg = colors.ghostty.bg_blue }), -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		-- TabLine        { }, -- Tab pages line, not active tab page label
		-- TabLineFill    { }, -- Tab pages line, where there are no labels
		-- TabLineSel     { }, -- Tab pages line, active tab page label
		-- Title({ fg = colors.base.blue }), -- Titles for output from ":set all", ":autocmd" etc.
		-- Visual         { }, -- Visual mode selection
		-- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg({ fg = colors.base.yellow }), -- Warning messages
		-- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		WildMenu({ bg = colors.base.red }), -- Current match in 'wildmenu' completion
		WinBar({ fg = colors.base.fg, bg = colors.base.blue }), -- Window bar of current window
		WinBarNC({ fg = colors.base.fg, bg = colors.base.blue }), -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment({ fg = colors.base.comment }), -- Any comment

		Constant({ fg = colors.base.orange }), -- (*) Any constant
		String({ fg = colors.base.green }), --   A string constant: "this is a string"
		Character({ fg = colors.base.green }), --   A character constant: 'c', '\n'
		Number({ fg = colors.base.orange }), --   A number constant: 234, 0xff
		Boolean({ fg = colors.base.orange }), --   A boolean constant: TRUE, false
		Float({ Number }), --   A floating point constant: 2.3e10

		Identifier({ fg = colors.base.fg }), -- (*) Any variable name
		Function({ fg = colors.base.blue }), --   Function name (also: methods for classes)

		Statement({ fg = colors.base.purple }), -- (*) Any statement
		Conditional({ fg = colors.base.purple }), --   if, then, else, endif, switch, etc.
		Repeat({ fg = colors.base.purple }), --   for, do, while, etc.
		Label({ fg = colors.base.purple }), --   case, default, etc.
		-- Operator       { }, --   "sizeof", "+", "*", etc.
		Keyword({ fg = colors.base.blue }), --   any other keyword
		Exception({ fg = colors.base.purple }), --   try, catch, throw

		PreProc({ fg = colors.base.orange }), -- (*) Generic Preprocessor
		-- Include        { }, --   Preprocessor #include
		-- Define         { }, --   Preprocessor #define
		-- Macro          { }, --   Same as Define
		-- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

		Type({ fg = colors.base.yellow }), -- (*) int, long, char, etc.
		-- StorageClass   { }, --   static, register, volatile, etc.
		Structure({ fg = colors.base.fg }), --   struct, union, enum, etc.
		Typedef({ fg = colors.base.aqua }), --   A typedef

		Special({ fg = colors.base.orange }), -- (*) Any special symbol
		-- SpecialChar    { }, --   Special character in a constant
		-- Tag            { }, --   You can use CTRL-] on this
		-- Delimiter      { }, --   Character that needs attention
		-- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
		-- Debug          { }, --   Debugging statements

		Underlined({ gui = "underline" }), -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error({ gui = "undercurl" }), -- Any erroneous construct
		-- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError({ fg = colors.base.red }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn({ fg = colors.base.yellow }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo({ fg = colors.base.blue }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint({ fg = colors.base.comment }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk({ fg = colors.base.green }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticVirtualTextError({ fg = colors.base.red }), -- Used for "Error" diagnostic virtual text.
		DiagnosticVirtualTextWarn({ fg = colors.base.yellow }), -- Used for "Warn" diagnostic virtual text.
		DiagnosticVirtualTextInfo({ fg = colors.base.blue }), -- Used for "Info" diagnostic virtual text.
		DiagnosticVirtualTextHint({ fg = colors.base.comment }), -- Used for "Hint" diagnostic virtual text.
		DiagnosticVirtualTextOk({ fg = colors.base.green }), -- Used for "Ok" diagnostic virtual text.
		DiagnosticUnderlineError({ gui = "undercurl", sp = colors.base.red }), -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn({ gui = "undercurl", sp = colors.base.yellow }), -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo({ gui = "undercurl", sp = colors.base.blue }), -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint({ gui = "undercurl", sp = colors.base.comment }), -- Used to underline "Hint" diagnostics.
		DiagnosticUnderlineOk({ gui = "undercurl", sp = colors.base.green }), -- Used to underline "Ok" diagnostics.
		DiagnosticFloatingError({ DiagnosticError }), -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		DiagnosticFloatingWarn({ DiagnosticWarn }), -- Used to color "Warn" diagnostic messages in diagnostics float.
		DiagnosticFloatingInfo({ DiagnosticInfo }), -- Used to color "Info" diagnostic messages in diagnostics float.
		DiagnosticFloatingHint({ DiagnosticHint }), -- Used to color "Hint" diagnostic messages in diagnostics float.
		DiagnosticFloatingOk({ DiagnosticOk }), -- Used to color "Ok" diagnostic messages in diagnostics float.
		DiagnosticSignError({ DiagnosticError }), -- Used for "Error" signs in sign column.
		DiagnosticSignWarn({ DiagnosticWarn }), -- Used for "Warn" signs in sign column.
		DiagnosticSignInfo({ DiagnosticInfo }), -- Used for "Info" signs in sign column.
		DiagnosticSignHint({ DiagnosticHint }), -- Used for "Hint" signs in sign column.
		DiagnosticSignOk({ DiagnosticOk }), -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		sym("@lsp.type.class.typescriptreact")({ fg = colors.base.fg }),
		sym("@lsp.type.function.typescriptreact")({ fg = colors.base.fg }),
		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		-- sym"@comment"           { }, -- Comment
		-- sym"@punctuation"       { }, -- Delimiter
		sym("@punctuation.special.rust")({ fg = colors.base.fg }), -- Delimiter
		-- sym"@constant"          { }, -- Constant
		-- sym"@constant.builtin"  { }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		-- sym"@macro"             { }, -- Macro
		-- sym"@string"            { }, -- String
		-- sym"@string.escape"     { }, -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym"@number"            { }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		-- sym"@function"          { }, -- Function
		-- sym"@function.builtin"  { }, -- Special
		-- sym"@function.macro"    { }, -- Macro
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { }, -- Function
		-- sym"@field"             { }, -- Identifier
		-- sym"@property"          { }, -- Identifier
		sym("@constructor")({ fg = colors.base.fg }), -- Special
		-- sym"@conditional"       { }, -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		sym("@keyword")({ fg = colors.base.purple }), -- Keyword
		-- sym"@exception"         { }, -- Exception
		-- sym"@variable"          { }, -- Identifier
		sym("@type")({ Type }), -- Type
		-- sym"@type.definition"   { }, -- Typedef
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym"@namespace"         { }, -- Identifier
		-- sym"@include"           { }, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		sym("@tag")({ fg = colors.base.blue }),
		sym("@tag.attribute")({ fg = colors.base.fg }), -- html-like
		sym("@module")({ fg = colors.base.fg }),

		-- Javascript
		sym("@tag.builtin.javascript")({ fg = colors.base.blue }), -- html
		sym("@tag.javascript")({ fg = colors.base.yellow }), -- jsx
		sym("@keyword.import.javascript")({ fg = colors.base.purple }), -- Keyword
		sym("@keyword.return.javascript")({ fg = colors.base.purple }), -- Keyword

		-- Typescript

		sym("@keyword.type.typescript")({ fg = colors.base.blue }),
		sym("@keyword.typescript")({ fg = colors.base.blue }),
		sym("@type.typescript")({ fg = colors.base.fg }),

		-- tsx --
		sym("@type.tsx")({ fg = colors.base.fg }),

		-- tag
		sym("@tag.tsx")({ fg = colors.base.yellow }), -- tsx
		sym("@tag.builtin.tsx")({ fg = colors.base.blue }), -- html

		-- keyword
		sym("@keyword.tsx")({ fg = colors.base.blue }),
		sym("@keyword.import.tsx")({ fg = colors.base.purple }), -- Keyword
		sym("@keyword.return.tsx")({ fg = colors.base.purple }), -- Keyword
		sym("@keyword.function.tsx")({ fg = colors.base.blue }), -- Keyword
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
