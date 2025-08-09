return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",  
      "nvim-tree/nvim-web-devicons", 
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          layout_config = {
            height = 0.95,
            width = 0.95,
          },
          file_ignore_patterns = { 
            "node_modules",
            "%.git/",
            "%.cache",
            "build/",
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",  
            hidden = true,       
          },
        },
      })

    end
  }
}
