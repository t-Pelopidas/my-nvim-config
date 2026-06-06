return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {}, -- 'opts = {}' is a cleaner shorthand for config = function() setup() end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "jdtls", "harper_ls", "pyright" },
        handlers = {
          -- This is the default handler for all servers
          function(server_name)
            -- CRITICAL FIX: Bypass jdtls. Do not let lspconfig touch it.
            if server_name ~= "jdtls" then
              require("lspconfig")[server_name].setup({
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
              })
            end
          end,
        },
      })
    end,
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      -- CRITICAL FIX: jdtls must be attached via an autocommand for Java files only
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          local config = {
            cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
            -- You also need to pass your capabilities here to get auto-completion in Java
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
          }
          require("jdtls").start_or_attach(config)
        end,
      })
    end,
  },
}
