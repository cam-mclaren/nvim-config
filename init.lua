-- Camerons init.lua
--
-- language highlighting
--
require("languages/yaml")
require("languages/python")

require("lazy_nvim")

require("fidget").setup(
  {
    notification = {
      override_vim_notify = true
    }
  }
)
vim.notify("Loaded lazy\n", vim.log.levels.INFO)
vim.notify("Loaded fidget\n", vim.log.levels.INFO)

-- Plenary is used by Treesitter
require("plenary")
vim.notify("Loaded plenary\n", vim.log.levels.INFO)

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.cmd([[highlight Normal guibg=0x475258 guifg=0xd3c6aa]])
-- Tmux filetype
vim.cmd([[au BufRead,BufNewFile *.tmux setf tmux]])

-- set devicons config
require("nvim-web-devicons").setup({
	override_by_extension = {
		--		["txt"] = {
		--			icon = "",
		--			color = "#428850",
		--			cterm_color = "65",
		--			name = "text",
		--		},
	},
})

-- set nvim keyboard to work with system desktop keyboard.
require("clipboard")
vim.notify("Loaded clipboard.lua", vim.log.levels.INFO)

-- Load nvim-tree plugin
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	actions = { open_file = { resize_window = true } },
	view = {
		width = {
			min = 30,
			max = 80,
		},
    preserve_window_proportions = true
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

vim.api.nvim_set_keymap("n", "<space>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>f", ":NvimTreeFocus <CR>", { noremap = true, silent = true })
vim.notify("Loaded nvim-tree\n", vim.log.levels.INFO)

vim.api.nvim_command("set autoindent expandtab tabstop=2 shiftwidth=2")
vim.cmd([[set nowrap]])
vim.cmd([[set foldmethod=syntax]])
vim.opt.foldlevelstart=99

-- Set colorscheme to unokai
vim.cmd([[colorscheme unokai]])

-- A few settings to quickly create a terminal window under 
-- the current buffer within nvim itself. I initially thought
-- I might replace tmux with this but I think that's unlikely now.
vim.cmd([[set noea]])
vim.cmd([[set splitbelow]])

-- Load my theme (Mostly status bar config)
require("mytheme")
vim.notify("Loaded mytheme.lua\n", vim.log.levels.INFO)

-- vimux commands
--vim.cmd([[ command! Run VimuxRunCommand("python3 " . bufname("%")) ]]) -- I don't really use these
--vim.cmd([[ command! Myshell !tmux split-window -v -n cams_shell_window ]]) -- But they could be useful one day
--print("Custom vimux editor commands added")

--vim.api.nvim_set_keymap('n', '<space>o', 'o<esc>', {noremap = true, silent = true})

-- Load diffview for git comparisons
require("diffview").setup({})
vim.notify("Loaded diffview\n", vim.log.levels.INFO)

-- Treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "html", "css", "go", "c", "lua", "python", "vim" },
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
})
vim.notify("Loaded nvim-treesitter\n", vim.log.levels.INFO)

require("ibl").setup({
	scope = {

		enabled = true,
		show_start = true,
		show_end = false,
		injected_languages = false,
		highlight = { "Function", "Label" },
		priority = 500,
	},
})
vim.notify("Loaded indent_blankline\n", vim.log.levels.INFO)

-- Use K to show documentation in preview window
local keyset = vim.keymap.set
-- print("Setting K to show hover documentation from CoC LSP client")
function _G.show_docs()
	local cw = vim.fn.expand("<cword>")
	if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
		vim.api.nvim_command("h " .. cw)
	elseif vim.api.nvim_eval("coc#rpc#ready()") then
		vim.fn.CocActionAsync("doHover")
	else
		vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
	end
end
keyset("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })


function _G.jump_to_def()
    local cw = vim.fn.expand("<cword>")
    if vim.api.nvim_eval("coc#rpc#ready()") then
        vim.fn.CocActionAsync("jumpDefinition")
    end
end
keyset("n", "<space>g", "<CMD>lua _G.jump_to_def()<CR>", { silent = true })

function _G.jump_to_imp()
    local cw = vim.fn.expand("<cword>")
    if vim.api.nvim_eval("coc#rpc#ready()") then
        vim.fn.CocActionAsync("jumpDeclaration")
    end
end
keyset("n", "<space>G", "<CMD>lua _G.jump_to_imp()<CR>", { silent = true })

require("neoscroll").setup({
	-- All these keys will be mapped to their corresponding default scrolling animation
	mappings = {
		"<C-u>",
		"<C-d>",
		"<C-b>",
		"<C-f>",
		"<C-y>",
		"<C-e>",
		"zt",
		"zz",
		"zb",
	},
	hide_cursor = true, -- Hide cursor while scrolling
	stop_eof = true, -- Stop at <EOF> when scrolling downwards
	respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	easing_function = nil, -- Default easing function
	pre_hook = nil, -- Function to run before the scrolling animation starts
	post_hook = nil, -- Function to run after the scrolling animation ends
	performance_mode = false, -- Disable "Performance Mode" on all buffers.
})
vim.notify("Loaded neoscroll", vim.log.levels.INFO)

-- telescope mappings
vim.api.nvim_set_keymap("n", "<space>sf", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>sw", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.notify("Loaded Telescope Mappings", vim.log.levels.INFO)


require("nvim_comment").setup()
vim.notify("Loaded nvim_comment", vim.log.levels.INFO)

-- Functions
require("functions/GetFN")
vim.notify("Loaded custom GetFN function", vim.log.levels.INFO)

