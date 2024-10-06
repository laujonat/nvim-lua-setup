return {{
    "nvimtools/none-ls.nvim",  -- Correct repo name
    dependencies = { "nvimtools/none-ls-extras.nvim" },
    config = function()
        local null_ls = require("null-ls")
        
        -- Correct way to set up null-ls with sources
        null_ls.setup({
            sources = {
                -- Formatters
                null_ls.builtins.formatting.stylua,   -- Lua formatter
                null_ls.builtins.formatting.prettier,
                -- Completion
                null_ls.builtins.completion.spell,    -- Spelling suggestions
                -- Diagnostics (e.g., ESLint)
                null_ls.builtins.diagnostics.eslint,  -- ESLint for JavaScript/TypeScript
                null_ls.builtins.diagnostics.yamllint, -- Yaml linting (ensure yamllint is installed)
                
            }
        })

        -- Keymap for formatting
        -- vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, { noremap = true, silent = true })
		vim.keymap.set('n', '<leader>F', vim.lsp.buf.format, { noremap = true, silent = true })

    end
}}
