-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

-- helper for binds
local nmap = function(bufnr, keys, func, desc)
    if desc then
        desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
end

local on_attach = function(client, bufnr)
    nmap(bufnr, "gr", "<cmd>Lspsaga finder ref<CR>")
    nmap(bufnr, "<leader>sd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    nmap(bufnr, "<leader>sD", "<cmd>Lspsaga finder def<CR>")
    nmap(bufnr, "<leader>sI", "<cmd>Lspsaga finder imp<CR>")
    nmap(bufnr, "<leader>sa", "<cmd>Lspsaga code_action<CR>")
    nmap(bufnr, "<leader>sr", "<cmd>Lspsaga rename ++project<CR>")
    nmap(bufnr, "<leader>d", "<cmd>Lspsaga finder tyd<CR>")
    nmap(bufnr, "<leader>sp", "<cmd>Lspsaga peek_definition<CR>")

    -- Diagnostic
    nmap(bufnr, "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
    nmap(bufnr, "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
    nmap(bufnr, "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    nmap(bufnr, "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

    -- Toggle Outline
    nmap(bufnr, "<leader>su", "<cmd>Lspsaga outline<CR>")

    -- Callhierarchy
    nmap(bufnr, "<leader>si", "<cmd>Lspsaga incoming_calls<CR>")
    nmap(bufnr, "<leader>so", "<cmd>Lspsaga outgoing_calls<CR>")
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
-- vim.keymap.set("n", "[e", vim.diagnostic.goto_prev)
-- vim.keymap.set("n", "]e", vim.diagnostic.goto_next)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
-- 	callback = function(ev)
-- 		-- Buffer local mappings.
-- 		-- See `:help vim.lsp.*` for documentation on any of the below functions
-- 		local opts = { buffer = ev.buf }
-- 		vim.keymap.set("n", "<leader>sD", vim.lsp.buf.declaration, opts)
-- 		vim.keymap.set("n", "<leader>sd", vim.lsp.buf.definition, opts)
-- 		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- 		vim.keymap.set("n", "<leader>si", vim.lsp.buf.implementation, opts)
-- 		vim.keymap.set("n", "<leader>sr", vim.lsp.buf.references, opts)
-- 		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
-- 		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
-- 		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
-- 		vim.keymap.set("n", "<space>wl", function()
-- 			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- 		end, opts)
-- 		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
-- 		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
-- 		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
-- 		vim.keymap.set("n", "<space>f", function()
-- 			vim.lsp.buf.format({ async = true })
-- 		end, opts)
-- 	end,
-- })

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
-- lspconfig["tsserver"].setup({
-- 	capabilities = capabilities,
-- })
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
