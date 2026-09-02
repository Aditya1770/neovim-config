return {
    {
        "stevearc/conform.nvim",

        opts = {
            formatters_by_ft = {
                c = { "clang_format" },
                cpp = { "clang_format" },
                python = { "ruff_format" },
                java = { "google_java_format" },
                lua = { "stylua" },
            },

            formatters = {
                clang_format = {
                    prepend_args = {
                        "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}",
                    },
                },
            },
        },

        config = function(_, opts)
            require("conform").setup(opts)

            vim.keymap.set({ "n", "v" }, "<leader>f", function()
                require("conform").format({
                    async = true,
                    lsp_format = "fallback",
                })
            end, {
                desc = "Format code",
            })
        end,
    },
}
