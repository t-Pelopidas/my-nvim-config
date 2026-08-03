return  {
    "neovim/nvim-lspconfig",
    config = function()
      -- The CORRECT way to handle LSP keybinds: buffer-local LspAttach
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(event)
          local opts = { buffer = event.buf }
          
          --LSP
          vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

          --Diagnostic
          vim.keymap.set("n", "gl", function()
            vim.diagnostic.open_float({ scope = "line"})
        end, opts)
        end,
      })
    end,
}
