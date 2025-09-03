local M = {}

M.settings = {
  gopls = {
    -- Analyses
    analyses = {
      unusedparams = true,
      nilness = true,
      unusedwrite = true,
      useany = true,
      fillreturns = true,
      nonewvars = true,
      noresultvalues = true,
      undeclaredname = true,
      fillstruct = true,
      composites = true,
      ineffassign = true,
      lostcancel = true,
      printf = true,
      range = true,
      shadow = true,
      simplifycompositelit = true,
      simplifyrange = true,
      simplifyslice = true,
      sortimports = true,
      structtag = true,
      testinggoroutine = true,
      tests = true,
      unmarshal = true,
      unreachable = true,
      unsafeptr = true,
      unusedresult = true,
      variadic = true,
    },

    -- Completion
    completionDocumentation = true,

    -- Hover
    -- hoverKind = "SynopsisDocumentation",
    hoverKind = "FullDocumentation",

    -- Import organization
    importShortcut = "Both",

    -- Semantic tokens
    semanticTokens = true,

    -- Static check
    staticcheck = true,

    -- Symbol matcher
    symbolMatcher = "fuzzy",

    -- Symbol style
    symbolStyle = "full",

    -- Template support
    templateExtensions = {"gohtml", "gotmpl", "go"},

    -- Use placeholders
    usePlaceholders = true,

    -- Vulncheck
    vulncheck = "off",
  },
}

return M
