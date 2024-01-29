-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

-- lspconfig["rust_analyzer"].setup({
--     capabilities = capabilities,
--     settings = {
--         ["rust-analyzer"] = {
--             procMacro = {
--                 enable = true
--             }
--         }
--     }
-- })
lspconfig["eslint"].setup({
	capabilities = capabilities,
})
lspconfig["docker_compose_language_service"].setup({
	capabilities = capabilities,
})
lspconfig["dockerls"].setup({
	capabilities = capabilities,
})
lspconfig["tsserver"].setup({
	capabilities = capabilities,
})
lspconfig["biome"].setup({
	capabilities = capabilities,
})
lspconfig["solidity_ls_nomicfoundation"].setup({
	capabilities = capabilities,
	solidity = {
		cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
		filetypes = { "solidity" },
		root_dir = "foundry.toml",
		single_file_support = true,
	},
})

lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	filetypes = { "css", "html", "javascript", "javascriptreact", "typescriptreact" },
})
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
})
lspconfig["nixd"].setup({
	capabilities = capabilities,
})
lspconfig["nil_ls"].setup({
	capabilities = capabilities,
	settings = {
		["nil"] = {
			formatting = {
				-- External formatter command (with arguments).
				-- It should accepts file content in stdin and print the formatted code into stdout.
				-- Example: ["nixpkgs-fmt"]
				command = { "nixpkgs-fmt" },
			},
			diagnostics = {
				-- Ignored diagnostic kinds.
				-- Example: ["unused_binding", "unused_with"]
				ignored = {},
				-- Files to exclude from showing diagnostics.
				-- Example: ["Cargo.nix"]
				excludedFiles = {},
			},
			nix = {
				-- The path to the `nix` binary.
				-- Example: "/run/current-system/sw/bin/nix"
				binary = "nix",
				-- The heap memory limit in MiB for `nix` evaluation.
				-- Example: 1024
				maxMemoryMB = 10240,
				flake = {
					-- Auto-archiving behavior which may use network.
					-- Example: true
					autoArchive = true,
					-- Whether to auto-eval flake inputs.
					-- Example: true
					autoEvalInputs = true,
					-- The input name of nixpkgs for NixOS options evaluation.
					-- Example: "nixos"
					nixpkgsInputName = "nixpkgs",
				},
			},
		},
	},
})

--vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]