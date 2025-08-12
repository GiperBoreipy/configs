return {
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
          },
        },
        presets = {
          bottom_search = false, -- Отключаем поиск снизу
          command_palette = true, -- Включаем палитру команд
          long_message_to_split = true, -- Длинные сообщения в отдельном окне
        },
        routes = {
        {
          filter = { event = "msg_show", find = "written" },
          opts = { skip = true }
        },
            {
            filter = {
              event = "msg_show",
              find = "%d+L, %d+B",
            },
            opts = { skip = true },
          },
                    {
            filter = {
              event = "msg_show",
              find = "%d+ substitutions on %d+ lines",
            },
            opts = { skip = true },
          },
          {
            view = "notify",
            filter = { event = "msg_show" },
          },
        },
      })

      require("notify").setup({
        timeout = 2000, 
        stages = "fade_in_slide_out", 
        background_colour = "#1a1b26", 
        render = "minimal", 
      })
      
      -- Отключаем стандартный вывод сообщений
      vim.opt.cmdheight = 0
    end
  }
}
