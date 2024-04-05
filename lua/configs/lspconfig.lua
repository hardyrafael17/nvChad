local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "tailwindcss", "html", "cssls", "clangd", "tsserver", "eslint" }

for _, lsp in ipairs(servers) do
  if lsp == "eslint" then
    lspconfig[lsp].setup {
      on_init = on_init,
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = {"markdown", "javascript", "typescript", "typescriptreact", "javascriptreact"},
    }
  else
    lspconfig[lsp].setup {
      on_init = on_init,
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
