return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",

        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "java",
                "python",
                "lua",
                "bash",
                "json",
            },

            highlight = {
                enable = true,
            },

            indent = {
                enable = true,
            },
        },
    },
}
