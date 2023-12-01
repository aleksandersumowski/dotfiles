return {
    -- Add the community repository of plugin specifications
    "AstroNvim/astrocommunity",
    -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

    {import = "astrocommunity.pack.clojure"},
    {import = "astrocommunity.pack.terraform"},
    {import = "astrocommunity.project.nvim-spectre"},
    {import = "astrocommunity.motion.mini-surround"},
    {import = "astrocommunity.motion.leap-nvim"},
    {import = "astrocommunity.motion.flit-nvim"}
}
