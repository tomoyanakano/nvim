return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "windwp/nvim-ts-autotag", "JoosepAlviste/nvim-ts-context-commentstring" },
    event = "User AstroFile",
    cmd = {
      "TSBufDisable",
      "TSBufEnable",
      "TSBufToggle",
      "TSDisable",
      "TSEnable",
      "TSToggle",
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSModuleInfo",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
    },
    build = ":TSUpdate",
    opts = {
      highlight = {
        enable = true,
        use_languagetree = true,
        disable = function(_, bufnr) return vim.api.nvim_buf_line_count(bufnr) > 10000 end,
      },
      incremental_selection = { enable = true },
      indent = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
    },
    config = function()
      local parser_configs = require "nvim-treesitter.parsers".get_parser_configs()
      parser_configs.liquid = {
        install_info = {
          url = "https://github.com/Shopify/tree-sitter-liquid.git",
          files = { "src/parser.c" },
          branch = "main",
          generate_requires_npm = false,
          requires_generate_from_grammar = false,
        },
        filetype = "liquid",
      }
    end
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      local ts_autotag = require('nvim-ts-autotag')
      ts_autotag.setup({
        filetypes = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue", "jsx", "tsx",
          "liquid", "lua" },
      })
    end,
    lazy = true,
    event = "VeryLazy"
  },
}
