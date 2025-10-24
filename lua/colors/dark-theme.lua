-- WezTerm Dark colorscheme for Neovim
-- Place this file in ~/.config/nvim/colors/dark-theme.lua
-- Then activate with :colorscheme dark-theme

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "wezterm-dark"
vim.o.background = "dark"

-- Helper function to set highlights
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Color palette matching your WezTerm config
local colors = {
  -- Base colors
  fg        = "#c9d1d9",
  bg        = "#06070a",
  cursor    = "#ffd7ff",
  selection = "#24314b",
  comment   = "#7aa2f7",

  -- ANSI colors
  black         = "#0b0c10",
  red           = "#ff6b6b",
  green         = "#9ece6a",
  yellow        = "#e0af68",
  blue          = "#7aa2f7",
  magenta       = "#bb9af7",
  cyan          = "#7dcfff",
  white         = "#a9b1d6",

  -- Brights
  bright_black   = "#3b4252",
  bright_red     = "#ff6b6b",
  bright_green   = "#c3e88d",
  bright_yellow  = "#ffd580",
  bright_blue    = "#7aa2f7",
  bright_magenta = "#caa9ff",
  bright_cyan    = "#9ee6ff",
  bright_white   = "#e6eef8",

  -- UI elements
  split         = "#2f3b57",
  line_bg       = "#0f1724",
  line_highlight = "#24314b",
  accent        = "#6f5bdc",
}

-- Editor UI
hi("Normal",       { fg = colors.fg, bg = colors.bg })
hi("NormalFloat",  { fg = colors.fg, bg = colors.line_bg })
hi("FloatBorder",  { fg = colors.split, bg = colors.line_bg })
hi("Cursor",       { fg = colors.bg, bg = colors.cursor })
hi("CursorLine",   { bg = colors.line_highlight })
hi("CursorColumn", { bg = colors.line_highlight })
hi("LineNr",       { fg = colors.bright_black })
hi("CursorLineNr", { fg = colors.yellow, bold = true })
hi("SignColumn",   { fg = colors.bright_black, bg = colors.bg })
hi("Visual",       { bg = colors.selection })
hi("VisualNOS",    { bg = colors.selection })
hi("Search",       { fg = colors.bg, bg = colors.yellow })
hi("IncSearch",    { fg = colors.bg, bg = colors.bright_yellow })
hi("MatchParen",   { fg = colors.bright_cyan, bold = true })

-- Statusline & Tabline
hi("StatusLine",   { fg = colors.bright_white, bg = colors.line_highlight })
hi("StatusLineNC", { fg = colors.blue, bg = colors.bg })
hi("TabLine",      { fg = colors.blue, bg = colors.bg })
hi("TabLineFill",  { bg = colors.bg })
hi("TabLineSel",   { fg = colors.bright_white, bg = colors.line_highlight, bold = true })

-- Splits & Popups
hi("VertSplit",    { fg = colors.split, bg = colors.bg })
hi("WinSeparator", { fg = colors.split, bg = colors.bg })
hi("Pmenu",        { fg = colors.fg, bg = colors.line_bg })
hi("PmenuSel",     { fg = colors.bright_white, bg = colors.selection })
hi("PmenuSbar",    { bg = colors.split })
hi("PmenuThumb",   { bg = colors.accent })

-- Syntax highlighting
hi("Comment",      { fg = colors.comment, italic = true })
hi("Constant",     { fg = colors.magenta })
hi("String",       { fg = colors.green })
hi("Character",    { fg = colors.green })
hi("Number",       { fg = colors.magenta })
hi("Boolean",      { fg = colors.magenta })
hi("Float",        { fg = colors.magenta })

hi("Identifier",   { fg = colors.cyan })
hi("Function",     { fg = colors.blue })

hi("Statement",    { fg = colors.magenta })
hi("Conditional",  { fg = colors.magenta })
hi("Repeat",       { fg = colors.magenta })
hi("Label",        { fg = colors.magenta })
hi("Operator",     { fg = colors.cyan })
hi("Keyword",      { fg = colors.magenta })
hi("Exception",    { fg = colors.magenta })

hi("PreProc",      { fg = colors.cyan })
hi("Include",      { fg = colors.magenta })
hi("Define",       { fg = colors.magenta })
hi("Macro",        { fg = colors.cyan })
hi("PreCondit",    { fg = colors.cyan })

hi("Type",         { fg = colors.yellow })
hi("StorageClass", { fg = colors.yellow })
hi("Structure",    { fg = colors.yellow })
hi("Typedef",      { fg = colors.yellow })

hi("Special",      { fg = colors.bright_cyan })
hi("SpecialChar",  { fg = colors.bright_yellow })
hi("Tag",          { fg = colors.blue })
hi("Delimiter",    { fg = colors.fg })
hi("SpecialComment", { fg = colors.comment, italic = true })
hi("Debug",        { fg = colors.red })

hi("Underlined",   { underline = true })
hi("Ignore",       { fg = colors.bright_black })
hi("Error",        { fg = colors.red, bold = true })
hi("Todo",         { fg = colors.bright_yellow, bold = true })

-- Diff
hi("DiffAdd",      { fg = colors.green, bg = colors.bg })
hi("DiffChange",   { fg = colors.yellow, bg = colors.bg })
hi("DiffDelete",   { fg = colors.red, bg = colors.bg })
hi("DiffText",     { fg = colors.blue, bg = colors.selection })

-- Git signs (for gitsigns.nvim)
hi("GitSignsAdd",    { fg = colors.green })
hi("GitSignsChange", { fg = colors.yellow })
hi("GitSignsDelete", { fg = colors.red })

-- Diagnostics (LSP)
hi("DiagnosticError", { fg = colors.red })
hi("DiagnosticWarn",  { fg = colors.yellow })
hi("DiagnosticInfo",  { fg = colors.blue })
hi("DiagnosticHint",  { fg = colors.cyan })

-- Treesitter
hi("@variable",           { fg = colors.fg })
hi("@variable.builtin",   { fg = colors.cyan })
hi("@constant",           { fg = colors.magenta })
hi("@constant.builtin",   { fg = colors.magenta })
hi("@string",             { fg = colors.green })
hi("@number",             { fg = colors.magenta })
hi("@boolean",            { fg = colors.magenta })
hi("@function",           { fg = colors.blue })
hi("@function.builtin",   { fg = colors.bright_blue })
hi("@keyword",            { fg = colors.magenta })
hi("@keyword.function",   { fg = colors.magenta })
hi("@keyword.operator",   { fg = colors.cyan })
hi("@operator",           { fg = colors.cyan })
hi("@type",               { fg = colors.yellow })
hi("@type.builtin",       { fg = colors.yellow })
hi("@parameter",          { fg = colors.cyan })
hi("@property",           { fg = colors.cyan })
hi("@punctuation.bracket", { fg = colors.fg })
hi("@punctuation.delimiter", { fg = colors.fg })
hi("@comment",            { fg = colors.comment, italic = true })
hi("@tag",                { fg = colors.blue })
hi("@tag.attribute",      { fg = colors.cyan })
hi("@tag.delimiter",      { fg = colors.fg })

-- Telescope (if you use it)
hi("TelescopeBorder",       { fg = colors.split })
hi("TelescopePromptBorder", { fg = colors.split })
hi("TelescopeResultsBorder", { fg = colors.split })
hi("TelescopePreviewBorder", { fg = colors.split })
hi("TelescopeSelection",    { fg = colors.bright_white, bg = colors.selection })
hi("TelescopeMatching",     { fg = colors.bright_yellow, bold = true })

-- Neo-tree or nvim-tree (if you use file explorer)
hi("NeoTreeNormal",      { fg = colors.fg, bg = colors.bg })
hi("NeoTreeNormalNC",    { fg = colors.fg, bg = colors.bg })
hi("NvimTreeNormal",     { fg = colors.fg, bg = colors.bg })
hi("NvimTreeFolderIcon", { fg = colors.blue })
hi("NvimTreeFolderName", { fg = colors.blue })

-- Which-key (if you use it)
hi("WhichKey",          { fg = colors.blue })
hi("WhichKeyGroup",     { fg = colors.magenta })
hi("WhichKeyDesc",      { fg = colors.fg })
hi("WhichKeySeparator", { fg = colors.comment })

-- Notify (if you use nvim-notify)
hi("NotifyERRORBorder", { fg = colors.red })
hi("NotifyWARNBorder",  { fg = colors.yellow })
hi("NotifyINFOBorder",  { fg = colors.blue })
hi("NotifyDEBUGBorder", { fg = colors.comment })
hi("NotifyTRACEBorder", { fg = colors.magenta })
