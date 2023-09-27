local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
  return
end

lsp.preset("recommended")

lsp.ensure_installed({
  'rust_analyzer',
  'lua_ls',
  'bashls',
  'clangd',
  'pyright',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.set_preferences({
    suggest_lsp_servers = false,
})

lsp.set_sign_icons({
  error = '',
  warn = '',
  hint = '',
  info = ''
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "d]", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "d[", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)

  require("lsp-inlayhints").on_attach(client, bufnr)
end)

lsp.setup()

lsp.skip_server_setup({'rust_analyzer'})

require("rust-tools").setup({
    tools = {
        inlay_hints = {
            auto = false
        }
    }
})

vim.diagnostic.config({
    virtual_text = true
})
