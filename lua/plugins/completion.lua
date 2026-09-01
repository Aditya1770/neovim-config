return {
    {
        "saghen/blink.cmp",
        version = "1.*",

        opts = {
            keymap = {
                preset = "super-tab",
            },

            completion = {
                documentation = {
                    auto_show = true,
                },
            },

            sources = {
                default = {
                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                },
            },
        },
    },
}
