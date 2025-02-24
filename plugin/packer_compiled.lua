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
    config = { "\27LJ\2\nS\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0009\0\4\0B\0\1\1K\0\1\0\fcurrent\rlinewise\vtoggle\16Comment.api\frequire◊\1\0\0\6\0\f\0\0266\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0+\4\1\0+\5\2\0B\0\5\0026\1\0\0009\1\1\0019\1\4\1\18\3\0\0'\4\5\0+\5\1\0B\1\4\0016\1\6\0'\3\a\0B\1\2\0029\1\b\0019\1\t\0016\3\0\0009\3\n\0039\3\v\3B\3\1\0A\1\0\1K\0\1\0\15visualmode\afn\rlinewise\vtoggle\16Comment.api\frequire\anx\18nvim_feedkeys\n<ESC>\27nvim_replace_termcodes\bapi\bvimÆ\2\1\0\6\0\18\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0003\4\r\0005\5\14\0B\0\5\0016\0\b\0009\0\t\0009\0\n\0'\2\15\0'\3\f\0003\4\16\0005\5\17\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\0\6x\1\0\2\vsilent\2\fnoremap\2\0\n<C-_>\6n\bset\vkeymap\bvim\ropleader\1\0\2\tline\agc\nblock\agb\ftoggler\1\0\2\tline\bgcc\nblock\bgbc\1\0\4\vsticky\2\fpadding\2\ropleader\0\ftoggler\0\nsetup\fComment\frequire\0" },
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
    config = { "\27LJ\2\n#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvimΩ\1\1\1\b\0\14\0\0236\1\0\0009\1\1\0019\1\2\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0003\6\b\0005\a\t\0=\0\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\v\0003\6\f\0005\a\r\0=\0\n\aB\2\5\0012\0\0ÄK\0\1\0\1\0\2\texpr\2\vbuffer\0\0\a[c\vbuffer\1\0\2\texpr\2\vbuffer\0\0\a]c\6n\bset\vkeymap\bvim\rgitsigns\vloaded\fpackage’\3\1\0\5\0\22\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\3=\3\17\0025\3\18\0=\3\19\0023\3\20\0=\3\21\2B\0\2\1K\0\1\0\14on_attach\0\28current_line_blame_opts\1\0\3\18virt_text_pos\beol\14virt_text\2\ndelay\3Ù\3\nsigns\1\0\5\15signcolumn\2\28current_line_blame_opts\0\23current_line_blame\2\14on_attach\0\nsigns\0\14untracked\1\0\1\ttext\b‚îÜ\17changedelete\1\0\1\ttext\6~\14topdelete\1\0\1\ttext\b‚Äæ\vdelete\1\0\1\ttext\6_\vchange\1\0\1\ttext\b‚îÇ\badd\1\0\6\17changedelete\0\14untracked\0\14topdelete\0\vdelete\0\vchange\0\badd\0\1\0\1\ttext\b‚îÇ\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Daniel Y Radcliffe\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
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
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n¬\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\3\blua\0\tjava\1\15javascript\0\1\2\0\0\vstring\1\0\2\rcheck_ts\2\14ts_config\0\nsetup\19nvim-autopairs\frequire\0" },
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
    config = { "\27LJ\2\nç\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\ffilters\1\0\1\rdotfiles\2\tview\1\0\2\tview\0\ffilters\0\1\0\2\tside\nright\nwidth\3\30\nsetup\14nvim-tree\frequire\0" },
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
    config = { "\27LJ\2\n∑\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14filetypes\1\0\1\14filetypes\0\1\v\0\0\thtml\15javascript\15typescript\20javascriptreact\20typescriptreact\vsvelte\bvue\btsx\bjsx\bxml\nsetup\20nvim-ts-autotag\frequire\0" },
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
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvimΩ\1\1\1\b\0\14\0\0236\1\0\0009\1\1\0019\1\2\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0003\6\b\0005\a\t\0=\0\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\v\0003\6\f\0005\a\r\0=\0\n\aB\2\5\0012\0\0ÄK\0\1\0\1\0\2\texpr\2\vbuffer\0\0\a[c\vbuffer\1\0\2\texpr\2\vbuffer\0\0\a]c\6n\bset\vkeymap\bvim\rgitsigns\vloaded\fpackage’\3\1\0\5\0\22\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\3=\3\17\0025\3\18\0=\3\19\0023\3\20\0=\3\21\2B\0\2\1K\0\1\0\14on_attach\0\28current_line_blame_opts\1\0\3\18virt_text_pos\beol\14virt_text\2\ndelay\3Ù\3\nsigns\1\0\5\15signcolumn\2\28current_line_blame_opts\0\23current_line_blame\2\14on_attach\0\nsigns\0\14untracked\1\0\1\ttext\b‚îÜ\17changedelete\1\0\1\ttext\6~\14topdelete\1\0\1\ttext\b‚Äæ\vdelete\1\0\1\ttext\6_\vchange\1\0\1\ttext\b‚îÇ\badd\1\0\6\17changedelete\0\14untracked\0\14topdelete\0\vdelete\0\vchange\0\badd\0\1\0\1\ttext\b‚îÇ\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\n∑\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14filetypes\1\0\1\14filetypes\0\1\v\0\0\thtml\15javascript\15typescript\20javascriptreact\20typescriptreact\vsvelte\bvue\btsx\bjsx\bxml\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n¬\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\3\blua\0\tjava\1\15javascript\0\1\2\0\0\vstring\1\0\2\rcheck_ts\2\14ts_config\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0009\0\4\0B\0\1\1K\0\1\0\fcurrent\rlinewise\vtoggle\16Comment.api\frequire◊\1\0\0\6\0\f\0\0266\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0+\4\1\0+\5\2\0B\0\5\0026\1\0\0009\1\1\0019\1\4\1\18\3\0\0'\4\5\0+\5\1\0B\1\4\0016\1\6\0'\3\a\0B\1\2\0029\1\b\0019\1\t\0016\3\0\0009\3\n\0039\3\v\3B\3\1\0A\1\0\1K\0\1\0\15visualmode\afn\rlinewise\vtoggle\16Comment.api\frequire\anx\18nvim_feedkeys\n<ESC>\27nvim_replace_termcodes\bapi\bvimÆ\2\1\0\6\0\18\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0003\4\r\0005\5\14\0B\0\5\0016\0\b\0009\0\t\0009\0\n\0'\2\15\0'\3\f\0003\4\16\0005\5\17\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\0\6x\1\0\2\vsilent\2\fnoremap\2\0\n<C-_>\6n\bset\vkeymap\bvim\ropleader\1\0\2\tline\agc\nblock\agb\ftoggler\1\0\2\tline\bgcc\nblock\bgbc\1\0\4\vsticky\2\fpadding\2\ropleader\0\ftoggler\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nv\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\1\vwindow\0\1\0\2\rposition\vbottom\vborder\vsingle\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nç\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\ffilters\1\0\1\rdotfiles\2\tview\1\0\2\tview\0\ffilters\0\1\0\2\tside\nright\nwidth\3\30\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
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
