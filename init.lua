-- examples for your init.lua
--
--
--
vim.cmd([[set clipboard=unnamedplus]])

 -- disable netrw at the very start of your init.lua (strongly advised)
 vim.g.loaded_netrw = 1
 vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
 vim.opt.termguicolors = true
--
-- -- empty setup using defaults
-- require("nvim-tree").setup()
--
-- -- OR setup with some options
-- require('nvim-tree').config.actions.open_file)
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    actions = { open_file = { resize_window = false } },
    view = {
        width = 30,
        mappings = {
            list = {
                {
                    key = "u",
                    action = "dir_up"
                },
            },
        },
    },
    renderer = {
    group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})



vim.api.nvim_command("set autoindent expandtab tabstop=4 shiftwidth=4")
require('plugins')
print("Loaded plugins\n")
require('nvim-tree')
print("Loaded nvim-tree\n")
require('mytheme')
print("Loaded mytheme.lua\n")

vim.cmd( [[ command! Run VimuxRunCommand("python3 " . bufname("%")) ]])
vim.cmd( [[ command! Myshell !tmux split-window -v -n cams_shell_window ]]) 
vim.api.nvim_set_keymap('n', '<space>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>f', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<space>o', 'o<esc>', {noremap = true, silent = true})
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
print("Loaded indent_blankline\n")

require('plenary')
print("Loaded plenary\n")
require("diffview").setup{}
print("Loaded diffview\n")

require'nvim-treesitter.configs'.setup {
	ensure_installed = {"c", "lua", "python", "vim", "help" },
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	}
}
print("Loaded nvim-treesitter\n")

-- Use K to show documentation in preview window
local keyset = vim.keymap.set

print("Setting K to show hover documentation from CoC LSP client")
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})


