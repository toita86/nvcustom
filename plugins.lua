-- lua/nvcustom/plugins.lua

return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Add your parsers to the existing list
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "markdown",
        "haskell",
        "yaml",
      })

      -- Add or override highlight settings
      opts.highlight = opts.highlight or {}
      opts.highlight.enable = true
      opts.highlight.use_language_tree = true
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- use the latest stable release
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
}

