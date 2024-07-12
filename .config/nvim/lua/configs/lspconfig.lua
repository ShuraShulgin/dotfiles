-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "bufls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "--query-driver=/opt/poky/2.6.1/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-g++",
  },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    return on_attach(client, bufnr)
  end,
  filetypes = { "c", "cpp", "objc", "objcpp" }
}
lspconfig.bufls.setup {
  filetypes = { "proto" }
}
