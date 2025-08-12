-- NeoTree
vim.keymap.set("n", "<Leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle NeoTree" })
vim.keymap.set("n", "<Leader>o", "<Cmd>NvimTreeFocus<CR>", { desc = "Focus NeoTree" })


-- Buffers
vim.keymap.set('n', '<leader>]', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>[', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>c', '<cmd>bp|bd #<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', { desc = 'Close all buffers except current' })


-- Telescope
vim.keymap.set('n', '<leader>f/', function()
  require('telescope.builtin').current_buffer_fuzzy_find()
end, { desc = 'Fuzzy find in current buffer' })

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })

vim.keymap.set("n", "<leader>ft", function()
  require('telescope.builtin').grep_string({
    prompt_title = "Find TODOs/FIXMEs",
    search = "\\b(TODO|NOTE|FIXME|HACK|BUG)\\b",
    use_regex = true,
    search_dirs = { "." }  -- искать в текущем проекте
  })
end, {
  desc = "Find TODOs/FIXMEs in project"
})

vim.keymap.set("n", "<leader>fv", function()
  local word = vim.fn.expand("<cword>")
  if word == "" then return end
  require("telescope.builtin").grep_string({
    search = word,
    word_match = "-w",  
    use_regex = false, 
    prompt_title = "Variable: " .. word,
    additional_args = { "--hidden", "--glob=!**/.git/*" }
  })
end, { desc = "Find variable references" })

vim.keymap.set("n", "<leader>fV", "<cmd>Telescope grep_string<CR>", {
  desc = "Find variable by name" 
})


-- Работа с окнами
vim.keymap.set('n', '<C-\\>', '<cmd>vsplit<CR><C-w>l', { desc = 'Horizontal Split' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Перейти в левое окно' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Перейти в нижнее окно' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Перейти в верхнее окно' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Перейти в правое окно' })

-- Форматтер --
vim.keymap.set("n", "<A-F>", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })

