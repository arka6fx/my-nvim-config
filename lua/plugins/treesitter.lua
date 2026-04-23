-- Extra treesitter parsers for a Next.js / Turborepo workflow.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      local extras = {
        "bash",
        "css",
        "diff",
        "dockerfile",
        "git_config",
        "gitcommit",
        "gitignore",
        "graphql",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "regex",
        "scss",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      }
      for _, parser in ipairs(extras) do
        if not vim.tbl_contains(opts.ensure_installed, parser) then
          table.insert(opts.ensure_installed, parser)
        end
      end
    end,
  },
}
