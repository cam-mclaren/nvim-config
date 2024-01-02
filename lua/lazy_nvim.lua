local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", --latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{
		"nvim-tree/nvim-tree.lua",
		tag = "nightly",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"neoclide/coc.nvim",
		branch = "release",
	},
	{
		"benmills/vimux",
		config = function()
			vim.g.VimuxOrientation = "v"
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
	},
	{
		"karb94/neoscroll.nvim",
	},
	{
		"christoomey/vim-tmux-navigator",
	},
	{
		"tpope/vim-fugitive",
	},
	{ "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
		end,
	},
})
