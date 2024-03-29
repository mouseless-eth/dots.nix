-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Bindings here
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
    -- Add more bindings as needed
end

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
    settings = {
        ["nil"] = {
            formatting = {
                -- External formatter command (with arguments).
                -- It should accepts file content in stdin and print the formatted code into stdout.
                -- Example: ["nixpkgs-fmt"]
                command = { "alejandra" },
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
                maxMemoryMB = 20480,
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
