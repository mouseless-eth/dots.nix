-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

vim.keymap.set("n", "gr", "<cmd>Lspsaga finder ref<CR>")
vim.keymap.set("n", "<leader>sd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "<leader>sD", "<cmd>Lspsaga finder def<CR>")
vim.keymap.set("n", "<leader>sI", "<cmd>Lspsaga finder imp<CR>")
vim.keymap.set("n", "<leader>sa", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "<leader>sr", "<cmd>Lspsaga rename ++project<CR>")
vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga finder tyd<CR>")
vim.keymap.set("n", "<leader>sp", "<cmd>Lspsaga peek_definition<CR>")

-- Diagnostic
vim.keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
vim.keymap.set("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Toggle Outline
vim.keymap.set("n", "<leader>su", "<cmd>Lspsaga outline<CR>")

-- Callhierarchy
vim.keymap.set("n", "<leader>si", "<cmd>Lspsaga incoming_calls<CR>")
vim.keymap.set("n", "<leader>so", "<cmd>Lspsaga outgoing_calls<CR>")

--lspconfig["rust_analyzer"].setup({
--	capabilities = capabilities,
--	settings = {
--		["rust-analyzer"] = {
--			diagnostics = {
--				enable = false,
--			},
--		},
--	},
--})
lspconfig["eslint"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig["docker_compose_language_service"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig["dockerls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
--lspconfig["tsserver"].setup({
--    on_attach = on_attach,
--    capabilities = capabilities,
--})
lspconfig["biome"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

--lspconfig["denols"].setup({
--    capabilities = capabilities,
--})
---- deno related
--vim.g.markdown_fenced_languages = {
--    "ts=typescript",
--}

--lspconfig["solang"].setup({
--	capabilities = capabilities,
--})
lspconfig["solidity_ls_nomicfoundation"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    solidity = {
        cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
        root_dir = "foundry.toml",
    },
})

lspconfig["emmet_ls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "css", "html", "javascript", "javascriptreact", "typescriptreact" },
})
lspconfig["lua_ls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig["nixd"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig["nil_ls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    capabilities = capabilities,
})

--vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
