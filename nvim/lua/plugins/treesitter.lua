return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python" },  -- Установить парсер Python
        highlight = { enable = true },    -- Подсветка синтаксиса
        indent = { enable = true },       -- Автоотступы
      })
    end,
  }
}
