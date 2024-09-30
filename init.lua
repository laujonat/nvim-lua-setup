-- Define the path where the lazy.nvim plugin will be installed.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if the lazy.nvim plugin is already installed at the defined path.
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    -- If the plugin is not installed, run a command to download it from GitHub.
    vim.fn.system({
        "git",                           -- Use the git command-line tool.
        "clone",                         -- Clone the repository.
        "--filter=blob:none",            -- Only download essential files.
        "https://github.com/folke/lazy.nvim.git",  -- URL of the repository.
        "--branch=stable",               -- Ensure we get the stable version.
        lazypath,                        -- Install it to the path we defined.
    })
end

-- Add the path of the lazy.nvim plugin to Neovim's runtime path.
-- This allows Neovim to find and use the plugin.
vim.opt.rtp:prepend(lazypath)


-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.

-- Set leader key early on
vim.g.mapleader = " "  -- Space as leader
vim.g.maplocalleader = "\\"  -- Backslash as local leader

-- Load core settings
require('config.options')    -- General options (e.g., line numbers, tab width, etc.)
require('config.keymaps')    -- Key mappings
require('config.autocmds')   -- Autocommands
require('config.lazy')       -- Plugin manager lazy.nvim and plugin setup

-- Optionally, you could have a diagnostic keymaps section here for LSP/keybindings


-- Neovide settings
if vim.g.neovide then
    -- Disable the animated cursor
    vim.g.neovide_cursor_animation_length = 0

    -- Other useful Neovide settings you might want to configure
    vim.g.neovide_cursor_vfx_mode = ""              -- Disable cursor visual effects
    vim.g.neovide_cursor_trail_length = 0            -- Disable cursor trail
    vim.g.neovide_no_idle = true                     -- Disable idle effects for performance
    vim.g.neovide_transparency = 0.98                 -- Set transparency (optional)
end
