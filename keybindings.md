# Neovim Keybindings Cheatsheet

> Note: Leader key is set to `<space>`

## File Explorer (NvimTree)
- `<space>e` - Toggle file explorer
- `a` - Create new file/folder (add `/` for folder)
- `d` - Delete file/folder
- `r` - Rename file/folder
- `c` - Copy file/folder
- `x` - Cut file/folder
- `p` - Paste file/folder
- `y` - Copy filename
- `Y` - Copy relative path
- `Enter` - Open file/folder
- `<BS>` - Close parent directory

## Window Management
- `<space>v` - Create vertical split
- `Ctrl+h` - Move to left window
- `Ctrl+l` - Move to right window
- `Ctrl+w` - Close current window

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

## Code Navigation
- `Ctrl+d` - Scroll down (keeping cursor centered)
- `Ctrl+u` - Scroll up (keeping cursor centered)
- `%` - Jump between matching brackets/tags
- `n/N` - Next/previous search result (centered)

## Code Folding
- `zm` - Fold one level
- `zr` - Unfold one level
- `zc` - Close fold under cursor
- `zo` - Open fold under cursor
- `zM` - Close all folds
- `zR` - Open all folds

## Git Integration
- `]c` - Next git change
- `[c` - Previous git change

## LSP Features
- `Ctrl+Space` - Trigger completion
- `Tab` - Next completion item
- `Shift+Tab` - Previous completion item
- `Enter` - Accept completion
- `Ctrl+e` - Cancel completion
- `Ctrl+b/f` - Scroll through documentation

## General
- `<space>f` - Format code
- Mouse support enabled for clicking and scrolling
- System clipboard integration (copy/paste works with system clipboard)

## Visual Mode
- `gc` - Comment/uncomment selected lines
- `gb` - Block comment

## Auto-pairs and Tags
- Automatically closes brackets, quotes, and JSX tags
- Auto-renames matching JSX tags
- Smart handling of template strings

## Tips
1. Press `<space>` and wait to see available commands (which-key)
2. Use `Ctrl+/` for quick commenting like in VSCode
3. Use `<space>ff` for quick file search
4. Use `<space>fg` to search within files

Remember: Most commands that start with `<space>` will show available options if you wait a moment after pressing space (thanks to which-key plugin).
