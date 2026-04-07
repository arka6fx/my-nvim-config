return {
  "numToStr/Comment.nvim",
  opts = {
    mappings = {
      basic = true,
      extra = true,
    },
    pre_hook = function(ctx)
      local U = require("Comment.utils")

      local location
      ---@diagnostic disable-next-line: undefined-field
      if ctx.ctype == U.ctype.block then
        location = require("ts_context_commentstring.utils").get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require("ts_context_commentstring.utils").get_visual_start_location()
      end

      local args = {
        ---@diagnostic disable-next-line: undefined-field
        key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      }

      if location then
        args.location = location
      end

      return require("ts_context_commentstring.internal").calculate_commentstring(args)
    end,
  },
}
