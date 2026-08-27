return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {},
    },
    init = function()
      vim.api.nvim_create_autocmd("QuitPre", {
        group = vim.api.nvim_create_augroup("CloseSnacksExplorerOnQuit", { clear = true }),
        callback = function()
          local snacks_wins = {}
          local float_wins = {}
          local wins = vim.api.nvim_list_wins()

          for _, win in ipairs(wins) do
            local buf = vim.api.nvim_win_get_buf(win)
            local ft = vim.bo[buf].filetype
            if ft:match("^snacks_") then
              table.insert(snacks_wins, win)
            elseif vim.api.nvim_win_get_config(win).relative ~= "" then
              table.insert(float_wins, win)
            end
          end

          if #wins - #float_wins - #snacks_wins == 1 then
            for _, win in ipairs(snacks_wins) do
              vim.api.nvim_win_close(win, true)
            end
          end
        end,
      })
    end,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
      default_file_explorer = false,
      view_options = {
        show_hidden = true,
      },
      columns = {
        "icon",
      },
      float = {
        padding = 3,
        max_width = 150,
        max_height = 40,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        preview_split = "right",
      },
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
        ["<C-c>"] = false,
      },
    },
    keys = {
      {
        "<leader>o",
        function()
          require("oil").toggle_float()
        end,
        desc = "Toggle Oil (Float)",
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
}
