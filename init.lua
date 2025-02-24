vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "

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
                view = { width = 30, side = "left" },
                filters = { dotfiles = true }
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

    -- Automatically sync plugins if packer.nvim was just installed
    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- Mason Setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "tsserver",    -- TypeScript/JavaScript
        "html",        -- HTML
        "cssls",       -- CSS
        "lua_ls",      -- Lua
        "prettier",    -- Prettier formatter
    },
    automatic_installation = true
})

-- Completion setup
local cmp = require('cmp')
local luasnip = require('luasnip')
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' }
    })
})

-- LSP Configuration
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Common on_attach function for LSP
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Disable formatting for tsserver as we'll use prettier
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
    end
end

-- Remove the format-on-save autocmd

-- Prettier
require('lspconfig').prettierd.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        -- Format on save for Prettier-supported files
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                if client.server_capabilities.documentFormattingProvider then
                    vim.lsp.buf.format({ 
                        bufnr = bufnr,
                        timeout_ms = 5000,
                    })
                end
            end
        })
    end,
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "css",
        "scss",
        "html"
    },
    settings = {
        prettier = {
            singleQuote = true,
            semi = false,
            tabWidth = 2,
            useTabs = false,
            printWidth = 80,
            trailingComma = "all",
            jsxSingleQuote = true,
            arrowParens = "avoid",
            bracketSpacing = true,
        }
    }
})

-- TypeScript/JavaScript
require('lspconfig').tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- HTML
require('lspconfig').html.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- CSS
require('lspconfig').cssls.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- Lua
require('lspconfig').lua_ls.setup({
    capabilities = capabilities,
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
        enable = true
    }
}

-- Set filetypes for JSX/TSX files
vim.filetype.add({
    extension = {
        jsx = "javascriptreact",
        tsx = "typescriptreact"
    }
})

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
