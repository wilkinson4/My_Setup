return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Development
  use { 'liuchengxu/vim-which-key' }
  --Telescope
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-lua/popup.nvim'}
  use {'nvim-telescope/telescope.nvim'}
  use {
      'nvim-telescope/telescope-frecency.nvim',
      requires = {'tami5/sql.nvim'},
      config = function()
          require('telescope').load_extension('frecency')
      end
  }
  use {'nvim-telescope/telescope-symbols.nvim'}
  use {'nvim-telescope/telescope-github.nvim'}
  -- Lua config
  use { 'neovim/nvim-lspconfig' }
  -- Lua development
  use {'tjdevries/nlua.nvim'}
  use { 'hrsh7th/nvim-compe' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'hrsh7th/vim-vsnip-integ' }
  use {'rafamadriz/friendly-snippets'}
  use { 'xabikos/vscode-javascript' }
  use { 'sbdchd/neoformat' }
  -- Better syntax
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use { 'p00f/nvim-ts-rainbow' }
  use { 'kristijanhusak/vim-dadbod-completion' }
  -- Better LSP experience
  use {'glepnir/lspsaga.nvim'}
  use {'onsails/lspkind-nvim'}
  use {'ray-x/lsp_signature.nvim'}
  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    -- config = function() require'my_statusline' end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)
