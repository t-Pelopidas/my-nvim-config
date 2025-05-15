return {
 {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").jdtls.setup {}
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },

  },
}

