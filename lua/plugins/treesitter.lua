require'nvim-treesitter.configs'.setup {
  -- 添加不同语言
  ensure_installed = { 
    "javascript", 
    "typescript", 
    "tsx", 
    "json", 
    "css", 
    "go",
    "python", 
    "rust", 
    "bash", 
    "lua", 
    "vim", 
  }, 

  highlight = { enable = true },
  indent = { enable = true },

  -- 不同括号颜色区分
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
