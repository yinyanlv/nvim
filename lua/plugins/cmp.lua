local cmp = require('cmp')

cmp.setup({
  -- 指定 snippet 引擎
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  -- 补全源
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, { 
    { name = 'buffer' },
    { name = 'path' }
  }),
  -- 快捷键设置
  mapping = require('core.keymaps').cmp(cmp),
})