-- https://github.com/nvim-telescope/telescope.nvim

local config = function()
        local actions = require('telescope.actions')
        require("telescope").setup({
                defaults = {
                        file_ignore_patterns = { "target", "node_modules", "parser.c" },
                        mappings = {
                                i = { ["<esc>"] = actions.close },
                        },
                },
                extensions = {}
        })

        require("telescope").load_extension("fzf")
end

return {
        'nvim-telescope/telescope.nvim', config = config, dependencies = {
                'nvim-lua/plenary.nvim',
                {'nvim-telescope/telescope-fzf-native.nvim', branch = 'main', build = 'make' },
        }}
