return{

    "https://github.com/morhetz/gruvbox/",
    lazy = false,
    name = "gruvbox",
    priority = 1000,
    config = function()
        vim.g.gruvbox_contrast_dark = 'hard'
        vim.o.background = 'dark'
        vim.cmd.colorscheme('gruvbox')
    end
}

