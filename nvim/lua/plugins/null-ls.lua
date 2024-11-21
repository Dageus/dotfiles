return {
  'jose-elias-alvarez/null-ls.nvim',
  event = 'VeryLazy',
  opts = function(_, opts)
    local null_ls = require 'null-ls'

    opts.sources = {
      null_ls.builtins.formatting.clang_format,
    }
  end,
}
