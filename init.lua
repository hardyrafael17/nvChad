package.path = package.path .. ";~/.luarocks.share/lua/5.1/?/init.lua;"
vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"

vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)


vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

local ok, comments = pcall(require, "Comment")
if not ok then
  print "error loading comments plugin"
else
  comments.setup({
   pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  })
end

-- vim.treesitter.language.register("markdown", "mdx")
