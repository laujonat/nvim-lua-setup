-- Autocommands

-- Reload file if it changes on disk
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "checktime"
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
      vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end
})

-- Automatically resize windows when the window size changes
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd ="
})
