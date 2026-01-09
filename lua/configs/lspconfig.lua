-- require("nvchad.configs.lspconfig").defaults()

-- local servers = { "html", "cssls" }
-- vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

-- 1. Grab the NvChad defaults (on_attach, capabilities, etc.)
local nvlsp = require "nvchad.configs.lspconfig"

-- 2. Define your list of servers
local servers = { "html", "cssls", "ts_ls" }

-- 3. Setup standard servers using the new native API
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    install_path = nil, -- Tells Neovim to use system path, not Mason
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

-- 4. Custom setup for your system-installed gopls
vim.lsp.config("gopls", {
  settings = {
    gopls = {
      gofumpt = true,
    },
  },
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" }, -- Note: 'root_dir' is now 'root_markers'
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
})

-- 5. Finally, enable them all
vim.lsp.enable(servers)
vim.lsp.enable("gopls")

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({ timeout_ms = 1000 })
  end,
  group = format_sync_grp,
})

-- vim.diagnostic.config({
--   virtual_text = {
--     prefix = "●",
--     spacing = 4,
--   },
--   underline = true,
--   update_in_insert = false,
--   severity_sort = true,
-- })
vim.diagnostic.config({
  virtual_lines = { current_line = true },
  virtual_text = false,
})
