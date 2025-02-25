# Neovim Keybindings Cheatsheet

> Note: Leader key is set to `<space>`

## File Explorer (NvimTree) - `<space>e`
### File Operations
- `a` - Create new file/folder
  - Type name like `file.js` for a file
  - Type name with trailing slash like `folder/` for a directory
  - Type path like `folder/file.js` to create in subdirectory
- `d` - Delete file/folder
- `r` - Rename file/folder
- `c` - Copy file/folder
- `x` - Cut file/folder
- `p` - Paste file/folder
- `y` - Copy filename
- `Y` - Copy relative path

### Navigation
- `Enter` - Open file/folder
- `<BS>` - Close parent directory
- `H` - Toggle hidden files
- `R` - Refresh tree

## File Finding (Telescope)
- `<space>ff` - Find files
- `<space>fg` - Live grep (search in files)
- `<space>fb` - Browse buffers
- `<space>fh` - Search help tags

## Code Editing
- `Ctrl+/` - Toggle comment (normal and visual mode)
- `Ctrl+n` - Select word under cursor (multi-cursor)
- `Ctrl+Up/Down` - Create cursors vertically
- `Ctrl+Click` - Place cursor manually
- `Ctrl+c` - Copy selection
- `Ctrl+x` - Cut selection
- `Ctrl+v` - Paste (works in normal, insert, and visual modes)

## Code Navigation
- `Ctrl+d` - Scroll down (keeping cursor centered)
- `Ctrl+u` - Scroll up (keeping cursor centered)
- `%` - Jump between matching brackets/tags
- `n/N` - Next/previous search result (centered)

## LSP Features
- `gd` - Go to definition
- `gh` - Show hover information
- `gi` - Go to implementation
- `gr` - Find references
- `<space>rn` - Rename symbol
- `<space>ca` - Code actions
- `[d` - Previous diagnostic
- `]d` - Next diagnostic

## AI Completion (Supermaven)
- `Tab` - Accept suggestion
- `Ctrl+]` - Clear suggestion
- `Ctrl+j` - Accept word
- `Ctrl+Space` - Trigger completion menu

## Auto-pairs and Tags
- Automatically closes brackets, quotes, and JSX tags
- Auto-renames matching JSX tags
- Smart handling of template strings

## Git Integration
- `]c` - Next git change
- `[c` - Previous git change

## General
- `<space>f` - Format code
- Mouse support enabled for clicking and scrolling
- System clipboard integration (copy/paste works with system clipboard)

## Tips
1. Press `<space>` and wait to see available commands (which-key)
2. To create nested folders, add trailing slash: `folder1/folder2/`
3. To create a file in a new folder: `folder/file.js`
4. Use `<space>ff` for quick file search
5. Use `<space>fg` to search within files
