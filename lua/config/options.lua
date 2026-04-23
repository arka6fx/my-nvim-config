-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
-- if vim.g.neovide then
--   -- Lower values = more transparent (0.0 to 1.0)
--   vim.g.neovide_opacity = 0.8
--
--   -- This keeps the floating windows and popups transparent too
--   vim.g.neovide_floating_blur_amount_x = 2.0
--   vim.g.neovide_floating_blur_amount_y = 2.0
--
--   -- Helper for Windows "frosted glass" effect
--   vim.g.neovide_window_blurred = false
-- end
if vim.g.neovide then
  -- This allows Ctrl+v to paste into the Neovim terminal
  vim.keymap.set("t", "<C-v>", '<C-\\><C-n>"+pa', { noremap = true, silent = true })
end

-- Indentation: default 2-space across the repo. .editorconfig / LSP formatters
-- still override per-filetype when they exist.
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Performance: don't let giant node_modules / .next trees flood file watchers
-- or the jumplist.
vim.opt.wildignore:append({
  "*/node_modules/*",
  "*/.next/*",
  "*/.turbo/*",
  "*/dist/*",
  "*/build/*",
  "*/.git/*",
  "*/coverage/*",
  "*/.cache/*",
  "*.lock",
  "pnpm-lock.yaml",
  "package-lock.json",
  "yarn.lock",
})

vim.filetype.add({
  extension = {
    prisma = "prisma",
  },
})

if vim.g.neovide then
  vim.defer_fn(function()
    vim.cmd.colorscheme(vim.g.colors_name)
  end, 100)

  -- Watch the directory since omarchy replaces the symlink
  local w = vim.uv.new_fs_event()
  if w then
    w:start(vim.fn.expand("~/.config/omarchy/current/theme"), {}, function()
      vim.schedule(function()
        vim.defer_fn(function()
          local theme_file = vim.fn.expand("~/.config/omarchy/current/theme/neovim.lua")
          if vim.fn.filereadable(theme_file) == 1 then
            dofile(theme_file)
            vim.defer_fn(function()
              vim.cmd.colorscheme(vim.g.colors_name)
            end, 200)
          end
        end, 300) -- wait for symlink to settle
      end)
    end)
  end
end
