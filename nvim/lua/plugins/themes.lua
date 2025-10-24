return {
    {
        "ellisonleao/gruvbox.nvim", 
        priority = 1000 
    },
    {
        "rebelot/kanagawa.nvim"
    },
    {
      "vague2k/vague.nvim",
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other plugins
    },
    {
      'ribru17/bamboo.nvim',
      lazy = false,
      priority = 1000,
    },
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
    },
    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
}
