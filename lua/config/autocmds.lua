-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Kill LazyVim's auto spell-check on markdown/text/gitcommit.
-- It runs on VeryLazy, so we schedule the deletion after setup.
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    pcall(vim.api.nvim_del_augroup_by_name, "lazyvim_wrap_spell")
  end,
})

-- Belt-and-suspenders: force spell off on the filetypes LazyVim re-enables it on.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "gitcommit", "text" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

local function set_prisma_highlights()
  vim.api.nvim_set_hl(0, "@keyword.prisma", { link = "Keyword" })
  vim.api.nvim_set_hl(0, "@attribute.prisma", { link = "Function" })
  vim.api.nvim_set_hl(0, "@type.prisma", { link = "Type" })
  vim.api.nvim_set_hl(0, "@type.definition.prisma", { link = "Structure" })
  vim.api.nvim_set_hl(0, "@string.prisma", { link = "String" })
  vim.api.nvim_set_hl(0, "@number.prisma", { link = "Number" })
  vim.api.nvim_set_hl(0, "@property.prisma", { link = "Identifier" })
  vim.api.nvim_set_hl(0, "@comment.prisma", { link = "Comment" })

  vim.api.nvim_set_hl(0, "prismaKeyword", { link = "Keyword" })
  vim.api.nvim_set_hl(0, "prismaType", { link = "Type" })
  vim.api.nvim_set_hl(0, "prismaAttribute", { link = "Function" })
  vim.api.nvim_set_hl(0, "prismaString", { link = "String" })
  vim.api.nvim_set_hl(0, "prismaFunction", { link = "Function" })
end

vim.api.nvim_create_autocmd({ "ColorScheme", "FileType" }, {
  pattern = { "*", "prisma" },
  callback = function(args)
    if args.event == "ColorScheme" or vim.bo[args.buf].filetype == "prisma" then
      set_prisma_highlights()
    end
  end,
})
