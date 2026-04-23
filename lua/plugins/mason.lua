return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- formatters
        "prettier",
        "prettierd",
        "stylua",
        "shfmt",
        "black",
        "isort",
        "clang-format",
        "goimports",
        "gofumpt",

        -- linters
        "eslint_d",
        "shellcheck",
        "golangci-lint",

        -- debug / extras
        "debugpy",
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "cssls",
        "css_variables",
        "cssmodules_ls",
        "eslint",
        "gopls",
        "html",
        "jdtls",
        "jsonls",
        "lua_ls",
        "prismals",
        "pyright",
        "tailwindcss",
        "vtsls",
        "vimls",
        "yamlls",
      },
      automatic_installation = true,
    },
  },
}
