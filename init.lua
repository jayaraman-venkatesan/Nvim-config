require("jayaram.plugins-setup")
require("jayaram.core.options")
require("jayaram.core.keymaps")
require("jayaram.core.colorscheme")
require("lualine").setup()
require("nvim-tree").setup()
require("plenary")
require("telescope").setup()
require("jayaram.plugins.cmp-config")
require("jayaram.plugins.treesitter")

require("mason").setup({

  path = "prepend",
  ui = {
    icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
    }
}
})

require('jayaram.plugins.autopairs')



require('mason-lspconfig').setup()



