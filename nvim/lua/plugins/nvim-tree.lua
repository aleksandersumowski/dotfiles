return  {
        'nvim-tree/nvim-tree.lua',
        keys = {
                {'<leader>d', ':NvimTreeToggle<CR>'},
                {'<leader>f', ':NvimTreeFindFile<CR>'}
        },
        config = {
                respect_buf_cwd = true,
                update_cwd = true,
                update_focused_file = {
                        enable = true,
                        update_cwd = true
                }
        }
}
