-- Camerons init.lua
--

-- language highlighting
require('languages/yaml')

-- Load plugins
require('plugins')
print("Loaded plugins\n")

 -- disable netrw at the very start of your init.lua (strongly advised)
 vim.g.loaded_netrw = 1
 vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
 vim.opt.termguicolors = true

-- set devicons config
require('nvim-web-devicons').setup({
    override_by_extension = {
        ["txt"] = {
            icon ="",
	    color = "#428850",
	    cterm_color = "65",
    	    name = "text"
    }}});

-- set nvim keyboard to work with system desktop keyboard.
require('clipboard')
print('Loaded clipboard.lua')

-- Load nvim-tree plugin
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
vim.api.nvim_set_keymap('n', '<space>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>f', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
print("Loaded nvim-tree\n")

vim.api.nvim_command("set autoindent expandtab tabstop=4 shiftwidth=4")

-- Load my theme (Mostly status bar config)
require('mytheme')
print("Loaded mytheme.lua\n")

-- vimux commands
vim.cmd( [[ command! Run VimuxRunCommand("python3 " . bufname("%")) ]]) -- I don't really use these
vim.cmd( [[ command! Myshell !tmux split-window -v -n cams_shell_window ]]) -- But they could be useful one day
print("Custom vimux editor commands added")

--vim.api.nvim_set_keymap('n', '<space>o', 'o<esc>', {noremap = true, silent = true})

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
print("Loaded indent_blankline\n")

-- Plenary is used by Treesitter
require('plenary')
print("Loaded plenary\n")

-- Load diffview for git comparisons
require("diffview").setup{}
print("Loaded diffview\n")

-- Treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = {"c", "lua", "python", "vim" },
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

require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
})
print("Loaded neoscroll")

vim.api.nvim_command("au BufRead,BufNewFile *.yaml.j2 set filetype=yaml")
vim.api.nvim_command("au BufRead,BufNewFile *.yaml.j2 set filetype=yaml")

