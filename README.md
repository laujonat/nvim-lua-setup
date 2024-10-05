# Neovim for Lazy.nvim Setup

My configuration is primarily intended for use with the Neovide IDE.

## Folder Structure

```bash
config
├── autocmds.lua
├── keymaps.lua
├── lazy.lua       # Plugin installation setup (lazy.nvim)
├── options.lua
└── plugins/       # Plugin configurations go here
    ├── telescope.lua  # Telescope-specific setup
    ├── treesitter.lua  # Treesitter setup
    └── lsp.lua         # LSP config (if using LSP)
```

## Setup

- Each plugin is configured in its own file and dynamically loaded from the `plugins/ folder`.
  - This way, you don't have to manually list plugins in lazy.lua.

### Dependencies (MacOS)

- `ripgrep` is particularly important for live grep and other searching features within Telescope that involve searching file contents.
- Telescope uses `ripgrep` for this purpose because it’s extremely fast and efficient.

### Installing ripgrep

```bash
brew install ripgrep
```


### Notes

To go back to the previous location after jumping to a definition in Neovim, you can use:

```bash
<C-o>
```
This command `(Control + o)` takes you back to the last cursor position before the jump. It works across files, so if you jumped to another file for the definition, it will return you to the original file.

Alternatively, if you want to move forward again (redo the jump), you can use:

```bash
<C-i>
```
This helps if you want to navigate back and forth between the definition and the original location.
