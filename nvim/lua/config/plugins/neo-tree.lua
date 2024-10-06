return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = true, -- Automatically focus the current file
				use_libuv_file_watcher = true, -- Auto-refresh when files change
				filtered_items = {
					visible = true,
					show_hidden_count = true,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						-- add extension names you want to explicitly exclude
						-- '.git',
						'.DS_Store',
						'thumbs.db',
					},
					never_show = {},
				},
			},
		})
		-- vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>")
		vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
	end
}
