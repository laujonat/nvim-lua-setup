return { -- Configuration for nvim-cmp LSP plugin
{
    "hrsh7th/cmp-nvim-lsp",
    config = function()
        -- Set up nvim-cmp with LSP as a source for completion
        require'cmp'.setup {
            sources = {{
                name = 'nvim_lsp'
            }}
        }
    end
}, -- Configuration for LuaSnip (snippets engine)
{
    'L3MON4D3/LuaSnip',
    -- Dependent plugins for LuaSnip functionality
    dependencies = {'saadparwaiz1/cmp_luasnip', -- Integration of LuaSnip into nvim-cmp
    'rafamadriz/friendly-snippets' -- Collection of commonly used snippets
    }
}, -- Configuration for nvim-cmp (completion engine)
{
    "hrsh7th/nvim-cmp",
    config = function()
        local cmp = require 'cmp'
        -- Load VSCode-like snippets
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                -- Function to expand snippets
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            },
            window = {
                -- Configure borders for completion and documentation windows
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            mapping = cmp.mapping.preset.insert({
                -- Key mappings for scrolling in the completion docs
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                -- Key mapping to trigger completion manually
                ['<C-Space>'] = cmp.mapping.complete(),
                -- Key mapping to abort completion
                ['<C-e>'] = cmp.mapping.abort(),
                -- Key mapping to confirm the selected completion item
                ['<CR>'] = cmp.mapping.confirm({
                    select = true
                }) -- Accept currently selected item. 
            }),
            sources = cmp.config.sources({ -- Uncomment the line below to use LSP source along with LuaSnip
            -- { name = 'nvim_lsp' },
            {
                name = 'luasnip'
            }}, {{
                name = 'buffer'
            } -- Source for buffer words/completion
            })
        })
    end
}}
