return {
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    python = { "ruff", "isort" },
                },
                formatters = {
                  ruff = {
                    prepend_args = { "--fix" }, 
                  },
                  isort = {},
                },
            })
        end,
    }
}
