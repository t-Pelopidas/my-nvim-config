return {
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = { 
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter'
        },

        config = function ()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fa', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Telescope help tags' })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function ()
            require("telescope").setup ({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }

                    }
                },
                defaults = {
                    -- configure to use ripgrep
                    vimgrep_arguments = {
                        "rg",
                        "--follow",        -- Follow symbolic links
                        "--hidden",        -- Search for hidden files
                        "--no-heading",    -- Don't group matches by each file
                        "--with-filename", -- Print the file path with the matched lines
                        "--line-number",   -- Show line numbers
                        "--column",        -- Show column numbers
                        "--smart-case",    -- Smart case search

                        -- Exclude some patterns from search
                        "--glob=!**/.git/*",
                        "--glob=!**/.idea/*",
                        "--glob=!**/.vscode/*",
                        "--glob=!**/build/*",
                        "--glob=!**/dist/*",
                        "--glob=!**/yarn.lock",
                        "--glob=!**/package-lock.json",
                    },
                    pickers = {
                        find_files = {
                            hidden = true,
                            -- needed to exclude some files & dirs from general search
                            -- when not included or specified in .gitignore
                            find_command = {
                                "rg",
                                "--files",
                                "--hidden",
                                "--glob=!**/.git/*",
                                "--glob=!**/.idea/*",
                                "--glob=!**/.vscode/*",
                                "--glob=!**/build/*",
                                "--glob=!**/dist/*",
                                "--glob=!**/yarn.lock",
                                "--glob=!**/package-lock.json",
                            },
                            mappings = {
                                n = {
                                    ["cd"] = function(prompt_bufnr)
                                        local selection = require("telescope.actions.state").get_selected_entry()
                                        local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                                        require("telescope.actions").close(prompt_bufnr)
                                        -- Depending on what you want put `cd`, `lcd`, `tcd`
                                        vim.cmd(string.format("silent lcd %s", dir))
                                    end
                                }
                            }
                        },
                    }
                }
            })
        require("telescope").load_extension("ui-select")
    end
}
}
