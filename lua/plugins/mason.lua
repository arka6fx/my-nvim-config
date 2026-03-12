return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- formatters
        "prettier",
        "black",
        "stylua",
        "shfmt",
        "clang-format",

        -- linters
        "eslint_d",
        "shellcheck",
        "flake8",

        -- python helpers
        "isort",
        "autopep8",
        "debugpy",

        -- tools
        "tree-sitter-cli",
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
        "html",
        "jdtls",
        "jsonls",
        "lua_ls",
        "pyright",
        "pylsp",
        "tailwindcss",
        "ts_ls",
        "vimls",
      },
      automatic_installation = true,
    },
  },
}
