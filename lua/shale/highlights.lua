local colors = require("shale.colors")

local M = {}

---@param groups table<string, table>
local function set_highlights(groups)
  for group, opts in pairs(groups) do
    if type(opts) == "string" then
      vim.api.nvim_set_hl(0, group, { link = opts })
    else
      vim.api.nvim_set_hl(0, group, opts)
    end
  end
end

M.setup = function()
  local c = colors

  -- stylua: ignore
  local groups = {

    -- =========================================================================
    -- Editor UI
    -- =========================================================================
    Normal            = { fg = c.fg, bg = c.bg },
    NormalNC          = { fg = c.fg, bg = c.bg },
    NormalFloat       = { fg = c.fg, bg = c.bg_alt },
    NormalSB          = { fg = c.fg_dim, bg = c.bg_alt },
    FloatBorder       = { fg = c.border, bg = c.bg },
    FloatTitle        = { fg = c.fg_dim, bg = c.bg_alt },
    FloatShadow       = { bg = c.bg_alt },
    FloatShadowThrough = { bg = c.bg_alt },

    ColorColumn       = { bg = c.surface },
    Conceal           = { fg = c.fg_dim },
    Cursor            = { fg = c.bg, bg = c.fg },
    lCursor           = { fg = c.bg, bg = c.fg },
    CursorIM          = { fg = c.bg, bg = c.fg },
    TermCursor        = { fg = c.bg, bg = c.fg },
    TermCursorNC      = { fg = c.bg, bg = c.fg_dim },
    CursorColumn      = { bg = c.cursorline },
    CursorLine        = { bg = c.cursorline },
    CursorLineNr      = { fg = c.fg, bold = true },
    LineNr            = { fg = c.comment },
    LineNrAbove       = { fg = c.comment },
    LineNrBelow       = { fg = c.comment },
    SignColumn        = { fg = c.comment, bg = c.bg },
    SignColumnSB      = { fg = c.comment, bg = c.bg_alt },

    Folded            = { fg = c.fg_dim, bg = c.surface },
    FoldColumn        = { fg = c.comment, bg = c.bg },

    VertSplit         = { fg = c.border },
    WinSeparator      = { fg = c.border },
    WinBar            = { fg = c.fg_dim, bg = c.bg },
    WinBarNC          = { fg = c.comment, bg = c.bg },

    StatusLine        = { fg = c.fg, bg = c.surface },
    StatusLineNC      = { fg = c.fg_dim, bg = c.bg_alt },
    TabLine           = { fg = c.fg_dim, bg = c.surface },
    TabLineFill       = { bg = c.bg_alt },
    TabLineSel        = { fg = c.fg, bg = c.bg, bold = true },

    Pmenu             = { fg = c.fg, bg = c.surface },
    PmenuSel          = { fg = c.fg, bg = c.selection, bold = true },
    PmenuMatch        = { fg = c.func, bold = true },
    PmenuMatchSel     = { fg = c.func, bg = c.selection, bold = true },
    PmenuSbar         = { bg = c.border },
    PmenuThumb        = { bg = c.fg_dim },
    PmenuExtra        = { fg = c.fg_dim },
    PmenuExtraSel     = { fg = c.fg_dim, bg = c.selection },
    ComplMatchIns     = { fg = c.func },
    PreInsert         = { fg = c.fg_dim },
    ComplHint         = { fg = c.comment },

    Visual            = { bg = c.selection },
    VisualNOS         = { bg = c.selection },

    Search            = { fg = c.bg, bg = c.type },
    IncSearch         = { fg = c.bg, bg = c.keyword },
    CurSearch         = { fg = c.bg, bg = c.keyword },
    Substitute        = { fg = c.bg, bg = c.number },

    MatchParen        = { fg = c.number, bold = true },

    NonText           = { fg = c.border },
    SpecialKey        = { fg = c.comment },
    Whitespace        = { fg = c.border },
    EndOfBuffer       = { fg = c.bg },

    Directory         = { fg = c.func, bold = true },
    Title             = { fg = c.func, bold = true },

    WildMenu          = { fg = c.bg, bg = c.func },

    ModeMsg           = { fg = c.fg, bold = true },
    MsgArea           = { fg = c.fg_dim },
    MsgSeparator      = { fg = c.border },
    MoreMsg           = { fg = c.string },
    Question          = { fg = c.string },
    WarningMsg        = { fg = c.warning },
    ErrorMsg          = { fg = c.error },

    QuickFixLine      = { bg = c.selection, bold = true },
    qfLineNr          = { fg = c.type },
    qfFileName        = { fg = c.func },

    SpellBad          = { undercurl = true, sp = c.error },
    SpellCap          = { undercurl = true, sp = c.warning },
    SpellLocal        = { undercurl = true, sp = c.hint },
    SpellRare         = { undercurl = true, sp = c.fg_dim },

    -- health
    healthError       = { fg = c.error },
    healthSuccess     = { fg = c.git_add },
    healthWarning     = { fg = c.warning },

    -- debugging
    debugPC           = { bg = c.bg_alt },
    debugBreakpoint   = { fg = c.error, bg = c.bg_alt },

    -- =========================================================================
    -- Syntax (standard :help group-name)
    -- =========================================================================
    Comment           = { fg = c.comment, italic = true },

    Constant          = { fg = c.constant },
    String            = { fg = c.string },
    Character         = { fg = c.string },
    Number            = { fg = c.number },
    Float             = { fg = c.number },
    Boolean           = { fg = c.constant },

    Identifier        = { fg = c.fg },
    Function          = { fg = c.func },

    Statement         = { fg = c.keyword },
    Conditional       = { fg = c.keyword },
    Repeat            = { fg = c.keyword },
    Label             = { fg = c.keyword },
    Operator          = { fg = c.operator },
    Keyword           = { fg = c.keyword },
    Exception         = { fg = c.keyword },

    PreProc           = { fg = c.func },
    Include           = { fg = c.keyword },
    Define            = { fg = c.keyword },
    Macro             = { fg = c.keyword },
    PreCondit         = { fg = c.keyword },

    Type              = { fg = c.type },
    StorageClass      = { fg = c.type },
    Structure         = { fg = c.type },
    Typedef           = { fg = c.type },

    Special           = { fg = c.number },
    SpecialChar       = { fg = c.number },
    Tag               = { fg = c.func },
    Delimiter         = { fg = c.operator },
    SpecialComment    = { fg = c.comment, italic = true, bold = true },
    Debug             = { fg = c.number },

    Underlined        = { underline = true },
    Bold              = { bold = true },
    Italic            = { italic = true },
    Ignore            = { fg = c.comment },
    Error             = { fg = c.error },
    Todo              = { fg = c.bg, bg = c.warning, bold = true },

    -- =========================================================================
    -- Treesitter (modern @-captures)
    -- =========================================================================

    -- misc
    ["@none"]                             = { fg = c.fg },
    ["@conceal"]                          = { fg = c.comment },
    ["@error"]                            = { link = "Error" },
    ["@preproc"]                          = { link = "PreProc" },
    ["@define"]                           = { link = "Define" },

    -- comments
    ["@comment"]                          = { link = "Comment" },
    ["@comment.documentation"]            = { fg = c.comment, italic = true, bold = true },
    ["@comment.error"]                    = { fg = c.error, italic = true },
    ["@comment.warning"]                  = { fg = c.warning, italic = true },
    ["@comment.hint"]                     = { fg = c.hint, italic = true },
    ["@comment.info"]                     = { fg = c.info, italic = true },
    ["@comment.note"]                     = { fg = c.hint, italic = true },
    ["@comment.todo"]                     = { fg = c.warning, italic = true, bold = true },

    -- punctuation
    ["@punctuation.delimiter"]            = { fg = c.operator },
    ["@punctuation.bracket"]              = { fg = c.fg_dim },
    ["@punctuation.special"]              = { fg = c.number },

    -- literals
    ["@string"]                           = { link = "String" },
    ["@string.documentation"]             = { fg = c.string, italic = true },
    ["@string.regex"]                     = { fg = c.number },
    ["@string.regexp"]                    = { fg = c.number },
    ["@string.escape"]                    = { fg = c.number },
    ["@string.special"]                   = { fg = c.number },
    ["@string.special.path"]              = { fg = c.string },
    ["@string.special.symbol"]            = { fg = c.constant },
    ["@string.special.url"]               = { fg = c.hint, underline = true },
    ["@character"]                        = { link = "Character" },
    ["@character.special"]                = { link = "SpecialChar" },
    ["@number"]                           = { link = "Number" },
    ["@number.float"]                     = { link = "Float" },
    ["@boolean"]                          = { link = "Boolean" },

    -- functions
    ["@function"]                         = { link = "Function" },
    ["@function.builtin"]                 = { fg = c.constant, italic = true }, -- builtin fns distinct from user fns
    ["@function.call"]                    = { link = "Function" },
    ["@function.macro"]                   = { fg = c.keyword },
    ["@function.method"]                  = { link = "Function" },
    ["@function.method.call"]             = { link = "Function" },

    -- keywords
    ["@keyword"]                          = { link = "Keyword" },
    ["@keyword.function"]                 = { fg = c.keyword, italic = true }, -- `def`, `fn`, `function` keyword itself
    ["@keyword.operator"]                 = { fg = c.keyword },
    ["@keyword.import"]                   = { fg = c.keyword },
    ["@keyword.storage"]                  = { fg = c.type },
    ["@keyword.repeat"]                   = { fg = c.keyword },
    ["@keyword.return"]                   = { fg = c.keyword, italic = true },
    ["@keyword.exception"]                = { fg = c.keyword },
    ["@keyword.conditional"]              = { fg = c.keyword },
    ["@keyword.conditional.ternary"]      = { fg = c.operator },
    ["@keyword.directive"]                = { fg = c.func },
    ["@keyword.directive.define"]         = { fg = c.func },
    ["@keyword.coroutine"]                = { fg = c.keyword },
    ["@keyword.debug"]                    = { fg = c.number },
    ["@keyword.export"]                   = { fg = c.keyword },
    ["@keyword.modifier"]                 = { fg = c.type },
    ["@keyword.type"]                     = { fg = c.type },

    -- types
    ["@type"]                             = { link = "Type" },
    ["@type.builtin"]                     = { fg = c.type, italic = true },
    ["@type.definition"]                  = { fg = c.type },
    ["@type.qualifier"]                   = { fg = c.type },

    -- identifiers
    -- @variable = plain fg (intentional — makes builtins/params/members pop by contrast)
    ["@variable"]                         = { fg = c.fg },
    ["@variable.builtin"]                 = { fg = c.keyword, italic = true }, -- `self`, `this`, `super`
    ["@variable.parameter"]               = { fg = c.param },                 -- fn args: dusty gold
    ["@variable.parameter.builtin"]       = { fg = c.param, italic = true },  -- `...`, builtins
    ["@variable.member"]                  = { fg = c.member },                -- field access: pale blue

    ["@constant"]                         = { link = "Constant" },
    ["@constant.builtin"]                 = { fg = c.constant, italic = true },
    ["@constant.macro"]                   = { fg = c.constant },

    ["@attribute"]                        = { fg = c.type },
    ["@property"]                         = { fg = c.member },  -- obj.property — same as member
    ["@constructor"]                      = { fg = c.type },
    ["@operator"]                         = { link = "Operator" },
    ["@label"]                            = { fg = c.keyword },

    ["@module"]                           = { fg = c.type },
    ["@module.builtin"]                   = { fg = c.type, italic = true },
    ["@namespace"]                        = { fg = c.type },

    -- tags (HTML/JSX)
    ["@tag"]                              = { fg = c.keyword },
    ["@tag.attribute"]                    = { fg = c.type },
    ["@tag.delimiter"]                    = { fg = c.operator },
    ["@tag.builtin"]                      = { fg = c.constant },

    -- markup (markdown, RST, etc.)
    ["@markup"]                           = { fg = c.fg },
    ["@markup.strong"]                    = { bold = true },
    ["@markup.italic"]                    = { italic = true },
    ["@markup.strikethrough"]             = { strikethrough = true },
    ["@markup.underline"]                 = { underline = true },
    ["@markup.heading"]                   = { fg = c.func, bold = true },
    ["@markup.heading.1.markdown"]        = { fg = c.keyword, bold = true },
    ["@markup.heading.2.markdown"]        = { fg = c.func, bold = true },
    ["@markup.heading.3.markdown"]        = { fg = c.type, bold = true },
    ["@markup.heading.4.markdown"]        = { fg = c.string, bold = true },
    ["@markup.heading.5.markdown"]        = { fg = c.constant, bold = true },
    ["@markup.heading.6.markdown"]        = { fg = c.fg_dim, bold = true },
    ["@markup.quote"]                     = { fg = c.comment, italic = true },
    ["@markup.math"]                      = { fg = c.number },
    ["@markup.link"]                      = { fg = c.hint },
    ["@markup.link.label"]                = { fg = c.string },
    ["@markup.link.url"]                  = { fg = c.hint, underline = true, italic = true },
    ["@markup.raw"]                       = { fg = c.constant, bg = c.surface },
    ["@markup.raw.markdown_inline"]       = { fg = c.constant, bg = c.surface },
    ["@markup.list"]                      = { fg = c.keyword },
    ["@markup.list.checked"]              = { fg = c.git_add },
    ["@markup.list.unchecked"]            = { fg = c.fg_dim },
    ["@markup.environment"]               = { link = "Macro" },
    ["@markup.environment.name"]          = { link = "Type" },

    -- diff
    ["@diff.plus"]                        = { fg = c.git_add },
    ["@diff.minus"]                       = { fg = c.git_delete },
    ["@diff.delta"]                       = { fg = c.git_change },

    -- legacy TS* aliases (nvim < 0.8 parsers)
    TSAnnotation          = { link = "PreProc" },
    TSAttribute           = { link = "@attribute" },
    TSBoolean             = { link = "Boolean" },
    TSCharacter           = { link = "Character" },
    TSComment             = { link = "Comment" },
    TSConditional         = { link = "Conditional" },
    TSConstant            = { link = "Constant" },
    TSConstBuiltin        = { link = "@constant.builtin" },
    TSConstMacro          = { link = "Define" },
    TSConstructor         = { link = "@constructor" },
    TSDebug               = { link = "Debug" },
    TSDefine              = { link = "Define" },
    TSError               = { link = "Error" },
    TSException           = { link = "Exception" },
    TSField               = { link = "@variable.member" },
    TSFloat               = { link = "Float" },
    TSFunction            = { link = "Function" },
    TSFuncBuiltin         = { link = "@function.builtin" },
    TSFuncMacro           = { link = "@function.macro" },
    TSInclude             = { link = "Include" },
    TSKeyword             = { link = "Keyword" },
    TSKeywordFunction     = { link = "@keyword.function" },
    TSKeywordOperator     = { link = "@keyword.operator" },
    TSKeywordReturn       = { link = "@keyword.return" },
    TSLabel               = { link = "Label" },
    TSMethod              = { link = "@function.method" },
    TSNamespace           = { link = "@module" },
    TSNone                = { fg = c.fg },
    TSNumber              = { link = "Number" },
    TSOperator            = { link = "Operator" },
    TSParameter           = { link = "@variable.parameter" },
    TSParameterReference  = { link = "@variable.parameter" },
    TSPreProc             = { link = "PreProc" },
    TSProperty            = { link = "@property" },
    TSPunctDelimiter      = { link = "@punctuation.delimiter" },
    TSPunctBracket        = { link = "@punctuation.bracket" },
    TSPunctSpecial        = { link = "@punctuation.special" },
    TSRepeat              = { link = "Repeat" },
    TSStorageClass        = { link = "StorageClass" },
    TSString              = { link = "String" },
    TSStringRegex         = { link = "@string.regex" },
    TSStringEscape        = { link = "@string.escape" },
    TSStringSpecial       = { link = "@string.special" },
    TSSymbol              = { link = "@string.special.symbol" },
    TSTag                 = { link = "@tag" },
    TSTagAttribute        = { link = "@tag.attribute" },
    TSTagDelimiter        = { link = "@tag.delimiter" },
    TSText                = { fg = c.fg },
    TSStrong              = { bold = true },
    TSEmphasis            = { italic = true },
    TSUnderline           = { underline = true },
    TSStrike              = { strikethrough = true },
    TSTitle               = { link = "@markup.heading" },
    TSLiteral             = { link = "@markup.raw" },
    TSURI                 = { link = "@string.special.url" },
    TSMath                = { link = "@markup.math" },
    TSType                = { link = "Type" },
    TSTypeBuiltin         = { link = "@type.builtin" },
    TSTypeDefinition      = { link = "@type.definition" },
    TSTypeQualifier       = { link = "@type.qualifier" },
    TSVariable            = { link = "@variable" },
    TSVariableBuiltin     = { link = "@variable.builtin" },

    -- =========================================================================
    -- LSP
    -- =========================================================================
    LspReferenceText            = { bg = c.surface },
    LspReferenceRead            = { bg = c.surface },
    LspReferenceWrite           = { bg = c.surface, bold = true },
    LspSignatureActiveParameter = { fg = c.type, bold = true },
    LspCodeLens                 = { fg = c.comment, italic = true },
    LspCodeLensSeparator        = { fg = c.border },
    LspInlayHint                = { fg = c.comment, bg = c.surface, italic = true },
    LspInfoBorder               = { link = "FloatBorder" },

    -- Diagnostics
    DiagnosticError             = { fg = c.error },
    DiagnosticWarn              = { fg = c.warning },
    DiagnosticInfo              = { fg = c.info },
    DiagnosticHint              = { fg = c.hint },
    DiagnosticOk                = { fg = c.git_add },
    DiagnosticUnnecessary       = { fg = c.comment },
    DiagnosticDeprecated        = { fg = c.comment, strikethrough = true },

    DiagnosticVirtualTextError  = { fg = c.error, bg = c.bg_alt, italic = true },
    DiagnosticVirtualTextWarn   = { fg = c.warning, bg = c.bg_alt, italic = true },
    DiagnosticVirtualTextInfo   = { fg = c.info, bg = c.bg_alt, italic = true },
    DiagnosticVirtualTextHint   = { fg = c.hint, bg = c.bg_alt, italic = true },
    DiagnosticVirtualTextOk     = { fg = c.git_add, bg = c.bg_alt, italic = true },

    DiagnosticUnderlineError    = { undercurl = true, sp = c.error },
    DiagnosticUnderlineWarn     = { undercurl = true, sp = c.warning },
    DiagnosticUnderlineInfo     = { undercurl = true, sp = c.info },
    DiagnosticUnderlineHint     = { undercurl = true, sp = c.hint },
    DiagnosticUnderlineOk       = { undercurl = true, sp = c.git_add },

    DiagnosticFloatingError     = { fg = c.error },
    DiagnosticFloatingWarn      = { fg = c.warning },
    DiagnosticFloatingInfo      = { fg = c.info },
    DiagnosticFloatingHint      = { fg = c.hint },
    DiagnosticFloatingOk        = { fg = c.git_add },

    DiagnosticSignError         = { fg = c.error },
    DiagnosticSignWarn          = { fg = c.warning },
    DiagnosticSignInfo          = { fg = c.info },
    DiagnosticSignHint          = { fg = c.hint },
    DiagnosticSignOk            = { fg = c.git_add },

    -- Legacy LSP diagnostic aliases (pre-0.6)
    LspDiagnosticsDefaultError          = { fg = c.error },
    LspDiagnosticsDefaultWarning        = { fg = c.warning },
    LspDiagnosticsDefaultInformation    = { fg = c.info },
    LspDiagnosticsDefaultHint           = { fg = c.hint },
    LspDiagnosticsVirtualTextError      = { fg = c.error, italic = true },
    LspDiagnosticsVirtualTextWarning    = { fg = c.warning, italic = true },
    LspDiagnosticsVirtualTextInformation = { fg = c.info, italic = true },
    LspDiagnosticsVirtualTextHint       = { fg = c.hint, italic = true },
    LspDiagnosticsUnderlineError        = { undercurl = true, sp = c.error },
    LspDiagnosticsUnderlineWarning      = { undercurl = true, sp = c.warning },
    LspDiagnosticsUnderlineInformation  = { undercurl = true, sp = c.info },
    LspDiagnosticsUnderlineHint         = { undercurl = true, sp = c.hint },

    -- =========================================================================
    -- LSP Semantic Tokens
    -- =========================================================================
    ["@lsp.type.boolean"]                       = { link = "@boolean" },
    ["@lsp.type.builtinType"]                   = { link = "@type.builtin" },
    ["@lsp.type.class"]                         = { link = "@type" },
    ["@lsp.type.comment"]                       = { link = "@comment" },
    ["@lsp.type.decorator"]                     = { link = "@attribute" },
    ["@lsp.type.deriveHelper"]                  = { link = "@attribute" },
    ["@lsp.type.enum"]                          = { link = "@type" },
    ["@lsp.type.enumMember"]                    = { fg = c.constant },
    ["@lsp.type.escapeSequence"]                = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"]               = { fg = c.number },
    ["@lsp.type.function"]                      = { link = "@function" },
    ["@lsp.type.generic"]                       = { link = "@variable" },
    ["@lsp.type.interface"]                     = { fg = c.type },
    ["@lsp.type.keyword"]                       = { link = "@keyword" },
    ["@lsp.type.lifetime"]                      = { link = "@keyword.storage" },
    ["@lsp.type.macro"]                         = { link = "@function.macro" },
    ["@lsp.type.method"]                        = { link = "@function.method" },
    ["@lsp.type.namespace"]                     = { link = "@module" },
    ["@lsp.type.number"]                        = { link = "@number" },
    ["@lsp.type.operator"]                      = { link = "@operator" },
    ["@lsp.type.parameter"]                     = { link = "@variable.parameter" },
    ["@lsp.type.property"]                      = { link = "@property" },
    ["@lsp.type.selfKeyword"]                   = { link = "@variable.builtin" },
    ["@lsp.type.selfTypeKeyword"]               = { link = "@variable.builtin" },
    ["@lsp.type.string"]                        = { link = "@string" },
    ["@lsp.type.struct"]                        = { link = "@type" },
    ["@lsp.type.type"]                          = { link = "@type" },
    ["@lsp.type.typeAlias"]                     = { link = "@type.definition" },
    ["@lsp.type.typeParameter"]                 = { fg = c.type },
    ["@lsp.type.unresolvedReference"]           = { undercurl = true, sp = c.error },
    ["@lsp.type.variable"]                      = {}, -- let treesitter handle variables

    -- semantic token modifiers
    ["@lsp.typemod.class.defaultLibrary"]       = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"]        = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"]  = { link = "@constant.builtin" },
    ["@lsp.typemod.function.builtin"]           = { link = "@function.builtin" },
    ["@lsp.typemod.function.defaultLibrary"]    = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"]              = { link = "@keyword.coroutine" },
    ["@lsp.typemod.keyword.injected"]           = { link = "@keyword" },
    ["@lsp.typemod.macro.defaultLibrary"]       = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"]      = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"]          = { link = "@operator" },
    ["@lsp.typemod.string.injected"]            = { link = "@string" },
    ["@lsp.typemod.struct.defaultLibrary"]      = { link = "@type.builtin" },
    ["@lsp.typemod.type.defaultLibrary"]        = { link = "@type.builtin" },
    ["@lsp.typemod.typeAlias.defaultLibrary"]   = { link = "@type.builtin" },
    ["@lsp.typemod.variable.callable"]          = { link = "@function" },
    ["@lsp.typemod.variable.defaultLibrary"]    = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"]          = { link = "@variable" },
    ["@lsp.typemod.variable.static"]            = { link = "@constant" },

    -- =========================================================================
    -- Git
    -- =========================================================================
    Added                   = { fg = c.git_add },
    Changed                 = { fg = c.git_change },
    Removed                 = { fg = c.git_delete },
    DiffAdd                 = { bg = c.diff_add_bg },
    DiffChange              = { bg = c.diff_change_bg },
    DiffDelete              = { bg = c.diff_delete_bg },
    DiffText                = { fg = c.fg, bg = c.selection },
    diffAdded               = { fg = c.git_add },
    diffRemoved             = { fg = c.git_delete },
    diffChanged             = { fg = c.git_change },
    diffOldFile             = { fg = c.type },
    diffNewFile             = { fg = c.string },
    diffFile                = { fg = c.func, bold = true },
    diffLine                = { fg = c.comment },
    diffIndexLine           = { fg = c.fg_dim },

    -- =========================================================================
    -- nvim-cmp
    -- =========================================================================
    CmpItemAbbr             = { fg = c.fg },
    CmpItemAbbrDeprecated   = { fg = c.fg_dim, strikethrough = true },
    CmpItemAbbrMatch        = { fg = c.func, bold = true },
    CmpItemAbbrMatchFuzzy   = { fg = c.func },
    CmpItemKind             = { fg = c.type },
    CmpItemMenu             = { fg = c.comment },
    CmpItemKindText         = { fg = c.fg },
    CmpItemKindMethod       = { fg = c.func },
    CmpItemKindFunction     = { fg = c.func },
    CmpItemKindConstructor  = { fg = c.type },
    CmpItemKindField        = { fg = c.fg },
    CmpItemKindVariable     = { fg = c.fg },
    CmpItemKindClass        = { fg = c.type },
    CmpItemKindInterface    = { fg = c.type },
    CmpItemKindModule       = { fg = c.type },
    CmpItemKindProperty     = { fg = c.fg },
    CmpItemKindUnit         = { fg = c.number },
    CmpItemKindValue        = { fg = c.constant },
    CmpItemKindEnum         = { fg = c.type },
    CmpItemKindKeyword      = { fg = c.keyword },
    CmpItemKindSnippet      = { fg = c.string },
    CmpItemKindColor        = { fg = c.number },
    CmpItemKindFile         = { fg = c.fg },
    CmpItemKindReference    = { fg = c.hint },
    CmpItemKindFolder       = { fg = c.func },
    CmpItemKindEnumMember   = { fg = c.constant },
    CmpItemKindConstant     = { fg = c.constant },
    CmpItemKindStruct       = { fg = c.type },
    CmpItemKindEvent        = { fg = c.number },
    CmpItemKindOperator     = { fg = c.operator },
    CmpItemKindTypeParameter = { fg = c.type },

    -- =========================================================================
    -- Telescope
    -- =========================================================================
    TelescopeNormal           = { fg = c.fg },
    TelescopeBorder           = { fg = c.comment },
    TelescopePromptBorder     = { fg = c.comment },
    TelescopePromptNormal     = { fg = c.fg },
    TelescopePromptPrefix     = { fg = c.keyword },
    TelescopePromptTitle      = { fg = c.fg_dim },
    TelescopePreviewTitle     = { fg = c.fg_dim },
    TelescopeResultsTitle     = { fg = c.fg_dim },
    TelescopeMatching         = { fg = c.func, bold = true },
    TelescopeSelection        = { fg = c.fg, bg = c.selection },
    TelescopeSelectionCaret   = { fg = c.keyword, bg = c.selection },
    TelescopeMultiSelection   = { fg = c.type, bg = c.selection },
    TelescopePreviewMatch     = { fg = c.bg, bg = c.type },

    -- =========================================================================
    -- gitsigns.nvim
    -- =========================================================================
    GitSignsAdd               = { fg = c.git_add },
    GitSignsChange            = { fg = c.git_change },
    GitSignsDelete            = { fg = c.git_delete },
    GitSignsAddNr             = { fg = c.git_add },
    GitSignsChangeNr          = { fg = c.git_change },
    GitSignsDeleteNr          = { fg = c.git_delete },
    GitSignsAddLn             = { bg = c.diff_add_bg },
    GitSignsChangeLn          = { bg = c.diff_change_bg },
    GitSignsDeleteLn          = { bg = c.diff_delete_bg },
    GitSignsAddPreview        = { fg = c.git_add, bg = c.diff_add_bg },
    GitSignsDeletePreview     = { fg = c.git_delete, bg = c.diff_delete_bg },
    GitSignsCurrentLineBlame  = { fg = c.comment, italic = true },

    -- =========================================================================
    -- which-key.nvim
    -- =========================================================================
    WhichKey                  = { fg = c.func },
    WhichKeyGroup             = { fg = c.type },
    WhichKeyDesc              = { fg = c.fg },
    WhichKeySeparator         = { fg = c.comment },
    WhichKeyFloat             = { bg = c.bg_alt },
    WhichKeyBorder            = { fg = c.comment },
    WhichKeyValue             = { fg = c.fg_dim },

    -- =========================================================================
    -- nvim-tree
    -- =========================================================================
    NvimTreeNormal              = { fg = c.fg, bg = c.bg_alt },
    NvimTreeNormalNC            = { fg = c.fg_dim, bg = c.bg_alt },
    NvimTreeRootFolder          = { fg = c.func, bold = true },
    NvimTreeFolderName          = { fg = c.func },
    NvimTreeFolderIcon          = { fg = c.func },
    NvimTreeOpenedFolderName    = { fg = c.func, italic = true },
    NvimTreeEmptyFolderName     = { fg = c.fg_dim },
    NvimTreeFileName            = { fg = c.fg },
    NvimTreeSpecialFile         = { fg = c.type },
    NvimTreeExecFile            = { fg = c.string },
    NvimTreeSymlink             = { fg = c.hint },
    NvimTreeGitDirty            = { fg = c.git_change },
    NvimTreeGitStaged           = { fg = c.git_add },
    NvimTreeGitDeleted          = { fg = c.git_delete },
    NvimTreeGitNew              = { fg = c.git_add },
    NvimTreeGitMerge            = { fg = c.warning },
    NvimTreeGitRenamed          = { fg = c.git_change },
    NvimTreeGitIgnored          = { fg = c.comment },
    NvimTreeIndentMarker        = { fg = c.border },
    NvimTreeWinSeparator        = { fg = c.border, bg = c.bg_alt },
    NvimTreeCursorLine          = { bg = c.cursorline },
    NvimTreeEndOfBuffer         = { fg = c.bg_alt },

    -- =========================================================================
    -- neo-tree.nvim
    -- =========================================================================
    NeoTreeNormal               = { fg = c.fg, bg = c.bg_alt },
    NeoTreeNormalNC             = { fg = c.fg_dim, bg = c.bg_alt },
    NeoTreeRootName             = { fg = c.func, bold = true },
    NeoTreeDirectoryName        = { fg = c.func },
    NeoTreeDirectoryIcon        = { fg = c.func },
    NeoTreeFileName             = { fg = c.fg },
    NeoTreeFileIcon             = { fg = c.fg_dim },
    NeoTreeFileNameOpened       = { fg = c.string, italic = true },
    NeoTreeSymbolicLinkTarget   = { fg = c.hint },
    NeoTreeGitAdded             = { fg = c.git_add },
    NeoTreeGitConflict          = { fg = c.warning },
    NeoTreeGitDeleted           = { fg = c.git_delete },
    NeoTreeGitIgnored           = { fg = c.comment },
    NeoTreeGitModified          = { fg = c.git_change },
    NeoTreeGitStaged            = { fg = c.git_add },
    NeoTreeGitUnstaged          = { fg = c.git_change },
    NeoTreeGitUntracked         = { fg = c.string },
    NeoTreeIndentMarker         = { fg = c.border },
    NeoTreeCursorLine           = { bg = c.cursorline },
    NeoTreeDotfile              = { fg = c.comment },
    NeoTreeFloatBorder          = { link = "FloatBorder" },
    NeoTreeFloatTitle           = { link = "FloatTitle" },

    -- =========================================================================
    -- indent-blankline (v3 = IblIndent, v2 = IndentBlankline*)
    -- =========================================================================
    IblIndent                         = { fg = c.border },
    IblScope                          = { fg = c.comment },
    IblWhitespace                     = { fg = c.border },
    IndentBlanklineChar               = { fg = c.border },
    IndentBlanklineContextChar        = { fg = c.comment },
    IndentBlanklineSpaceChar          = { fg = c.border },
    IndentBlanklineSpaceCharBlankline = { fg = c.border },

    -- =========================================================================
    -- mini.nvim
    -- =========================================================================
    MiniStatuslineModeNormal    = { fg = c.bg, bg = c.func, bold = true },
    MiniStatuslineModeInsert    = { fg = c.bg, bg = c.string, bold = true },
    MiniStatuslineModeVisual    = { fg = c.bg, bg = c.keyword, bold = true },
    MiniStatuslineModeReplace   = { fg = c.bg, bg = c.number, bold = true },
    MiniStatuslineModeCommand   = { fg = c.bg, bg = c.type, bold = true },
    MiniStatuslineModeOther     = { fg = c.bg, bg = c.fg_dim, bold = true },
    MiniStatuslineFilename      = { fg = c.fg, bg = c.surface },
    MiniStatuslineFileinfo      = { fg = c.fg_dim, bg = c.surface },
    MiniStatuslineDevinfo       = { fg = c.fg_dim, bg = c.border },
    MiniStatuslineInactive      = { fg = c.fg_dim, bg = c.bg_alt },
    MiniTablineCurrent          = { fg = c.fg, bg = c.bg, bold = true },
    MiniTablineVisible          = { fg = c.fg_dim, bg = c.surface },
    MiniTablineHidden           = { fg = c.comment, bg = c.bg_alt },
    MiniTablineModifiedCurrent  = { fg = c.warning, bg = c.bg, bold = true },
    MiniTablineModifiedVisible  = { fg = c.warning, bg = c.surface },
    MiniTablineModifiedHidden   = { fg = c.warning, bg = c.bg_alt },
    MiniTablineTabpagesection   = { fg = c.bg, bg = c.func, bold = true },
    MiniTablineFill             = { bg = c.bg_alt },
    MiniCursorword              = { bg = c.surface },
    MiniCursorwordCurrent       = { bg = c.surface },
    MiniIndentscopeSymbol       = { fg = c.comment },
    MiniIndentscopePrefix       = { fg = c.border },
    MiniJump                    = { fg = c.bg, bg = c.keyword, bold = true },
    MiniJump2dSpot              = { fg = c.keyword, bold = true, underline = true },
    MiniJump2dSpotAhead         = { fg = c.type, bold = true },
    MiniJump2dSpotUnique        = { fg = c.string, bold = true },
    MiniJump2dDim               = { fg = c.comment },
    MiniPickBorder              = { link = "FloatBorder" },
    MiniPickBorderBusy          = { fg = c.warning },
    MiniPickBorderText          = { fg = c.fg_dim },
    MiniPickHeader              = { fg = c.func, bold = true },
    MiniPickIconDirectory       = { fg = c.func },
    MiniPickIconFile            = { fg = c.fg },
    MiniPickMatchCurrent        = { bg = c.selection },
    MiniPickMatchMarked         = { fg = c.type, bg = c.selection },
    MiniPickMatchRanges         = { fg = c.func, bold = true },
    MiniPickNormal              = { link = "NormalFloat" },
    MiniPickPreviewLine         = { bg = c.cursorline },
    MiniPickPreviewRegion       = { link = "Visual" },
    MiniPickPrompt              = { fg = c.func },
    MiniNotifyBorder            = { link = "FloatBorder" },
    MiniNotifyNormal            = { link = "NormalFloat" },
    MiniNotifyTitle             = { link = "FloatTitle" },
    MiniDiffSignAdd             = { fg = c.git_add },
    MiniDiffSignChange          = { fg = c.git_change },
    MiniDiffSignDelete          = { fg = c.git_delete },
    MiniDiffOverAdd             = { bg = c.diff_add_bg },
    MiniDiffOverChange          = { bg = c.diff_change_bg },
    MiniDiffOverDelete          = { bg = c.diff_delete_bg },
    MiniDiffOverContext         = { bg = c.surface },
    MiniHipatternsFixme         = { fg = c.bg, bg = c.error, bold = true },
    MiniHipatternsTodo          = { fg = c.bg, bg = c.warning, bold = true },
    MiniHipatternsNote          = { fg = c.bg, bg = c.hint, bold = true },
    MiniHipatternsHack          = { fg = c.bg, bg = c.number, bold = true },
    MiniStarterCurrent          = { fg = c.keyword, bold = true },
    MiniStarterFooter           = { fg = c.comment, italic = true },
    MiniStarterHeader           = { fg = c.func, bold = true },
    MiniStarterInactive         = { fg = c.comment },
    MiniStarterItem             = { fg = c.fg },
    MiniStarterItemBullet       = { fg = c.func },
    MiniStarterItemPrefix       = { fg = c.keyword, bold = true },
    MiniStarterSection          = { fg = c.type, bold = true },
    MiniStarterQuery            = { fg = c.string },
    MiniSurround                = { fg = c.bg, bg = c.type },
    MiniClueDescGroup           = { fg = c.type },
    MiniClueDescSingle          = { fg = c.fg },
    MiniClueNextKey             = { fg = c.func, bold = true },
    MiniClueNextKeyWithPostkeys = { fg = c.keyword, bold = true },
    MiniClueSeparator           = { fg = c.comment },
    MiniClueTitle               = { link = "FloatTitle" },
    MiniMapNormal               = { link = "NormalFloat" },
    MiniMapSymbolCount          = { fg = c.fg_dim },
    MiniMapSymbolLine           = { fg = c.comment },
    MiniMapSymbolView           = { fg = c.func },
    MiniOperatorsExchangeFrom   = { link = "Visual" },
    MiniTestEmphasis            = { bold = true },
    MiniTestFail                = { fg = c.error, bold = true },
    MiniTestPass                = { fg = c.git_add, bold = true },
    MiniTrailspace              = { bg = c.error },

    -- =========================================================================
    -- Noice
    -- =========================================================================
    NoiceCmdline            = { fg = c.fg, bg = c.surface },
    NoiceCmdlineIcon        = { fg = c.func },
    NoiceCmdlineIconSearch  = { fg = c.type },
    NoiceCmdlinePopup       = { fg = c.fg, bg = c.bg_alt },
    NoiceCmdlinePopupBorder = { link = "FloatBorder" },
    NoiceCmdlinePopupTitle  = { link = "FloatTitle" },
    NoiceConfirmBorder      = { link = "FloatBorder" },
    NoiceFormatTitle        = { fg = c.func, bold = true },
    NoiceLspProgressClient  = { fg = c.func },
    NoiceLspProgressSpinner = { fg = c.type },
    NoiceLspProgressTitle   = { fg = c.fg_dim },
    NoiceMini               = { fg = c.fg, bg = c.surface },
    NoicePopup              = { link = "NormalFloat" },
    NoicePopupBorder        = { link = "FloatBorder" },
    NoiceScrollbar          = { bg = c.surface },
    NoiceScrollbarThumb     = { bg = c.fg_dim },
    NoiceSplit              = { fg = c.fg, bg = c.bg },
    NoiceSplitBorder        = { link = "WinSeparator" },

    -- =========================================================================
    -- Snacks.nvim
    -- =========================================================================
    SnacksNormal            = { link = "NormalFloat" },
    SnacksPicker            = { link = "Normal" },
    SnacksBackdrop          = { bg = c.bg, fg = c.fg_dim },
    SnacksPickerBorder      = { fg = c.comment },
    SnacksPickerTitle       = { fg = c.fg_dim },
    SnacksPickerMatch       = { fg = c.func, bold = true },
    SnacksPickerSelected    = { fg = c.fg, bg = c.selection },
    SnacksInputBorder       = { fg = c.comment },
    SnacksInputTitle        = { fg = c.fg_dim },
    SnacksDashboardFooter   = { fg = c.comment, italic = true },
    SnacksDashboardHeader   = { fg = c.func, bold = true },
    SnacksDashboardIcon     = { fg = c.func },
    SnacksDashboardKey      = { fg = c.keyword, bold = true },
    SnacksDashboardDesc     = { fg = c.fg },
    SnacksDashboardDir      = { fg = c.fg_dim },
    SnacksDashboardSection  = { fg = c.type, bold = true },
    SnacksDashboardSpecial  = { fg = c.type },
    SnacksDashboardTerminal = { fg = c.string },

    -- =========================================================================
    -- vim-illuminate
    -- =========================================================================
    IlluminatedWordText   = { bg = c.surface },
    IlluminatedWordRead   = { bg = c.surface },
    IlluminatedWordWrite  = { bg = c.surface },

    -- =========================================================================
    -- rainbow-delimiters
    -- =========================================================================
    RainbowDelimiterRed    = { fg = c.keyword },
    RainbowDelimiterYellow = { fg = c.type },
    RainbowDelimiterBlue   = { fg = c.func },
    RainbowDelimiterOrange = { fg = c.number },
    RainbowDelimiterGreen  = { fg = c.string },
    RainbowDelimiterViolet = { fg = c.constant },
    RainbowDelimiterCyan   = { fg = c.operator },

    -- =========================================================================
    -- Bufferline
    -- =========================================================================
    BufferLineBackground        = { fg = c.fg_dim, bg = c.bg_alt },
    BufferLineFill              = { bg = c.bg_alt },
    BufferLineBufferSelected    = { fg = c.fg, bg = c.bg, bold = true },
    BufferLineBufferVisible     = { fg = c.fg_dim, bg = c.surface },
    BufferLineCloseButton       = { fg = c.fg_dim, bg = c.bg_alt },
    BufferLineCloseButtonSelected = { fg = c.error, bg = c.bg },
    BufferLineModified          = { fg = c.warning, bg = c.bg_alt },
    BufferLineModifiedSelected  = { fg = c.warning, bg = c.bg },
    BufferLineSeparator         = { fg = c.border, bg = c.bg_alt },
    BufferLineSeparatorSelected = { fg = c.border, bg = c.bg },
    BufferLineTab               = { fg = c.fg_dim, bg = c.bg_alt },
    BufferLineTabSelected       = { fg = c.fg, bg = c.bg, bold = true },
    BufferLineIndicatorSelected = { fg = c.func, bg = c.bg },

    -- =========================================================================
    -- Dashboard / Alpha
    -- =========================================================================
    AlphaHeader     = { fg = c.func },
    AlphaButtons    = { fg = c.keyword },
    AlphaShortcut   = { fg = c.type },
    AlphaFooter     = { fg = c.comment, italic = true },
    DashboardHeader = { fg = c.func },
    DashboardCenter = { fg = c.fg },
    DashboardShortcut = { fg = c.type },
    DashboardFooter = { fg = c.comment, italic = true },

    -- =========================================================================
    -- Trouble.nvim
    -- =========================================================================
    TroubleNormal       = { fg = c.fg, bg = c.bg_alt },
    TroubleText         = { fg = c.fg },
    TroubleCount        = { fg = c.keyword, bg = c.surface },
    TroubleError        = { fg = c.error },
    TroubleWarning      = { fg = c.warning },
    TroubleHint         = { fg = c.hint },
    TroubleInformation  = { fg = c.info },
    TroubleFile         = { fg = c.func },
    TroubleLocation     = { fg = c.comment },
    TroubleSource       = { fg = c.fg_dim },

    -- =========================================================================
    -- Neogit
    -- =========================================================================
    NeogitBranch            = { fg = c.keyword, bold = true },
    NeogitRemote            = { fg = c.func },
    NeogitHunkHeader        = { fg = c.fg, bg = c.surface },
    NeogitHunkHeaderHighlight = { fg = c.fg, bg = c.selection, bold = true },
    NeogitDiffContextHighlight = { bg = c.bg_alt },
    NeogitDiffDeleteHighlight = { fg = c.git_delete, bg = c.diff_delete_bg },
    NeogitDiffAddHighlight  = { fg = c.git_add, bg = c.diff_add_bg },
    NeogitNotificationInfo  = { fg = c.info },
    NeogitNotificationWarning = { fg = c.warning },
    NeogitNotificationError = { fg = c.error },

    -- =========================================================================
    -- Navic
    -- =========================================================================
    NavicIconsFile          = { fg = c.fg },
    NavicIconsModule        = { fg = c.type },
    NavicIconsNamespace     = { fg = c.type },
    NavicIconsPackage       = { fg = c.type },
    NavicIconsClass         = { fg = c.type },
    NavicIconsMethod        = { fg = c.func },
    NavicIconsProperty      = { fg = c.fg },
    NavicIconsField         = { fg = c.fg },
    NavicIconsConstructor   = { fg = c.type },
    NavicIconsEnum          = { fg = c.type },
    NavicIconsInterface     = { fg = c.type },
    NavicIconsFunction      = { fg = c.func },
    NavicIconsVariable      = { fg = c.fg },
    NavicIconsConstant      = { fg = c.constant },
    NavicIconsString        = { fg = c.string },
    NavicIconsNumber        = { fg = c.number },
    NavicIconsBoolean       = { fg = c.constant },
    NavicIconsArray         = { fg = c.fg },
    NavicIconsObject        = { fg = c.type },
    NavicIconsKey           = { fg = c.keyword },
    NavicIconsNull          = { fg = c.fg_dim },
    NavicIconsEnumMember    = { fg = c.constant },
    NavicIconsStruct        = { fg = c.type },
    NavicIconsEvent         = { fg = c.number },
    NavicIconsOperator      = { fg = c.operator },
    NavicIconsTypeParameter = { fg = c.type },
    NavicText               = { fg = c.fg_dim },
    NavicSeparator          = { fg = c.comment },

    -- =========================================================================
    -- Fidget
    -- =========================================================================
    FidgetTitle   = { fg = c.func, bold = true },
    FidgetTask    = { fg = c.fg_dim },

    -- =========================================================================
    -- Markdown
    -- =========================================================================
    markdownH1                = { fg = c.keyword, bold = true },
    markdownH2                = { fg = c.func, bold = true },
    markdownH3                = { fg = c.type, bold = true },
    markdownH4                = { fg = c.string, bold = true },
    markdownH5                = { fg = c.constant, bold = true },
    markdownH6                = { fg = c.fg_dim, bold = true },
    markdownHeadingDelimiter  = { fg = c.comment },
    markdownCode              = { fg = c.constant, bg = c.surface },
    markdownCodeBlock         = { fg = c.constant },
    markdownBlockquote        = { fg = c.comment, italic = true },
    markdownBold              = { bold = true },
    markdownItalic            = { italic = true },
    markdownBoldItalic        = { bold = true, italic = true },
    markdownStrike            = { strikethrough = true },
    markdownLinkText          = { fg = c.hint, underline = true },
    markdownUrl               = { fg = c.hint, underline = true, italic = true },
    markdownListMarker        = { fg = c.keyword },
    markdownOrderedListMarker = { fg = c.keyword },
    markdownRule              = { fg = c.border },
    markdownFootnote          = { fg = c.fg_dim },
    markdownId                = { fg = c.comment },
    markdownIdDeclaration     = { fg = c.func },

    -- =========================================================================
    -- render-markdown.nvim
    -- =========================================================================
    RenderMarkdownH1          = { fg = c.keyword, bg = c.md_h1_bg, bold = true },
    RenderMarkdownH2          = { fg = c.func, bg = c.md_h2_bg, bold = true },
    RenderMarkdownH3          = { fg = c.type, bg = c.md_h3_bg, bold = true },
    RenderMarkdownH4          = { fg = c.string, bg = c.md_h4_bg, bold = true },
    RenderMarkdownH5          = { fg = c.constant, bg = c.md_h4_bg, bold = true },
    RenderMarkdownH6          = { fg = c.fg_dim, bg = c.surface, bold = true },
    RenderMarkdownH1Bg        = { bg = c.md_h1_bg },
    RenderMarkdownH2Bg        = { bg = c.md_h2_bg },
    RenderMarkdownH3Bg        = { bg = c.md_h3_bg },
    RenderMarkdownH4Bg        = { bg = c.md_h4_bg },
    RenderMarkdownH5Bg        = { bg = c.md_h4_bg },
    RenderMarkdownH6Bg        = { bg = c.surface },
    RenderMarkdownCode        = { bg = c.surface },
    RenderMarkdownCodeInline  = { fg = c.constant, bg = c.surface },
    RenderMarkdownBullet      = { fg = c.keyword },
    RenderMarkdownChecked     = { fg = c.git_add },
    RenderMarkdownUnchecked   = { fg = c.fg_dim },
    RenderMarkdownTableHead   = { fg = c.func, bold = true },
    RenderMarkdownTableRow    = { fg = c.fg },
    RenderMarkdownTableFill   = { fg = c.border },
    RenderMarkdownQuote       = { fg = c.comment, italic = true },
    RenderMarkdownLink        = { fg = c.hint, underline = true },
    RenderMarkdownMath        = { fg = c.number },
    RenderMarkdownSign        = { fg = c.fg_dim },
    RenderMarkdownDash        = { fg = c.border },
  }

  set_highlights(groups)

end

return M
