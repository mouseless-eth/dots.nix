local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		-- lua
		null_ls.builtins.formatting.stylua,

		-- python
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,

		-- solidity
		null_ls.builtins.formatting.forge_fmt,
		null_ls.builtins.diagnostics.solhint,

		-- ts/js
		null_ls.builtins.formatting.biome,
		-- null_ls.builtins.diagnostics.eslint_d,

		-- nix
		null_ls.builtins.formatting.alejandra,
		null_ls.builtins.diagnostics.deadnix,

		-- rust
		null_ls.builtins.formatting.rustfmt,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					-- vim.lsp.buf.formatting_sync()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})
