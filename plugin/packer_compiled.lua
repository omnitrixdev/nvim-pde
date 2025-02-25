-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\DANIEL~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\share\\lua\\5.1\\?.lua;C:\\Users\\DANIEL~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\DANIEL~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\DANIEL~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\DANIEL~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nS\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0009\0\4\0B\0\1\1K\0\1\0\fcurrent\rlinewise\vtoggle\16Comment.api\frequire×\1\0\0\6\0\f\0\0266\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0+\4\1\0+\5\2\0B\0\5\0026\1\0\0009\1\1\0019\1\4\1\18\3\0\0'\4\5\0+\5\1\0B\1\4\0016\1\6\0'\3\a\0B\1\2\0029\1\b\0019\1\t\0016\3\0\0009\3\n\0039\3\v\3B\3\1\0A\1\0\1K\0\1\0\15visualmode\afn\rlinewise\vtoggle\16Comment.api\frequire\anx\18nvim_feedkeys\n<ESC>\27nvim_replace_termcodes\bapi\bvim®\2\1\0\6\0\18\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0003\4\r\0005\5\14\0B\0\5\0016\0\b\0009\0\t\0009\0\n\0'\2\15\0'\3\f\0003\4\16\0005\5\17\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\0\6x\1\0\2\fnoremap\2\vsilent\2\0\n<C-_>\6n\bset\vkeymap\bvim\ropleader\1\0\2\tline\agc\nblock\agb\ftoggler\1\0\2\tline\bgcc\nblock\bgbc\1\0\4\vsticky\2\fpadding\2\ropleader\0\ftoggler\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2€'\0\3\0002\0\a€6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0€L\0\2\0L\0\2\0\1À\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2€'\0\3\0002\0\a€6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0€L\0\2\0L\0\2\0\1À\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvim½\1\1\1\b\0\14\0\0236\1\0\0009\1\1\0019\1\2\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0003\6\b\0005\a\t\0=\0\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\v\0003\6\f\0005\a\r\0=\0\n\aB\2\5\0012\0\0€K\0\1\0\1\0\2\vbuffer\0\texpr\2\0\a[c\vbuffer\1\0\2\vbuffer\0\texpr\2\0\a]c\6n\bset\vkeymap\bvim\rgitsigns\vloaded\fpackageÕ\3\1\0\5\0\22\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\3=\3\17\0025\3\18\0=\3\19\0023\3\20\0=\3\21\2B\0\2\1K\0\1\0\14on_attach\0\28current_line_blame_opts\1\0\3\18virt_text_pos\beol\14virt_text\2\ndelay\3ô\3\nsigns\1\0\5\nsigns\0\14on_attach\0\15signcolumn\2\28current_line_blame_opts\0\23current_line_blame\2\14untracked\1\0\1\ttext\bâ”†\17changedelete\1\0\1\ttext\6~\14topdelete\1\0\1\ttext\bâ€¾\vdelete\1\0\1\ttext\6_\vchange\1\0\1\ttext\bâ”‚\badd\1\0\6\14untracked\0\badd\0\17changedelete\0\14topdelete\0\vdelete\0\vchange\0\1\0\1\ttext\bâ”‚\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lspkind.nvim"] = {
    config = { "\27LJ\2\n‰\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15symbol_map\1\0\1\15Supermaven\tðŸ¤–\1\0\3\tmode\16symbol_text\15symbol_map\0\rmaxwidth\0032\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nœ\4\0\0\t\0\15\1\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\n\0004\4\3\0009\5\3\0009\5\4\0059\5\5\0059\5\6\0055\a\b\0005\b\a\0=\b\t\aB\5\2\0?\5\0\0=\4\v\3B\1\2\0016\1\f\0009\1\r\1'\3\14\0B\1\2\1K\0\1\0â\1                augroup FormatAutogroup\n                    autocmd!\n                    autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.json,*.md lua vim.lsp.buf.format()\n                augroup END\n            \bcmd\bvim\fsources\1\0\1\fsources\0\14filetypes\1\0\1\14filetypes\0\1\14\0\0\15javascript\20javascriptreact\15typescript\20typescriptreact\bvue\bcss\tscss\tless\thtml\tjson\tyaml\rmarkdown\fgraphql\twith\rprettier\15formatting\rbuiltins\nsetup\fnull-ls\frequire\3€€À™\4\0" },
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nÂ\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\3\tjava\1\blua\0\15javascript\0\1\2\0\0\vstring\1\0\2\rcheck_ts\2\14ts_config\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nk\0\1\4\1\4\0\b5\1\1\0'\2\0\0\18\3\0\0&\2\3\2=\2\2\1-\2\0\0=\2\3\1L\1\2\0\0À\vbuffer\tdesc\1\0\5\tdesc\0\vnowait\2\vbuffer\0\fnoremap\2\vsilent\2\16nvim-tree: ô\4\1\1\v\0$\0f6\1\0\0'\3\1\0B\1\2\0023\2\2\0009\3\3\0019\3\4\0039\3\5\3\18\5\0\0B\3\2\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\n\0009\a\v\0019\a\f\a\18\b\2\0'\n\r\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\14\0009\a\v\0019\a\15\a\18\b\2\0'\n\16\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\17\0009\a\v\0019\a\18\a\18\b\2\0'\n\19\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\20\0009\a\v\0019\a\21\a9\a\22\a\18\b\2\0'\n\23\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\24\0009\a\v\0019\a\25\a\18\b\2\0'\n\26\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\27\0009\a\v\0019\a\28\a\18\b\2\0'\n\29\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\30\0009\a\v\0019\a\21\a9\a\31\a\18\b\2\0'\n \0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6!\0009\a\v\0019\a\21\a9\a\"\a\18\b\2\0'\n#\0B\b\2\0A\3\3\0012\0\0€K\0\1\0\14Copy Path\18relative_path\6Y\14Copy Name\rfilename\6y\nPaste\npaste\6p\bCut\bcut\6x\tCopy\tnode\tcopy\6c\vRename\vrename\6r\vDelete\vremove\6d\vCreate\vcreate\afs\6a\6n\bset\vkeymap\bvim\22default_on_attach\rmappings\vconfig\0\18nvim-tree.api\frequire‘\3\1\0\6\0\22\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\v\0005\4\b\0005\5\t\0=\5\n\4=\4\f\3=\3\r\0025\3\17\0005\4\15\0005\5\14\0=\5\16\4=\4\18\3=\3\19\0023\3\20\0=\3\21\2B\0\2\1K\0\1\0\14on_attach\0\rrenderer\nicons\1\0\1\nicons\0\tshow\1\0\1\tshow\0\1\0\4\17folder_arrow\2\vfolder\2\tfile\2\bgit\2\factions\14open_file\1\0\1\14open_file\0\18window_picker\1\0\1\venable\2\1\0\2\17quit_on_open\1\18window_picker\0\ffilters\1\0\1\rdotfiles\2\tview\1\0\5\14on_attach\0\factions\0\ffilters\0\rrenderer\0\tview\0\1\0\2\nwidth\3\30\tside\tleft\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n·\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14filetypes\1\0\1\14filetypes\0\1\v\0\0\thtml\15javascript\15typescript\20javascriptreact\20typescriptreact\vsvelte\bvue\btsx\bjsx\bxml\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["supermaven-nvim"] = {
    config = { "\27LJ\2\n…\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\ncolor\1\0\2\ncterm\3ô\1\21suggestion_color\f#ffffff\fkeymaps\1\0\4\ncolor\0\14log_level\tinfo\30disable_inline_completion\2\fkeymaps\0\1\0\3\21clear_suggestion\n<C-]>\16accept_word\n<C-j>\22accept_suggestion\n<Tab>\nsetup\20supermaven-nvim\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\supermaven-nvim",
    url = "https://github.com/supermaven-inc/supermaven-nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-matchup"] = {
    after_files = { "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-matchup\\after\\plugin\\matchit.vim" },
    loaded = true,
    needs_bufread = false,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nv\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\1\vwindow\0\1\0\2\rposition\vbottom\vborder\vsingle\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
try_loadstring("\27LJ\2\nN\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0", "setup", "vim-matchup")
time([[Setup for vim-matchup]], false)
time([[packadd for vim-matchup]], true)
vim.cmd [[packadd vim-matchup]]
time([[packadd for vim-matchup]], false)
-- Config for: lspkind.nvim
time([[Config for lspkind.nvim]], true)
try_loadstring("\27LJ\2\n‰\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15symbol_map\1\0\1\15Supermaven\tðŸ¤–\1\0\3\tmode\16symbol_text\15symbol_map\0\rmaxwidth\0032\tinit\flspkind\frequire\0", "config", "lspkind.nvim")
time([[Config for lspkind.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0009\0\4\0B\0\1\1K\0\1\0\fcurrent\rlinewise\vtoggle\16Comment.api\frequire×\1\0\0\6\0\f\0\0266\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0+\4\1\0+\5\2\0B\0\5\0026\1\0\0009\1\1\0019\1\4\1\18\3\0\0'\4\5\0+\5\1\0B\1\4\0016\1\6\0'\3\a\0B\1\2\0029\1\b\0019\1\t\0016\3\0\0009\3\n\0039\3\v\3B\3\1\0A\1\0\1K\0\1\0\15visualmode\afn\rlinewise\vtoggle\16Comment.api\frequire\anx\18nvim_feedkeys\n<ESC>\27nvim_replace_termcodes\bapi\bvim®\2\1\0\6\0\18\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0003\4\r\0005\5\14\0B\0\5\0016\0\b\0009\0\t\0009\0\n\0'\2\15\0'\3\f\0003\4\16\0005\5\17\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\0\6x\1\0\2\fnoremap\2\vsilent\2\0\n<C-_>\6n\bset\vkeymap\bvim\ropleader\1\0\2\tline\agc\nblock\agb\ftoggler\1\0\2\tline\bgcc\nblock\bgbc\1\0\4\vsticky\2\fpadding\2\ropleader\0\ftoggler\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nÂ\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\3\tjava\1\blua\0\15javascript\0\1\2\0\0\vstring\1\0\2\rcheck_ts\2\14ts_config\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: supermaven-nvim
time([[Config for supermaven-nvim]], true)
try_loadstring("\27LJ\2\n…\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\ncolor\1\0\2\ncterm\3ô\1\21suggestion_color\f#ffffff\fkeymaps\1\0\4\ncolor\0\14log_level\tinfo\30disable_inline_completion\2\fkeymaps\0\1\0\3\21clear_suggestion\n<C-]>\16accept_word\n<C-j>\22accept_suggestion\n<Tab>\nsetup\20supermaven-nvim\frequire\0", "config", "supermaven-nvim")
time([[Config for supermaven-nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nv\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\1\vwindow\0\1\0\2\rposition\vbottom\vborder\vsingle\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2€'\0\3\0002\0\a€6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0€L\0\2\0L\0\2\0\1À\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2€'\0\3\0002\0\a€6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0€L\0\2\0L\0\2\0\1À\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvim½\1\1\1\b\0\14\0\0236\1\0\0009\1\1\0019\1\2\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0003\6\b\0005\a\t\0=\0\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\v\0003\6\f\0005\a\r\0=\0\n\aB\2\5\0012\0\0€K\0\1\0\1\0\2\vbuffer\0\texpr\2\0\a[c\vbuffer\1\0\2\vbuffer\0\texpr\2\0\a]c\6n\bset\vkeymap\bvim\rgitsigns\vloaded\fpackageÕ\3\1\0\5\0\22\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\3=\3\17\0025\3\18\0=\3\19\0023\3\20\0=\3\21\2B\0\2\1K\0\1\0\14on_attach\0\28current_line_blame_opts\1\0\3\18virt_text_pos\beol\14virt_text\2\ndelay\3ô\3\nsigns\1\0\5\nsigns\0\14on_attach\0\15signcolumn\2\28current_line_blame_opts\0\23current_line_blame\2\14untracked\1\0\1\ttext\bâ”†\17changedelete\1\0\1\ttext\6~\14topdelete\1\0\1\ttext\bâ€¾\vdelete\1\0\1\ttext\6_\vchange\1\0\1\ttext\bâ”‚\badd\1\0\6\14untracked\0\badd\0\17changedelete\0\14topdelete\0\vdelete\0\vchange\0\1\0\1\ttext\bâ”‚\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nœ\4\0\0\t\0\15\1\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\n\0004\4\3\0009\5\3\0009\5\4\0059\5\5\0059\5\6\0055\a\b\0005\b\a\0=\b\t\aB\5\2\0?\5\0\0=\4\v\3B\1\2\0016\1\f\0009\1\r\1'\3\14\0B\1\2\1K\0\1\0â\1                augroup FormatAutogroup\n                    autocmd!\n                    autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.json,*.md lua vim.lsp.buf.format()\n                augroup END\n            \bcmd\bvim\fsources\1\0\1\fsources\0\14filetypes\1\0\1\14filetypes\0\1\14\0\0\15javascript\20javascriptreact\15typescript\20typescriptreact\bvue\bcss\tscss\tless\thtml\tjson\tyaml\rmarkdown\fgraphql\twith\rprettier\15formatting\rbuiltins\nsetup\fnull-ls\frequire\3€€À™\4\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\n·\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14filetypes\1\0\1\14filetypes\0\1\v\0\0\thtml\15javascript\15typescript\20javascriptreact\20typescriptreact\vsvelte\bvue\btsx\bjsx\bxml\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nk\0\1\4\1\4\0\b5\1\1\0'\2\0\0\18\3\0\0&\2\3\2=\2\2\1-\2\0\0=\2\3\1L\1\2\0\0À\vbuffer\tdesc\1\0\5\tdesc\0\vnowait\2\vbuffer\0\fnoremap\2\vsilent\2\16nvim-tree: ô\4\1\1\v\0$\0f6\1\0\0'\3\1\0B\1\2\0023\2\2\0009\3\3\0019\3\4\0039\3\5\3\18\5\0\0B\3\2\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\n\0009\a\v\0019\a\f\a\18\b\2\0'\n\r\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\14\0009\a\v\0019\a\15\a\18\b\2\0'\n\16\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\17\0009\a\v\0019\a\18\a\18\b\2\0'\n\19\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\20\0009\a\v\0019\a\21\a9\a\22\a\18\b\2\0'\n\23\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\24\0009\a\v\0019\a\25\a\18\b\2\0'\n\26\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\27\0009\a\v\0019\a\28\a\18\b\2\0'\n\29\0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\30\0009\a\v\0019\a\21\a9\a\31\a\18\b\2\0'\n \0B\b\2\0A\3\3\0016\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6!\0009\a\v\0019\a\21\a9\a\"\a\18\b\2\0'\n#\0B\b\2\0A\3\3\0012\0\0€K\0\1\0\14Copy Path\18relative_path\6Y\14Copy Name\rfilename\6y\nPaste\npaste\6p\bCut\bcut\6x\tCopy\tnode\tcopy\6c\vRename\vrename\6r\vDelete\vremove\6d\vCreate\vcreate\afs\6a\6n\bset\vkeymap\bvim\22default_on_attach\rmappings\vconfig\0\18nvim-tree.api\frequire‘\3\1\0\6\0\22\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\v\0005\4\b\0005\5\t\0=\5\n\4=\4\f\3=\3\r\0025\3\17\0005\4\15\0005\5\14\0=\5\16\4=\4\18\3=\3\19\0023\3\20\0=\3\21\2B\0\2\1K\0\1\0\14on_attach\0\rrenderer\nicons\1\0\1\nicons\0\tshow\1\0\1\tshow\0\1\0\4\17folder_arrow\2\vfolder\2\tfile\2\bgit\2\factions\14open_file\1\0\1\14open_file\0\18window_picker\1\0\1\venable\2\1\0\2\17quit_on_open\1\18window_picker\0\ffilters\1\0\1\rdotfiles\2\tview\1\0\5\14on_attach\0\factions\0\ffilters\0\rrenderer\0\tview\0\1\0\2\nwidth\3\30\tside\tleft\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
