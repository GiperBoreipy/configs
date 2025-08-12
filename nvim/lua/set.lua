vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.mouse = ""

vim.opt.ruler = true

vim.opt.switchbuf = 'uselast' 


vim.cmd 'colorscheme kanagawa'

-- Автоматически устанавливать Unix-формат для всех файлов
vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*",
  callback = function()
    vim.bo.fileformat = "unix"  -- Принудительно использовать LF вместо CRLF
  end,
})



vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })


vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    if vim.v.event.operator == 'y' and vim.v.event.regname == '' then
      vim.fn.setreg('+', vim.fn.getreg('"'))
    end
  end
})


vim.diagnostic.config({
    virtual_text = {
    prefix = "●", -- Символ перед текстом ошибки
    spacing = 2,  -- Отступ между символом и текстом
  },
  signs =true,
  float = {             
    border = "rounded",
    source = "always",
    style = "minimal"
  },
})
vim.wo.signcolumn = "yes:1"  -- Всегда показывать колонку шириной 1 символ
local signs = { Error = " ", Warn = " ", Hint = "󰛩 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Автоформатирование при сохранении
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    vim.lsp.buf.format({
      async = false, -- Синхронное форматирование
    })
  end,
})
vim.o.updatetime = 250



-- Переназначаем `u` в тихом режиме
vim.keymap.set("n", "u", function()
  vim.cmd("silent undo")
end, { noremap = true, silent = true })
