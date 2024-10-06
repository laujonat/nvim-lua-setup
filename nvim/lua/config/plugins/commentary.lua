return {
    'numToStr/Comment.nvim',
    dependencies = {
        'JoosepAlviste/nvim-ts-context-commentstring',  -- Optional for better block commenting in languages like JSX
    },
    config = function()
        require('Comment').setup({
            -- Enable block comment functionality
            mappings = {
                basic = true,  -- Default mappings: gcc (comment line), gc (comment motion), etc.
                extra = true,  -- Extended mappings for block commenting
            },
            pre_hook = function(ctx)
                -- This hook is used to integrate with Treesitter for languages like JSX
                local U = require("Comment.utils")
                local location = nil
                if ctx.ctype == U.ctype.block then
                    location = require("ts_context_commentstring.utils").get_cursor_location()
                elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                    location = require("ts_context_commentstring.utils").get_visual_start_location()
                end
                return require("ts_context_commentstring.internal").calculate_commentstring({
                    key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
                    location = location,
                })
            end,
        })
    end
}
