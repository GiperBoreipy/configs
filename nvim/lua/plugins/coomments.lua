return {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
            toggler = {
                line = '<Leader>/',  -- Переключение комментария для строки
                block = '<Leader><Leader>/',  -- Переключение блочного комментария
            },
            opleader = {
                line = '<Leader>/',  -- Визуальный режим для строк
                block = '<Leader><Leader>/',  -- Визуальный режим для блоков
            },
        })
    end
}
