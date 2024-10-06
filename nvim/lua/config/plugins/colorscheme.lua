-- Set the color scheme for Vim/Neovim
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme "catppuccin-mocha"
    end
}
