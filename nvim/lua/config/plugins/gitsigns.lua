-- Validated by a non-human. Use with caution.
-- https://chatgpt.com/g/g-zjT7l8NAz-neovim-navigator

return {
	"lewis6991/gitsigns.nvim",
	config = function()
		-- Define custom highlight groups for Git changes (use descriptive comments)
		vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#00FF00" }) -- Green for added lines
		vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#FFFF00" }) -- Yellow for changed lines
		vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#FF0000" }) -- Red for deleted lines

		-- Setup Gitsigns plugin with custom symbols and current line blame
		require("gitsigns").setup({
			signs = {
				add = { text = "+" }, -- Symbol for additions
				change = { text = "~" }, -- Symbol for changes
				delete = { text = "_" }, -- Symbol for deletions
				topdelete = { text = "‾" }, -- Symbol for top deletions
				changedelete = { text = "~" }, -- Symbol for changes and deletions
			},
			current_line_blame = true, -- Enable inline blame on the current line
			current_line_blame_opts = {
				delay = 500, -- Blame delay in milliseconds
				virt_text_pos = "eol", -- Position blame text at the end of the line
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			-- Keybindings for common Git actions
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				-- Helper function to define keymaps more easily
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Keymaps for navigating between Git hunks (chunks of changes)
				-- 'n' means normal mode
				-- ']c' moves to the next hunk (a set of changes)
				-- '[c' moves to the previous hunk
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end -- If diff mode is active, use default behavior
					vim.schedule(function()
						gs.next_hunk()
					end) -- Move to the next Git hunk
					return "<Ignore>"
				end, { expr = true, noremap = true, silent = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end -- If diff mode is active, use default behavior
					vim.schedule(function()
						gs.prev_hunk()
					end) -- Move to the previous Git hunk
					return "<Ignore>"
				end, { expr = true, noremap = true, silent = true })

				-- Stage the current hunk (normal mode)
				-- This will add the changes in the current hunk to the Git staging area
				map("n", "<leader>hs", gs.stage_hunk)

				-- Reset the current hunk (normal mode)
				-- This will undo the changes in the current hunk, reverting to the last committed state
				map("n", "<leader>hr", gs.reset_hunk)

				-- Stage the selected lines (visual mode)
				-- Useful if you only want to stage part of a hunk
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)

				-- Reset the selected lines (visual mode)
				-- Reverts only the changes in the selected lines
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)

				-- Blame the current line (normal mode)
				-- This shows who last changed the current line and when
				map("n", "<leader>bl", gs.blame_line)

				-- Toggle line blame (normal mode)
				-- Turn on/off the display of Git blame information inline for the current line
				map("n", "<leader>tb", gs.toggle_current_line_blame)

				-- Toggle deleted lines in the diff (normal mode)
				-- If enabled, it shows lines that were deleted in the diff
				map("n", "<leader>td", gs.toggle_deleted)
			end,
		})
	end,
}
