return {
    "Exafunction/windsurf.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
            enable_cmp_source = false,
            virtual_text = {
                enabled = true,
                manual = false,
                filetypes = {},
                default_filetype_enabled = true,
                idle_delay = 50,
                virtual_text_priority = 65535,
                map_keys = true,
                accept_fallback = nil,
                key_bindings = {
                    accept = "<C-a>",
                    dismiss = "<C-d>",
                }
            }
        })
    end
}
