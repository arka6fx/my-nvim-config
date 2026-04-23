-- Kill all linting / LSP noise in markdown files.
-- We want READMEs and docs to be 100% warning-free with zero config.
return {
  -- Remove the markdown linters that LazyVim's markdown extra registers.
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.markdown = {}
      opts.linters_by_ft["markdown.mdx"] = {}
    end,
  },

  -- marksman (markdown LSP) also emits link / heading warnings; disable it.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = { enabled = false },
      },
      setup = {
        marksman = function()
          return true -- skip lspconfig setup entirely
        end,
      },
    },
  },

  -- Don't let mason auto-install the markdown linter/LSP even if the extra
  -- lists them.
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      local blocked = {
        ["markdownlint"] = true,
        ["markdownlint-cli2"] = true,
        ["markdown-toc"] = true,
        ["marksman"] = true,
      }
      local filtered = {}
      for _, name in ipairs(opts.ensure_installed) do
        if not blocked[name] then
          table.insert(filtered, name)
        end
      end
      opts.ensure_installed = filtered
    end,
  },
}
