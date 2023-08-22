-- This file can be loaded by calling `lua require('plugins')` from your init.vim --
 -- Only required if you have packer configured as `opt`
 return require('packer').startup(function(use)
   -- Packer can manage itself
     use 'wbthomason/packer.nvim'
--     use 'rstacruz/vim-closer'
	use {
	 	    'nvim-tree/nvim-tree.lua',
		    requires = {
			 	  'nvim-tree/nvim-web-devicons', -- optional, for file icons
			   },
		    
         tag = 'nightly' -- optional, updated every week. (see issue #1193)
	  }
	
	use { 'nvim-tree/nvim-web-devicons'}
	  
	use {'neoclide/coc.nvim', branch = 'release'}

	use {'benmills/vimux', config = function() vim.g.VimuxOrientation = 'v' end}

	use { 'nvim-treesitter/nvim-treesitter'} 

	use {"lukas-reineke/indent-blankline.nvim"}

  use { 'karb94/neoscroll.nvim' }

  use {'tpope/vim-fugitive'}

	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { 
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-live-grep-args.nvim' },
        },
        config = function()
            require('telescope').load_extension('live_grep_args')
        end
      }

  print('Packer ran')

end)
