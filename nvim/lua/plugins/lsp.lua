return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "basedpyright", "black" } 
        }
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            lspconfig = require("lspconfig")
            lspconfig.nginx_language_server.setup({})
            lspconfig.basedpyright.setup({
                settings = {
                    basedpyright = {
                        analysis = {
                            diagnosticMode = 'openFilesOnly',
                            autoSearchPaths=true,
                            autoImportCompletions = true,
                            typeCheckingMode = 'standard', 
                            useLibraryCodeForTypes = true,
                            reportUnusedVariable = 'warning',
                            reportUnusedCallResult = false,
                            reportUnusedFunction = 'warning',
                            reportDuplicateImport = 'warning',
                            reportGeneralTypeIssues = 'error',
                            reportArgumentType = 'error',
                            reportUnknownMemberType = 'error',
                            reportAssignmentType = 'error',
                            reportIncompatibleMethodOverride = true,
                        },
                    }    
                },
                on_attach = function(client, bufnr)
                    local opts = { buffer = bufnr }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                end
            })          
        end
    }
}
