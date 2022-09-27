-- https://github.com/nvim-telescope/telescope.nvim
local M = {}

local actions = require('telescope.actions')

M.setup = function()
  require("telescope").setup({
    defaults = {
      file_ignore_patterns = { "target", "node_modules", "parser.c" },
      mappings = {
        i = {
          ["<esc>"] = actions.close
        },
      },
    },
    extensions = {}
  })

  require("telescope").load_extension("fzf")
end


return M
