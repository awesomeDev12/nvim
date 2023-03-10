-- Keymaps

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ";"

map("n","<C-w>","<Nop>")
map("i","<C-w>","<Nop>")
map("v","<C-w>","<Nop>")

map("n","<C-q>","<Nop>")
map("i","<C-q>","<Nop>")
map("v","<C-q>","<Nop>")


map("n", "<C-d>", "<C-d>zz", { silent = true, noremap = false })
map("n", "<C-u>", "<C-u>zz", { silent = true, noremap = false })


-- map("n", "<Leader>k", "<C-u>zz", { silent = true, noremap = false })
-- map("n", "<Leader>j", "<C-d>zz", { silent = true, noremap = false })


-- map("v", "J", ":m '>+1<CR>gv=gv", { silent = true, noremap = false })
-- map("v", "K", ":m '<-2<CR>gv=gv", { silent = true, noremap = false })

map("v", "<Leader>y", "\"+y", { silent = true, noremap = false })


-- vim.keymap.set("n", "J", "mzJ`z")


-- Undo Tree plugin written in vimscript
-- vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { silent = true, noremap = true })


-- Undo Tree plugin written in lua
vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })

-- or
-- vim.keymap.set('n', '<leader>uo', require('undotree').open, { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>uc', require('undotree').close, { noremap = true, silent = true })



-- Coc format the entire buffe
vim.keymap.set('n', '<leader>F', vim.cmd.Format, { silent = true, noremap = true })



map("n","<Leader>g",":GFiles <CR>")
map("n","<Leader>G",":GGrep <CR>")
map("n","<Leader>z",":FZF <CR>")
map("n","<Leader>Z",":FZF ")

-- Open a terminal window at the path to the directory containing the current file
map("n","<Leader>b",":tabnew | term <CR>")
-- map("n","<Leader>B",":term sh -c 'cd %:p:h; /bin/bash' <CR>")


-- Move the cursor to next window
map("n","<C-a>","<C-w>w")
map("i","<C-a>","<Esc><C-w>wi")
map("v","<C-a>","<Esc><C-w>wi")


-- ALE linter
-- for ale linter key binding to move to next error using Ctrl + e
-- nmap <silent> <C-e> <Plug>(ale_next_wrap)
-- nnoremap <c-e> <Plug>(ale_next_wrap) 
-- inoremap <c-e> <Esc> <Plug>(ale_next_wrap) 
-- vnoremap <c-e> <Esc> <Plug>(ale_next_wrap)
map('n','<Leader>d',"<Plug>(ale_previous_wrap)")
map("n","<Leader>e","<Plug>(ale_next_wrap)")



vim.api.nvim_command('command BufOnly silent! execute "%bd|e#|bd#"')


--  CP

-- function close_io_buffers is defined in globals.lua
map('n','@c',':lua close_io_buffers() <CR>:40vs input.txt <CR>:sp output.txt <CR>:wincmd W <CR>:wincmd W <CR>',{ silent = true, noremap = true})
map('n','@C',':lua close_io_buffers() <CR>:40vs input.txt <CR>:sp output.txt <CR>:wincmd W <CR>:wincmd W <CR>',{ silent = true, noremap = true})
map('n','@d',':lua close_io_buffers() <CR>', { silent = true, noremap = true })
map('n','@D',':lua close_io_buffers() <CR>', { silent = true, noremap = true })





-- Unused Keymaps

-- map("n","<C-f>",":NvimTreeToggle <CR>")
-- map("i","<C-f>","<Esc>:NvimTreeToggle <CR>")
-- map("n","<Leader>t",":NvimTreeToggle <CR>")

-- map("n","<Leader>t",":NERDTreeToggleVCS %:p:h <CR>")
-- See in vimscript keymap for <Leader>t
-- map("n","<Leader>T",":NERDTreeToggle %:p:h <CR>")


-- Go to normal mode without pressing escape
-- map("i","jk","<Esc>")
-- map("i","kj","<Esc>")


-- map("n","<Leader>iop","<Esc>:40vs input.txt <CR>:sp output.txt <CR><C-w>w")

-- map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })
-- map("n", "<Leader>", ":<C-u>WhichKey ','<CR>" { silent = true })
-- map("n", "<Leader>?", ":WhichKey ','<CR>")
-- map("n", "<Leader>a", ":cclose<CR>")












