return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nil_ls = {
          mason = false,
        },
      },
    },
  },
  -- {
  --   "williamboman/mason.nvim",
  --   opts = function(_, opts)
  --     opts.ensure_installed = opts.ensure_installed or {}
  --     local ignore = { "nil", "statix" }
  --     for i = #opts.ensure_installed, 1, -1 do
  --       for _, name in ipairs(ignore) do
  --         if opts.ensure_installed[i] == name then
  --           table.remove(opts.ensure_installed, i)
  --         end
  --       end
  --     end
  --   end,
  -- },
}
