return {
  {
    "akinsho/bufferline.nvim",
    version = "v4.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
            show_buffer_close_icons = false, 
            show_close_icon = false,
            separator_style = "slant",
            enforce_regular_tabs = false, 
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center",
                    separator = true,
                },
            },
        }
      })
    end
  }
}
