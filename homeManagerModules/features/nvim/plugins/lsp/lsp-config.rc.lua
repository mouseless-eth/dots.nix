-- Set up lspconfig.
local lspconfig = require("lspconfig")

local map = vim.keymap.set

local on_attach = function(client, bufnr)
    local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
    end

    map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
    map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
    map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
    map("n", ",sh", vim.lsp.buf.signature_help, opts("Show signature help"))
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts("List workspace folders"))

    map("n", ",sd", vim.lsp.buf.type_definition, opts("Go to type definition"))

    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
    map("n", "gr", vim.lsp.buf.references, opts("Show references"))

    -- saga
    vim.keymap.set("n", ",sr", "<cmd>Lspsaga rename ++project<CR>")
    vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

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

require("typescript-tools").setup({
    on_attach = on_attach,
    capabilities = capabilities,
    on_init = on_init,
})

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
})
