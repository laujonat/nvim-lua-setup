return {
    "lewis6991/gitsigns.nvim",
    config = function()
        -- Define the highlight groups for git changes
        vim.api.nvim_set_hl(0, "GitSignsAdd", {
            fg = "#00FF00"
        }) -- Green for additions
        vim.api.nvim_set_hl(0, "GitSignsChange", {
            fg = "#FFFF00"
        }) -- Yellow for changes
        vim.api.nvim_set_hl(0, "GitSignsDelete", {
            fg = "#FF0000"
        }) -- Red for deletions

        -- Setup Gitsigns plugin
        require("gitsigns").setup({
            signs = {
                add = {
                    text = "+"
                },
                change = {
                    text = "~"
                },
                delete = {
                    text = "_"
                },
                topdelete = {
                    text = "‾"
                },
                changedelete = {
                    text = "~"
                }
            },
            current_line_blame = true -- Show blame info on current line
        })
    end
}
