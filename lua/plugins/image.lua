return {
  {
    "3rd/image.nvim",
    cond = function()
      return vim.g.neovide == nil
    end,
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" },
        },
      },
      max_width_window_percentage = 100,
      max_height_window_percentage = 100,
      window_overlap_clear_enabled = true,
    },
  },
}
