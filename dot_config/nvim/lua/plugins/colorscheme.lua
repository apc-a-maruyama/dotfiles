return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priolity = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        flavour = "mocha",
      })
    end,
  },
}
