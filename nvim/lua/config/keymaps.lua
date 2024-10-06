-- Options for key mappings
local opts = { noremap = true, silent = true }

-- Normal mode mappings
local normal_mappings = {
    { keys = '<Leader>s', command = ':w<CR>' },    -- Save file
    { keys = '<Leader>d', command = ':wq!<CR>' },  -- Save and exit
    { keys = '<Leader>q', command = ':qa!<CR>' },  -- Quit all without saving
    { keys = '<Leader>x', command = ':q!<CR>' }    -- Quit current file without saving
}

-- Insert mode mappings
local insert_mappings = {
    { keys = '<Leader>s', command = '<Esc>:w<CR>a' }, -- Save file and return to insert mode
    { keys = '<Leader>d', command = '<Esc>:wq!<CR>' }, -- Save and exit
    { keys = '<Leader>q', command = '<Esc>:qa!<CR>' }, -- Quit all without saving
    { keys = '<Leader>x', command = '<Esc>:q!<CR>' },   -- Quit current file without saving
-- { keys = 'jk', command = '<Esc>' },                 -- Escape using 'jk'
    { keys = '<C-s>', command = '<Esc>:w<CR>a' },       -- Save file and return to insert mode
    { keys = '<C-q>', command = '<Esc>:qa!<CR>' }       -- Quit all without saving and return to insert mode
}

-- Function to initialize all key mappings using `vim.keymap.set`
local function setupKeyMappings()   
    -- Set normal mode mappings
    for _, map in ipairs(normal_mappings) do
        vim.keymap.set('n', map.keys, map.command, opts)
    end
    
    -- Set insert mode mappings
    for _, map in ipairs(insert_mappings) do
        vim.keymap.set('i', map.keys, map.command, opts)
    end
end

-- Call the function to set up key mappings
setupKeyMappings()

-- Additional key mappings using `vim.keymap.set`
-- Set key mapping for space and C-space for search
vim.keymap.set('n', '<space>', '/', { noremap = true })    -- Forward search with space
vim.keymap.set('n', '<C-space>', '?', { noremap = true })  -- Backward search with C-space

-- Disable search highlight with <leader><cr>
vim.keymap.set('n', '<leader><cr>', ':noh<CR>', { noremap = true, silent = true })

-- Set mappings for Command+V in macOS
vim.keymap.set('i', '<D-v>', '<C-R>+', { noremap = true, silent = true })  -- Insert mode paste
vim.keymap.set('n', '<D-v>', '"+p', { noremap = true, silent = true })     -- Normal mode paste

-- Set mappings for Command+C (⌘+C) to copy to the system clipboard
vim.keymap.set('v', '<D-c>', '"+y', { noremap = true, silent = true })     -- Visual mode copy
vim.keymap.set('n', '<D-c>', '"+yy', { noremap = true, silent = true })    -- Normal mode copy


-- Duplicate line with Alt+Shift+Down (duplicate below)
vim.keymap.set('n', '<A-S-Down>', 'Yp', { noremap = true, silent = true }) 
-- Duplicate line with Alt+Shift+Up (duplicate above)
vim.keymap.set('n', '<A-S-Up>', 'YP', { noremap = true, silent = true })    
