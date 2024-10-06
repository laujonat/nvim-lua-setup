-- Set the character encoding to UTF-8
vim.opt.encoding = 'utf-8'

-- Always show the sign column (used for displaying signs like breakpoints)
vim.opt.signcolumn = 'yes'

-- Set the number of spaces that a <Tab> in the file counts for
vim.opt.tabstop = 4

-- Make redraws happen lazily to improve performance
vim.opt.lazyredraw = true

-- Show matching brackets when text indicator is over them
vim.opt.showmatch = true

-- Tenths of a second to show the match for
vim.opt.mat = 2

-- Show the line number on each line
vim.opt.number = true

-- Enable mouse support in all modes
vim.opt.mouse = 'a'

-- Configure backspace to work in more contexts
vim.opt.backspace = 'eol,start,indent'

-- Allow specified keys to work as movement commands across lines and wraps
vim.opt.whichwrap:append('<,>,h,l')

-- Use enhanced command-line completion
vim.opt.wildmenu = true

-- Patterns to ignore during file and directory completion
vim.opt.wildignore = '*.o,*~,*.pyc'

-- Ignore case in search patterns
vim.opt.ignorecase = true

-- Override the ignorecase option if the search pattern contains upper-case letters
vim.opt.smartcase = true

-- Highlight search matches
vim.opt.hlsearch = true

-- Show search matches as you type
vim.opt.incsearch = true

-- Keep a history of this many lines entered at the command prompt
vim.opt.history = 1000

-- Automatically read files changed outside of Vim
vim.opt.autoread = true

-- Show a fold column with width 1
vim.opt.foldcolumn = '1'

-- Enable syntax highlighting
vim.opt.syntax = 'enable'
