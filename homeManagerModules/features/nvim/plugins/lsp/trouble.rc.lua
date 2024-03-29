local trouble = require("trouble")
trouble.setup({
    icons = false,
})

vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>TroubleToggle<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "[t", function()
    trouble.next({ skip_groups = true, jump = true })
end)

vim.keymap.set("n", "]t", function()
    trouble.previous({ skip_groups = true, jump = true })
end)

vim.api.nvim_set_keymap(
    "n",
    "<leader>xx",
    "<cmd>TroubleToggle diagnostics<cr>",
    { noremap = true, silent = true, desc = "Diagnostics (Trouble)" }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>xX",
    "<cmd>TroubleToggle diagnostics buf=0<cr>",
    { noremap = true, silent = true, desc = "Buffer Diagnostics (Trouble)" }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>cs",
    "<cmd>TroubleToggle symbols focus=false<cr>",
    { noremap = true, silent = true, desc = "Symbols (Trouble)" }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>cl",
    "<cmd>TroubleToggle lsp focus=false win.position=right<cr>",
    { noremap = true, silent = true, desc = "LSP Definitions / references / ... (Trouble)" }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>xL",
    "<cmd>TroubleToggle loclist<cr>",
    { noremap = true, silent = true, desc = "Location List (Trouble)" }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>xQ",
    "<cmd>TroubleToggle qflist<cr>",
    { noremap = true, silent = true, desc = "Quickfix List (Trouble)" }
)
