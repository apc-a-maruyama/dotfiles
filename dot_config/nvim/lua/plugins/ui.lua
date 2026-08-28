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
  -- -- TODO: scroll animation
  -- {
  --   "karb94/neoscroll.nvim",
  --   opts = {},
  -- },
  {
    "folke/snacks.nvim",
    opts = { image = { enabled = false } },
  },
}
