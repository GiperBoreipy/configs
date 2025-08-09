return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",    
      "hrsh7th/cmp-buffer",      
      "hrsh7th/cmp-path",        
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      cmp.setup({
        performance = {
            max_view_entries = 10, 
            debounce = 40,
            throttle = 20
        },
        window = {
          completion = {
            border = "rounded", 
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
            scrollbar = false,
            col_offset = -1, 
            side_padding = 1, 
          },
          documentation = {
            border = "rounded",
          },
        },
        formatting = {
          fields = { "kind", "abbr" },
          format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ['<tab>'] = cmp.mapping.select_next_item(cmp_select),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },  
          { name = "buffer" },   
          { name = "path" },        
        }),
      })
    end,
  },
}
