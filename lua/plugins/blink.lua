return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",
      -- This disables <Enter> for confirming suggestions
      ["<CR>"] = { "fallback" },
      -- Now use <Tab> or <C-y> to accept suggestions
      ["<Tab>"] = { "select_and_accept", "fallback" },
    },
  },
}
