-- auto-remove unused imports when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.tsx", "*.ts" },
  callback = function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.removeUnused" },
        diagnostics = {},
      },
    })
  end,
})

