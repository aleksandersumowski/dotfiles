return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        update_focused_file = {
          enable = true,
          update_root = true
        },
        actions = {
          open_file = {
            resize_window = false,
          },
        },
      })
    end,
    cmd = { "NvimTreeFindFileToggle" },
    keys = {
      { "<leader>e", function() vim.cmd([[NvimTreeFindFileToggle]]) end, desc = "Show current file in nvim-tree" }
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
}
