-- nvim top level config file
-- init.lua


require('packer-plugins')

require('globals')
require('general')
require('keymaps')


require('nvim-tree-config')
require('nvim-tree-webdevicons-config')

require('coc-config')
require('ale-config');
require('indent-line-config')


require('emmet-config')
-- require('nerdtree-config')
require('markdown-preview-config')
require('bookmarks-config')

require('general-python')

require('coderunner')
require('auto-commands')
require('telescope-config')

-- Works better with true color support
require('catppuccin-config')
require('colors-config')
-- require('marks-config')
require('undotree-config')


local function command_exists(command)
    local exit_status = os.execute("which " .. command .. " >/dev/null 2>&1")
    return exit_status == 0
end

if command_exists("ascii-image-converter") then
    -- print("ascii-image-converter command exists!")
    -- Image Viewer using Ascii art plugin
    require('image-samodostal')
else
    -- print("ascii-image-converter command does not exist!")
end




if command_exists("chafa") then
    -- print("chafa command exists!")
    -- Image preview using Chafa
    -- Needs chafa installed
    require('image-previewer-custom')
else
    -- print("chafa command does not exist!")
end



-- Vim script files

vim.cmd('source ~/.config/nvim/vimscript/ale-config.vim')
vim.cmd('source ~/.config/nvim/vimscript/general.vim')
vim.cmd('source ~/.config/nvim/vimscript/vim-commentary.vim')
vim.cmd('source ~/.config/nvim/vimscript/coc-config.vim')

-- Code runner moved to lua
-- vim.cmd('source ~/.config/nvim/vimscript/coderunner.vim')

vim.cmd('source ~/.config/nvim/vimscript/fzf-config.vim')
vim.cmd('source ~/.config/nvim/vimscript/bookmarks-config.vim')

-- vim.cmd('source ~/.config/nvim/vimscript/nerdtree-config.vim')

vim.cmd('source ~/.config/nvim/vimscript/keymaps.vim')


-- Optional / Device specific files


-- Get the path to the home directory
-- local home_dir = os.getenv("HOME") or os.getenv("USERPROFILE")
-- Moved to globals.lua

-- Print the home directory path
-- print(home_dir)

local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end


-- Coc color schemes : light or dark

if (file_exists(home_dir..'/.config/nvim/vimscript/coc-config-light.vim'))
then
vim.cmd('source ~/.config/nvim/vimscript/coc-config-light.vim')
end


if (file_exists(home_dir..'/.config/nvim/vimscript/coc-config-dark.vim'))
then
vim.cmd('source ~/.config/nvim/vimscript/coc-config-dark.vim')
end


-- Testing

if (file_exists(home_dir..'/.config/nvim/vimscript/test.vim'))
then
vim.cmd('source ~/.config/nvim/vimscript/test.vim')
end
-- Write test vimscript code in vimscript/test.vim

pcall(require,"test")
-- Write test lua code in lua/test.lua


-- check if the file exists using pcall
-- local ok, _ = pcall(require, "test")

-- if the file does not exist, print an error message
-- if not ok then
--   print("Error: " .. "test.lua" .. " not found!")
-- else
--    print("lua/test.lua ".."found")
-- end



