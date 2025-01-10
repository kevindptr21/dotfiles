return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "eslint-lsp",
        "json-lsp",
        "vtsls",
        "prettier",
        -- OLD
        -- "typescript-language-server",
        -- "prettierd"
        -- "eslint_d"
      },
    },
  },
}
