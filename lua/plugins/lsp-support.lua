return{
{

    "williamboman/mason.nvim",
    config = function()
         require("mason").setup {
        log_level = vim.log.levels.DEBUG
    }
    end
},

{
  "williamboman/mason-lspconfig.nvim",
  config = function()
        require("mason-lspconfig").setup({
          ensure_installed = {"lua_ls","clangd", "harper_ls"}
        })
  end
},

{
     "mfussenegger/nvim-jdtls",
      ft = { 'java' },
        config = function ()
           local config = {
                cmd ={vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls')}
            }
            require("jdtls").start_or_attach(config)
        end,
},
{
  "neovim/nvim-lspconfig",
   config = function ()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.harper_ls.setup({
        capabilities = capabilities
      })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
end
}
}

