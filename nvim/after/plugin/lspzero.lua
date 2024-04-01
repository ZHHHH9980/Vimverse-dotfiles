local cmp = require('cmp')
local lsp = require("lsp-zero")

require('lspconfig').intelephense.setup({})

require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'eslint', 'lua_ls' }
})

require('mason-null-ls').setup({
  ensure_installed = { 'prettier', 'eslint' }
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})


lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})


lsp.format_on_save({
  servers = {
    ['stylua'] = { 'lua' },
    ['lua_ls'] = { 'lua' },
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  -- 展示信息（hover）
  -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

cmp.setup({
  mapping = {
    ['<C-i>'] = cmp.mapping.select_prev_item(),
    ['<C-k>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
  preselect = cmp.PreselectMode.Item,
})

lsp.configure('tsserver', {
  settings = {
    completions = {
      completeFunctionCalls = true
    }
  },
  on_attach = function(client, bufnr)
    lsp.on_attach(client, bufnr)
  end,
})

lsp.configure('eslint', {
  on_attach = function(client, bufnr)
    lsp.on_attach(client, bufnr)
  end,
})

lsp.setup()

