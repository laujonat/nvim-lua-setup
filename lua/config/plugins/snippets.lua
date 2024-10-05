return {
	-- Configuration for nvim-cmp LSP plugin
	{
		"hrsh7th/cmp-nvim-lsp",
		config = function()
			require('cmp').setup {
				sources = {
					{ name = 'nvim_lsp' }
				}
			}
		end
	},

	-- Configuration for LuaSnip (snippets engine)
	{
		'L3MON4D3/LuaSnip',
		dependencies = {
			'saadparwaiz1/cmp_luasnip', -- Integration of LuaSnip into nvim-cmp
			'rafamadriz/friendly-snippets' -- Collection of commonly used snippets
		},
		config = function()
			-- Load VSCode-like snippets
			require("luasnip.loaders.from_vscode").lazy_load()
		end
	},

	-- Configuration for nvim-cmp (completion engine)
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require 'cmp'
			local luasnip = require 'luasnip'

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- Use LuaSnip to expand snippets
					end
				},
				window = {
					-- Optional: borders for completion and documentation windows
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered()
				},
				mapping = cmp.mapping.preset.insert({
					-- Scroll documentation
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),

					-- Trigger completion manually
					['<C-Space>'] = cmp.mapping.complete(),

					-- Abort completion
					['<C-e>'] = cmp.mapping.abort(),

					-- Confirm selected item
					['<CR>'] = cmp.mapping.confirm({ select = true }),

					-- Tab to navigate through suggestions and expand snippets
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					-- Shift-Tab to navigate backwards
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				-- Completion sources
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' }, -- LSP completions
					{ name = 'luasnip' } -- Snippet completions
				}, {
					{ name = 'buffer' } -- Buffer word completions
				})
			})
		end
	}
}
