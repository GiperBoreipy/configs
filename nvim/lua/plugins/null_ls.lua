return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("null-ls").setup({
        sources = {
          require("null-ls").builtins.formatting.black
        }
      })
    end
  },
}
