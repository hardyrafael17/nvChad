require("conform").setup(options)

local options = {
  lsp_fallback = true,
  formatters_by_ft = {
    lua = { "stylua" },
    typescript = { "prettierd" },
    json = { "prettierd" },
    ["*"] = { "prettierd" },
  },
}

require("conform").setup(options)
