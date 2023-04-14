-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({ "BufRead","BufNewFile" }, {
  pattern = "*.bb",
  callback = function(args)
    vim.bo.filetype = "clojure"
  end
})
