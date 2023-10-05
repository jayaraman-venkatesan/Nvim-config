local ensure_packer = function()
  local fn = vim.fn
 local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end




local packer_bootstrap = ensure_packer()

  
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status,packer  = pcall(require,"packer")

if not status then
  return
end


return packer.startup(function (use)

  use("wbthomason/packer.nvim")

  use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme


  


  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
  
  
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
 
  use("szw/vim-maximizer") -- maximizes and restores current window


  use("nvim-lualine/lualine.nvim")
  
  use ("williamboman/mason.nvim")


  
    use("williamboman/mason-lspconfig.nvim")


  use("nvim-lua/plenary.nvim") -- Lua functions that Telescope plugin use
  use("nvim-telescope/telescope.nvim")
  -- essential plugins
    
  use( 'neovim/nvim-lspconfig')
  use( 'hrsh7th/cmp-nvim-lsp')
  use( 'hrsh7th/cmp-buffer')
  use( 'hrsh7th/cmp-path')
  use( 'hrsh7th/cmp-cmdline')
  use( 'hrsh7th/nvim-cmp')


  use( 'hrsh7th/cmp-vsnip')
  use( 'hrsh7th/vim-vsnip')

 use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)


  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

 -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

 if packer_bootstrap then
    require("packer").sync()
  end
end)
