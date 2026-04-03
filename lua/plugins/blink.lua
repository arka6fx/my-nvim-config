return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",

        ["<CR>"] = { "accept", "fallback" }, -- FIX: enable Enter
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<C-Space>"] = { "show", "fallback" },
      },
    },
  },
}
