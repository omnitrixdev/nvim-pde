vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "

-- Fix number column width
vim.opt.numberwidth = 4      -- Minimum number column width
vim.opt.signcolumn = "yes:1" -- Always show sign column with fixed width

-- Bootstrap packer.nvim
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Initialize plugins using packer.nvim
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer itself
    use "rebelot/kanagawa.nvim" -- Kanagawa colorscheme

    -- Basic utilities
    use 'tpope/vim-sensible'
    use 'nvim-lua/plenary.nvim'

    -- LSP Config (language server protocol)
    use 'neovim/nvim-lspconfig'

    -- Status line
    use 'nvim-lualine/lualine.nvim'

    -- File tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require("nvim-tree").setup {
                view = {
                    width = 30,
                    side = "left"
                },
                filters = {
                    dotfiles = true
                },
                actions = {
                    open_file = {
                        quit_on_open = false,
                        window_picker = {
                            enable = true
                        }
                    }
                },
                renderer = {
                    icons = {
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = true
                        }
                    }
                },
                on_attach = function(bufnr)
                    local api = require('nvim-tree.api')
                    
                    local function opts(desc)
                        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                    end

                    -- Default mappings
                    api.config.mappings.default_on_attach(bufnr)

                    -- Custom mappings
                    vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
                    vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
                    vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
                    vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
                    vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
                    vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
                    vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
                    vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Path'))
                end
            }
        end
    }

    -- Syntax highlighting with Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })()
        end
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- Telescope file browser extension
    use { "nvim-telescope/telescope-file-browser.nvim" }

    -- Autocompletion and snippets
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets'
        }
    }

    -- LSP Kind for nice icons in completion
    use {
        'onsails/lspkind.nvim',
        config = function()
            require('lspkind').init({
                mode = 'symbol_text',
                maxwidth = 50,
                symbol_map = {
                    Supermaven = "🤖"
                }
            })
        end
    }

    -- Mason for easy LSP installation
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    }

    -- Git signs
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                signs = {
                    add          = { text = '│' },
                    change       = { text = '│' },
                    delete       = { text = '_' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
                signcolumn = true,
                current_line_blame = true,
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol',
                    delay = 500,
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    -- Navigation between hunks
                    vim.keymap.set('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, {expr=true, buffer = bufnr})

                    vim.keymap.set('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, {expr=true, buffer = bufnr})
                end
            })
        end
    }

    -- Multi-cursor support
    use 'mg979/vim-visual-multi'

    -- Auto pairs and tags
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,  -- Enable treesitter
                ts_config = {
                    lua = {'string'},
                    javascript = {'template_string'},
                    java = false,
                }
            })
        end
    }

    -- Auto close and rename JSX tags
    use {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup({
                filetypes = {
                    'html', 'javascript', 'typescript', 'javascriptreact', 
                    'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'xml'
                },
            })
        end
    }

    -- Comment toggler
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                padding = true,
                sticky = true,
                toggler = {
                    line = 'gcc',
                    block = 'gbc',
                },
                opleader = {
                    line = 'gc',
                    block = 'gb',
                },
            })
            
            -- Add Ctrl+/ mapping for both normal and visual mode
            vim.keymap.set('n', '<C-_>', function()
                require('Comment.api').toggle.linewise.current()
            end, { noremap = true, silent = true })
            
            vim.keymap.set('x', '<C-_>', function()
                local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
                vim.api.nvim_feedkeys(esc, 'nx', false)
                require('Comment.api').toggle.linewise(vim.fn.visualmode())
            end, { noremap = true, silent = true })
        end
    }

    -- Which-key for keybinding hints
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({
                window = {
                    border = "single",
                    position = "bottom",
                },
            })
        end
    }

    -- Highlight and navigate between matching code blocks
    use {
        'andymass/vim-matchup',
        setup = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end
    }

    -- Supermaven AI completion
    use {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<Tab>",
                    clear_suggestion = "<C-]>",
                    accept_word = "<C-j>",
                },
                color = {
                    suggestion_color = "#ffffff",
                    cterm = 244,
                },
                log_level = "info",
                disable_inline_completion = true, -- disable inline since we're using cmp
            })
        end
    }

    -- Prettier through null-ls
    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier.with({
                        filetypes = {
                            "javascript",
                            "javascriptreact",
                            "typescript",
                            "typescriptreact",
                            "vue",
                            "css",
                            "scss",
                            "less",
                            "html",
                            "json",
                            "yaml",
                            "markdown",
                            "graphql"
                        },
                    }),
                },
            })
            
            -- Format on save
            vim.cmd([[
                augroup FormatAutogroup
                    autocmd!
                    autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.json,*.md lua vim.lsp.buf.format()
                augroup END
            ]])
        end
    }

    -- Automatically sync plugins if packer.nvim was just installed
    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- Mason Setup
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "typescript-language-server",  -- TypeScript/JavaScript
        "eslint-lsp",                 -- ESLint
        "html-lsp",                   -- HTML
        "css-lsp",                    -- CSS
        "json-lsp",                   -- JSON
    },
    automatic_installation = true
})

-- LSP Configuration
local lspconfig = require('lspconfig')

-- TypeScript/JavaScript
lspconfig.typescript.setup({
    on_attach = function(client, bufnr)
        -- Disable tsserver formatting as we will use prettier
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
})

-- HTML
lspconfig.html.setup({
    on_attach = on_attach
})

-- CSS
lspconfig.cssls.setup({
    on_attach = on_attach
})

-- Lua
lspconfig.lua_ls.setup({
    on_attach = on_attach
})

-- Indentation settings
vim.opt.expandtab = true      -- Convert tabs to spaces
vim.opt.tabstop = 2          -- Number of spaces for a tab
vim.opt.shiftwidth = 2       -- Number of spaces for each indentation level
vim.opt.softtabstop = 2      -- Number of spaces for a tab in editing operations
vim.opt.smartindent = true   -- Smart autoindenting on new lines
vim.opt.autoindent = true    -- Copy indent from current line when starting a new line

-- File type specific indentation
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.softtabstop = 2
        vim.bo.expandtab = true
        vim.bo.autoindent = true
        vim.bo.smartindent = true
    end
})

-- Folding settings
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = true
vim.opt.foldlevel = 99 -- Start with all folds open

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
        "lua"
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },
    autotag = {
        enable = true,
        filetypes = {
            'html', 'javascript', 'typescript', 'javascriptreact', 
            'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'xml'
        },
    }
}

-- Set filetypes for JSX/TSX files
vim.filetype.add({
    extension = {
        jsx = "javascriptreact",
        tsx = "typescriptreact"
    }
})

-- Status line configuration
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
            {
                'filename',
                path = 1,  -- Show relative path
                file_status = true,
                symbols = {
                    modified = ' ●',
                    readonly = ' ',
                    unnamed = '[No Name]',
                }
            }
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

-- Default options:
require('kanagawa').setup({
    compile = false,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,
    dimInactive = false,
    terminalColors = true,
    colors = { palette = {}, theme = { wave = {}, lotus = {}, dragon = {}, all = {} } },
    overrides = function(colors) return {} end,
    theme = "wave",
    background = { dark = "wave", light = "lotus" }
})

-- Setup must be called before loading colorscheme
vim.cmd("colorscheme kanagawa")

-- Keymap for NvimTree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Basic keymaps
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>', ':q<CR>', { noremap = true, silent = true })

-- Format keybinding
vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format({ timeout_ms = 5000 })
end, { noremap = true, silent = true })

-- Telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Telescope setup
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {"node_modules"},
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous"
      }
    }
  }
}

-- Additional editor settings
vim.opt.clipboard = "unnamedplus"   -- Use system clipboard
vim.opt.scrolloff = 8               -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8           -- Keep 8 columns left/right of cursor
vim.opt.cursorline = true           -- Highlight current line
vim.opt.wrap = false                -- Don't wrap lines
vim.opt.mouse = "a"                 -- Enable mouse support

-- Copy/Paste keybindings
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })        -- Copy in visual mode
vim.keymap.set('v', '<C-x>', '"+d', { noremap = true, silent = true })        -- Cut in visual mode
vim.keymap.set('n', '<C-v>', '"+p', { noremap = true, silent = true })        -- Paste in normal mode
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })     -- Paste in insert mode
vim.keymap.set('c', '<C-v>', '<C-r>+', { noremap = true, silent = true })     -- Paste in command mode
vim.keymap.set('v', '<C-v>', '"+P', { noremap = true, silent = true })        -- Paste in visual mode

-- Additional keymaps for better navigation
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })  -- Keep cursor in middle when jumping
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })        -- Keep cursor in middle when searching
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })

-- Completion setup
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = cmp.config.sources({
        { name = 'supermaven' },  -- Add Supermaven as a source
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            symbol_map = {
                Supermaven = "🤖"
            }
        })
    }
})

-- Common on_attach function for LSP
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- LSP keybindings
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end
