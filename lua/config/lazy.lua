-- Load custom Neovim config files
-- Load general settings like tabstop, mouse settings, etc.
require("config.options")

-- Load key mappings
require("config.keymaps")

-- Load autocommands
require("config.autocmds")

-- Helper function to load plugin files dynamically
local function load_plugins()
    local plugin_files = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/config/plugins", "*.lua", false, true)
    local plugins = {}

    for _, file in ipairs(plugin_files) do
        local plugin = dofile(file)
        table.insert(plugins, plugin)
    end

    return plugins
end

-- Set up lazy.nvim with lockfile configuration
require("lazy").setup(load_plugins(), {
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json" -- Specify lockfile location
})
