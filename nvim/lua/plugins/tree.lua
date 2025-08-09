return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() 
            require("nvim-tree").setup({
                actions = {
                    open_file = {
                      resize_window = true,
                      window_picker = {
                        enable = false
                      },
                    },
                  },
                  sync_root_with_cwd = true,  -- Синхронизировать корень с текущей директорией
                  update_focused_file = {
                    enable = true,            -- Автоматически обновлять фокус на текущем файле
                    update_root = true,       -- Обновлять корневую директорию
                  },
                view = {
                    signcolumn = "no",
                    side = "left"
                },
                hijack_cursor = true,
                hijack_unnamed_buffer_when_opening = true,
                filters = {
                    dotfiles = true, -- скрывать все dot-файлы по умолчанию
                    -- или можно использовать exclude для тех же целей
                    exclude = {
                      ".gitignore",
                      ".dockerignore", ".env"
                    },
                  },
                renderer = {
                    indent_markers = {
                      enable = true,          -- показывать вертикальные линии иерархии
                      icons = {
                        corner = "└",        -- угол
                        edge = "│",          -- вертикальная линия
                        item = "├",          -- элемент
                        none = " ",          -- пустое пространство
                      },
                    },
                    icons = {
                      glyphs = {
                        default = "",      -- иконка файла
                        symlink = "",      -- симлинк
                        folder = {
                          arrow_closed = "▶", -- закрытая папка
                          arrow_open = "▼",   -- открытая папка
                          default = "",
                          open = "",
                          empty = "",
                          empty_open = "",
                          symlink = "",
                          symlink_open = "",
                        },
                      },
                    },
              },
            })
        end,
    }
}
