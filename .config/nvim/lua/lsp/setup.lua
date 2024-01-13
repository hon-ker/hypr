require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})


require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright","cssls","html"},
})
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {
  capabilities = capabilities
}

lspconfig.pyright.setup {
  capabilities = capabilities
}


lspconfig.cssls.setup {
  capabilities = capabilities
}

lspconfig.html.setup {
  capabilities = capabilities
}

lspconfig.volar.setup {
  capabilities = capabilities
}
