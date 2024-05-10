-- Set up lspconfig.
local lspconfig = require("lspconfig")

local map = vim.keymap.set

-- Pretty floaters for all lsp related popups
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
	close_events = { "BufHidden", "InsertLeave" },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.diagnostic.config({
	float = {
		source = "always",
		border = "rounded",
	},
})

function GoToNextDiagnosticAndCodeAction()
	vim.diagnostic.goto_next()
	vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
end

function GoToPrevDiagnosticAndCodeAction()
	vim.diagnostic.goto_prev()
	vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
end

local on_attach = function(client, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end

	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("[d", GoToPrevDiagnosticAndCodeAction, "prev [D]diagnostic")
	nmap("]d", GoToNextDiagnosticAndCodeAction, "next [D]diagnostic")
	nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
	nmap("go", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
	-- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	nmap("gl", vim.diagnostic.open_float, "Open Diagnostic Float")

	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("gs", vim.lsp.buf.signature_help, "Signature Documentation")

	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

	-- setup signature popup
	if client.server_capabilities.signatureHelpProvider then
		map("n", "K", vim.lsp.buf.hover, opts("hover information"))
	end
end

local on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

capabilities = vim.tbl_deep_extend(
	"force",
	vim.lsp.protocol.make_client_capabilities(),
	require("cmp_nvim_lsp").default_capabilities()
)
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false
capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

lspconfig["docker_compose_language_service"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = on_init,
})

lspconfig["dockerls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = on_init,
})

lspconfig["tsserver"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = on_init,
})

--require("typescript-tools").setup({
--	on_attach = on_attach,
--	capabilities = capabilities,
--	on_init = on_init,
--	settings = {
--		expose_as_code_action = {
--			"add_missing_imports",
--		},
--		complete_function_calls = true,
--		tsserver_file_preferences = {
--			includeInlayParameterNameHints = "all",
--			includeCompletionsForModuleExports = true,
--			quotePreference = "auto",
--		},
--		tsserver_format_options = {
--			allowIncompleteCompletions = false,
--			allowRenameOfImportPath = false,
--		},
--	},
--})

-- lspconfig["tsserver"].setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     on_init = on_init,
--
--     init_options = {
--         preferences = {
--             disableSuggestions = true,
--         },
--     },
-- })

lspconfig["solidity_ls_nomicfoundation"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = on_init,

	solidity = {
		cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
		root_dir = "foundry.toml",
	},
})

lspconfig["emmet_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = on_init,

	filetypes = { "css", "html", "javascript", "javascriptreact", "typescriptreact" },
})

lspconfig["lua_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = on_init,

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("/home/mous/.snowstorm/homeManagerModules/features/nvim/plugins")] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})

lspconfig["nil_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = on_init,
})

-- lspconfig["biome"].setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	on_init = on_init,
-- })

lspconfig["gopls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = on_init,
})

vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {},
	-- LSP configuration
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
		on_init = on_init,
		default_settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {},
		},
	},
	-- DAP configuration
	dap = {},
}
