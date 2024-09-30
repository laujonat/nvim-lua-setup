return {{
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
        local builtin = require("telescope.builtin")

        -- Keymaps for Telescope functions
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- Search file content
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

        -- Optional: Customize Telescope for better fuzzy finding
        -- Requires ripgrep (brew install ripgrep for macOS)
        require('telescope').setup({
            defaults = {
                vimgrep_arguments = {'rg', '--color=never', '--no-heading', '--with-filename', '--line-number',
                                     '--column', '--smart-case', '--hidden' -- Optional: Search hidden files
                },
                file_ignore_patterns = {"node_modules", ".git"}, -- Ignore unnecessary directories
                layout_strategy = "horizontal",
                layout_config = {
                    prompt_position = "top"
                },
                sorting_strategy = "ascending",
                file_sorter = require('telescope.sorters').get_fuzzy_file,
                generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter
            }
        })
    end
}, {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
        require("telescope").setup {
            extensions = {
                ["ui-select"] = {require("telescope.themes").get_dropdown({})}
            }
        }
        require("telescope").load_extension("ui-select")
    end
}}
