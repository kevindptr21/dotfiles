return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP completions
        { name = "path" }, -- File path completions
        { name = "buffer", keyword_length = 3 }, -- Buffer completions (only after 3 chars)
      })

      opts.performance = {
        debounce = 100, -- Slight delay to reduce event spam
        throttle = 50, -- Throttle requests
      }

      return opts
    end,
  },
}
