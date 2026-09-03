-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt_local.formatoptions:remove({ "o", "c", "r" })
  end,
})

vim.opt.title = true
vim.api.nvim_create_autocmd({ "BufEnter", "DirChanged" }, {
  group = vim.api.nvim_create_augroup("UserTmuxTitle", { clear = true }),
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname == "" then
      return
    end

    local git_dir = vim.fs.find(".git", { upward = true, path = vim.fs.dirname(bufname) })[1]

    if git_dir then
      local git_root = vim.fs.dirname(git_dir)
      local repo = vim.fn.fnamemodify(git_root, ":t")
      local rel = bufname:sub(#git_root + 2)
      vim.opt.titlestring = repo .. " - " .. "…/" .. (rel ~= "" and rel or vim.fn.fnamemodify(bufname, ":t"))
    else
      vim.opt.titlestring = "…/" .. vim.fn.fnamemodify(bufname, ":p:h:t") .. "/" .. vim.fn.fnamemodify(bufname, ":t")
    end
  end,
})
