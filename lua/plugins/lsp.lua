-- LSP tweaks. The heavy lifting (ts/eslint/tailwind/json/yaml setup) is done
-- by the LazyVim extras listed in `lazyvim.json`. This file only contains
-- server-specific overrides that go beyond the defaults.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
              hint = { enable = true },
            },
          },
        },

        prismals = {},

        -- TS inlay hints + smarter import preferences.
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
              updateImportsOnFileMove = { enabled = "always" },
              suggest = { completeFunctionCalls = true },
            },
          },
        },

        -- Tailwind: pick up configs across a monorepo.
        tailwindcss = {
          root_dir = function(fname)
            return require("lspconfig").util.root_pattern(
              "tailwind.config.js",
              "tailwind.config.cjs",
              "tailwind.config.mjs",
              "tailwind.config.ts",
              "postcss.config.js",
              "postcss.config.cjs",
              "postcss.config.mjs",
              "postcss.config.ts"
            )(fname)
          end,
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                  { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                },
              },
              validate = true,
            },
          },
        },
      },
    },
  },
}
