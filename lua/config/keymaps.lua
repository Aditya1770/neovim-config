local map = vim.keymap.set

map("n", "gd", vim.lsp.buf.definition)
map("n", "gr", vim.lsp.buf.references)
map("n", "K", vim.lsp.buf.hover)

map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>ca", vim.lsp.buf.code_action)

map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)

map("n", "<leader>d", vim.diagnostic.open_float)

vim.keymap.set("n", "<leader>r", function()
    vim.cmd("write")

    local ft = vim.bo.filetype

    if ft == "cpp" then
        vim.cmd("split | terminal g++ % -std=c++17 -O2 -o %:r && ./%:r")
    elseif ft == "c" then
        vim.cmd("split | terminal gcc % -o %:r && ./%:r")
    elseif ft == "python" then
        vim.cmd("split | terminal python %")
    elseif ft == "java" then
        vim.cmd("split | terminal javac % && java %:r")
    end
end)

vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")

vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>")
