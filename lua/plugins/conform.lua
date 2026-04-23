-- Prettier / formatter tuning for web-dev monorepos.
-- The `lazyvim.plugins.extras.formatting.prettier` extra provides the base
-- wiring; this file ensures prettierd is used when available and covers all
-- the filetypes a Next.js / shadcn project touches.
return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      local prettier_fts = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "astro",
        "html",
        "css",
        "scss",
        "less",
        "json",
        "jsonc",
        "yaml",
        "graphql",
        "handlebars",
        "markdown",
        "markdown.mdx",
      }

      for _, ft in ipairs(prettier_fts) do
        opts.formatters_by_ft[ft] = { "prettierd", "prettier", stop_after_first = true }
      end

      -- Lua via stylua (respects `stylua.toml`).
      opts.formatters_by_ft.lua = { "stylua" }

      -- Shell.
      opts.formatters_by_ft.sh = { "shfmt" }
      opts.formatters_by_ft.bash = { "shfmt" }
      opts.formatters_by_ft.zsh = { "shfmt" }

      -- Respect project-local `.prettierrc` / `.prettierignore` without
      -- falling back to a global config.
      opts.formatters = opts.formatters or {}
      opts.formatters.prettier = vim.tbl_deep_extend("force", opts.formatters.prettier or {}, {
        condition = function(_, ctx)
          return vim.fs.find({
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.js",
            ".prettierrc.cjs",
            ".prettierrc.mjs",
            ".prettierrc.yml",
            ".prettierrc.yaml",
            ".prettierrc.toml",
            "prettier.config.js",
            "prettier.config.cjs",
            "prettier.config.mjs",
            "package.json",
          }, { path = ctx.filename, upward = true })[1] ~= nil
        end,
      })

      opts.default_format_opts = vim.tbl_deep_extend("force", opts.default_format_opts or {}, {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
      })
    end,
  },

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      local extras = { "prettierd" }
      for _, tool in ipairs(extras) do
        if not vim.tbl_contains(opts.ensure_installed, tool) then
          table.insert(opts.ensure_installed, tool)
        end
      end
    end,
  },
}
